 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link ${fn:endsWith(pageContext.request.requestURI, '/home') ? 'active' : 'collapsed'}" href="${pageContext.request.contextPath}/home">
          <i class="bi bi-house-door"></i>
          <span>Trang chủ</span>
        </a>
      </li><!-- End Dashboard Nav -->
      
       <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/booking-management">
          <i class="bi bi-calendar-check"></i>
          <span>Đơn đặt phòng</span>
        </a>
      </li><!-- End Dashboard Nav -->
      

      <li class="nav-item">
        <a class="nav-link ${fn:endsWith(pageContext.request.requestURI, '/accounts') ? 'active' : 'collapsed'}" href="${pageContext.request.contextPath}/accounts">
          <i class="bi bi-person"></i>
          <span>Tài khoản</span>
        </a>
      </li><!-- End Dashboard Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/customers">
          <i class="bi bi-people"></i>
          <span>Khách hàng</span>
        </a>
      </li><!-- End Dashboard Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-building-gear"></i><span>Cơ sở vật chất</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/floors">
              <i class="bi bi-buildings"></i><span>Các tầng</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/rooms">
              <i class="bi bi-door-closed"></i><span>Các phòng</span>
            </a>
          </li>
          
          <li>
            <a href="${pageContext.request.contextPath}/room_type">
              <i class="bi bi-door-open"></i><span>Loại phòng</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>Thống kê</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>Chart.js</span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span>ApexCharts</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>ECharts</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Icons</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="icons-bootstrap.html">
              <i class="bi bi-circle"></i><span>Bootstrap Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Remix Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Boxicons</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">Người quản trị</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/profile-admin?id=${sessionScope.user.user_id}">
          <i class="bi bi-person-lock"></i>
          <span>Hồ sơ</span>
        </a>
      </li><!-- End Profile Page Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-blank.html">
          <i class="bi bi-file-earmark"></i>
          <span>Blank</span>
        </a>
      </li><!-- End Blank Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->
