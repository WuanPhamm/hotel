package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.BookingActivityDTO;
import model.booking;
import model.BookingStatistic; // Giả sử import này
import util.ConnectionPoolImpl;

public class bookingDAO implements daoInterface<booking> {

    // 1. Bỏ biến 'private Connection con;' để tránh lỗi giữ kết nối đã đóng
    
    public bookingDAO() {
        // Không mở kết nối ở đây nữa
    }

    public static bookingDAO getIns() {
        return new bookingDAO();
    }

    @Override
    public int insert(booking t) {
        int kq = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        
        try {
            // Lấy kết nối mới cho mỗi thao tác
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            
            String sql = "INSERT INTO booking(booking_time, booking_start_date, booking_end_date, booking_requirements, booking_total, payment_time, room_id, pay_id, bs_id, cus_id, booking_updated_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setTimestamp(1, t.getBooking_time());
            ps.setDate(2, t.getBooking_start_date());
            ps.setDate(3, t.getBooking_end_date());
            ps.setString(4, t.getBooking_requirements());
            ps.setBigDecimal(5, t.getBooking_total());
            ps.setTimestamp(6, t.getPayment_time());
            ps.setInt(7, t.getRoom_id());
            ps.setInt(8, t.getPay_id());
            ps.setInt(9, t.getBs_id());
            ps.setInt(10, t.getCus_id());
            ps.setTimestamp(11, t.getBooking_updated_at());
            
            kq = ps.executeUpdate();
            
            if (kq > 0) {
                generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    t.setBooking_id(generatedKeys.getInt(1));
                }
            }
            
        } catch (Exception e) {
            System.out.println("insert: " + e);
            e.printStackTrace();
        } finally {
            // Đóng resource theo thứ tự ngược lại và trả kết nối về Pool
            closeResources(con, ps, generatedKeys);
        }
        return kq;
    }

    @Override
    public int update(booking t) {
        int kq = 0;
        Connection con = null;
        PreparedStatement ps = null;
        
        String sql = "UPDATE booking SET booking_time=?, booking_start_date=?, booking_end_date=?, "
                + "booking_requirements=?, booking_total=?, payment_time=?, "
                + "room_id=?, pay_id=?, bs_id=?, cus_id=?, booking_updated_at=? "
                + "WHERE booking_id=?";
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);

            Timestamp now = new Timestamp(System.currentTimeMillis());

            ps.setTimestamp(1, t.getBooking_time());
            ps.setDate(2, t.getBooking_start_date());
            ps.setDate(3, t.getBooking_end_date());
            ps.setString(4, t.getBooking_requirements());
            ps.setBigDecimal(5, t.getBooking_total());
            ps.setTimestamp(6, t.getPayment_time());
            ps.setInt(7, t.getRoom_id());
            ps.setInt(8, t.getPay_id());
            ps.setInt(9, t.getBs_id());
            ps.setInt(10, t.getCus_id());
            ps.setTimestamp(11, now); 
            ps.setInt(12, t.getBooking_id());

            kq = ps.executeUpdate();
            
            if(kq > 0) {
                t.setBooking_updated_at(now);
            }
            
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(con, ps, null);
        }
        return kq;
    }

    @Override
    public int delete(booking t) {
        int kq = 0;
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM booking WHERE booking_id = ?";
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            ps.setInt(1, t.getBooking_id());
            kq = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("delete: " + e.getMessage());
        } finally {
            closeResources(con, ps, null);
        }
        return kq;
    }

    @Override
    public ArrayList<booking> selectAll() {
        ArrayList<booking> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM booking ORDER BY booking_time DESC";
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapResultSetToBooking(rs));
            }
        } catch (Exception e) {
            System.out.println("selectAll: " + e.getMessage());
        } finally {
            closeResources(con, ps, rs);
        }
        return list;
    }

    @Override
    public booking selectById(int id) {
        booking b = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM booking WHERE booking_id = ?";
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                b = mapResultSetToBooking(rs);
            }
        } catch (Exception e) {
            System.out.println("selectById: " + e.getMessage());
        } finally {
            closeResources(con, ps, rs);
        }
        return b;
    }

    @Override
    public ArrayList<booking> selectByCondition(String condition) {
        ArrayList<booking> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM booking WHERE " + condition;
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapResultSetToBooking(rs));
            }
        } catch (Exception e) {
            System.out.println("selectByCondition: " + e.getMessage());
        } finally {
            closeResources(con, ps, rs);
        }
        return list;
    }

    public int updateBookingStatus(int booking_id, int new_bs_id) {
        int kq = 0;
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "UPDATE booking SET bs_id = ?, booking_updated_at = ? WHERE booking_id = ?";
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, new_bs_id);
            ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            ps.setInt(3, booking_id);
            
            kq = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateBookingStatus: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(con, ps, null);
        }
        return kq;
    }
    
    public int cancelExpiredBookings(int oldStatus, int newStatus, Date expiryTime) {
        int updatedRows = 0;
        Connection con = null;
        PreparedStatement st = null;
        String sql = "UPDATE booking SET bs_id = ? WHERE bs_id = ? AND booking_time < ?";
        
        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            st = con.prepareStatement(sql);
            
            st.setInt(1, newStatus);
            st.setInt(2, oldStatus);
            st.setTimestamp(3, new java.sql.Timestamp(expiryTime.getTime()));
            
            updatedRows = st.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(con, st, null);
        }
        return updatedRows;
    }
    
    public booking getLastInsertedBooking() {
        booking b = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM booking ORDER BY booking_id DESC LIMIT 1";

        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Dùng hàm map thủ công (setter) như code cũ của bạn hoặc constructor đều được
                b = new booking();
                b.setBooking_id(rs.getInt("booking_id"));
                b.setBooking_time(rs.getTimestamp("booking_time"));
                b.setBooking_start_date(rs.getDate("booking_start_date"));
                b.setBooking_end_date(rs.getDate("booking_end_date"));
                b.setBooking_requirements(rs.getString("booking_requirements"));
                b.setBooking_total(rs.getBigDecimal("booking_total"));
                b.setPayment_time(rs.getTimestamp("payment_time"));
                b.setRoom_id(rs.getInt("room_id"));
                b.setPay_id(rs.getInt("pay_id"));
                b.setBs_id(rs.getInt("bs_id"));
                b.setCus_id(rs.getInt("cus_id"));
                b.setBooking_updated_at(rs.getTimestamp("booking_updated_at"));
            }

        } catch (Exception e) {
            System.out.println("Error at getLastInsertedBooking: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(con, ps, rs);
        }
        return b;
    }
    
    public ArrayList<BookingStatistic> getBookingStatistics() {
        ArrayList<BookingStatistic> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT DATE(booking_updated_at) as booking_date, bs_id, COUNT(*) as quantity "
                   + "FROM booking "
                   + "WHERE bs_id IN (4, 6, 7) AND YEAR(booking_updated_at) = YEAR(CURDATE()) "
                   + "GROUP BY DATE(booking_updated_at), bs_id "
                   + "ORDER BY booking_date ASC";

        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                BookingStatistic stats = new BookingStatistic();
                stats.setBookingDate(rs.getDate("booking_date"));
                stats.setBsId(rs.getInt("bs_id"));
                stats.setQuantity(rs.getInt("quantity"));
                list.add(stats);
            }
        } catch (Exception e) {
            System.out.println("getBookingStatistics: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(con, ps, rs);
        }
        return list;
    }
    
    public ArrayList<BookingStatistic> getBookingStatisticsByMonth() {
        ArrayList<BookingStatistic> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT DATE(booking_updated_at) as booking_date, bs_id, COUNT(*) as quantity "
                   + "FROM booking "
                   + "WHERE bs_id IN (4, 6, 7) AND YEAR(booking_updated_at) = YEAR(CURDATE()) "
                   + "AND MONTH(booking_updated_at) = MONTH(CURDATE()) "
                   + "GROUP BY DATE(booking_updated_at), bs_id "
                   + "ORDER BY booking_date ASC";

        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                BookingStatistic stats = new BookingStatistic();
                stats.setBookingDate(rs.getDate("booking_date"));
                stats.setBsId(rs.getInt("bs_id"));
                stats.setQuantity(rs.getInt("quantity"));
                list.add(stats);
            }
        } catch (Exception e) {
            System.out.println("getBookingStatisticsByMonth: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(con, ps, rs);
        }
        return list;
    }
    
    public List<BookingActivityDTO> getRecentActivities() {
        List<BookingActivityDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT c.cus_lastname, c.cus_firstname, r.room_name, bs.bs_name, bs.bs_id, b.booking_updated_at, b.booking_time " +
                     "FROM booking b " +
                     "JOIN customer c ON b.cus_id = c.cus_id " +
                     "JOIN room r ON b.room_id = r.room_id " +
                     "JOIN booking_status bs ON b.bs_id = bs.bs_id " +
                     "ORDER BY COALESCE(b.booking_updated_at, b.booking_time) DESC LIMIT 50"; 

        try {
            con = ConnectionPoolImpl.getInstance().getConnection("booking");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String fullName = rs.getString("cus_firstname") + " " + rs.getString("cus_lastname");
                Timestamp timeEvent = rs.getTimestamp("booking_updated_at");
                if (timeEvent == null) timeEvent = rs.getTimestamp("booking_time");

                String timeAgoStr = calculateTimeAgo(timeEvent);

                BookingActivityDTO dto = new BookingActivityDTO(
                    fullName,
                    rs.getString("room_name"),
                    rs.getString("bs_name"),
                    rs.getInt("bs_id"),
                    timeAgoStr,
                    timeEvent
                );
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(con, ps, rs);
        }
        return list;
    }

    private String calculateTimeAgo(Timestamp dbTime) {
        if (dbTime == null) return "Vừa xong";
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime past = dbTime.toLocalDateTime();
        Duration duration = Duration.between(past, now);

        long seconds = duration.getSeconds();
        if (seconds < 60) return "Vừa xong"; // Sửa lại một chút cho hợp lý
        long minutes = duration.toMinutes();
        if (minutes < 60) return minutes + " phút trước";
        long hours = duration.toHours();
        if (hours < 24) return hours + " giờ trước";
        long days = duration.toDays();
        return days + " ngày trước";
    }

    // --- Helper Method: Để ánh xạ ResultSet sang Object (Clean Code) ---
    private booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        return new booking(rs.getInt("booking_id"), rs.getTimestamp("booking_time"),
                rs.getDate("booking_start_date"), rs.getDate("booking_end_date"),
                rs.getString("booking_requirements"),
                rs.getBigDecimal("booking_total"),
                rs.getTimestamp("payment_time"),
                rs.getInt("room_id"),
                rs.getInt("pay_id"),
                rs.getInt("bs_id"),
                rs.getInt("cus_id"),
                rs.getTimestamp("booking_updated_at"));
    }
    
    // --- Helper Method: Đóng kết nối tập trung ---
    private void closeResources(Connection con, Statement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) {
                // Trả kết nối về pool
                ConnectionPoolImpl.getInstance().releaseConnection(con, "booking");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}