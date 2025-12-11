<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/admin/ad_header.jsp"%>
<%@include file="/admin/ad_sidebar.jsp"%>


<style>
    /* Mặc định: Giới hạn chiều cao, ẩn phần thừa, không cuộn */
    .activity-list-wrapper {
        max-height: 400px; /* Điều chỉnh số này sao cho vừa khít 6 items của bạn */
        overflow: hidden; 
        transition: max-height 0.3s ease; /* Hiệu ứng mượt */
        position: relative;
    }

    /* Khi mở rộng: Giữ nguyên chiều cao hoặc tăng thêm chút, nhưng cho phép cuộn */
    .activity-list-wrapper.expanded {
        max-height: 500px; /* Có thể tăng lên nếu muốn khung to ra */
        overflow-y: auto;  /* Hiện thanh cuộn dọc */
    }
    
    /* Tùy chỉnh thanh cuộn cho đẹp (Webkit browsers) */
    .activity-list-wrapper::-webkit-scrollbar {
        width: 6px;
    }
    .activity-list-wrapper::-webkit-scrollbar-thumb {
        background-color: #ccc;
        border-radius: 4px;
    }
</style>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>Dashboard</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row">

					<!-- Sales Card -->
					<div class="col-xxl-6 col-md-6">
						<div class="card info-card sales-card" id="sales-card"
							data-today="${bookingToday}" data-month="${bookingMonth}"
							data-year="${bookingYear}">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start"><h6>Bộ lọc</h6></li>
									<li><a class="dropdown-item" href="javascript:void(0)"
										onclick="updateFilter('sales', 'today', 'Hôm nay')">Hôm
											nay</a></li>
									<li><a class="dropdown-item" href="javascript:void(0)"
										onclick="updateFilter('sales', 'month', 'Tháng này')">Tháng
											này</a></li>
									<li><a class="dropdown-item" href="javascript:void(0)"
										onclick="updateFilter('sales', 'year', 'Năm này')">Năm này</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Đơn đặt phòng <span id="sales-filter-label">| Hôm nay</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart"></i>
									</div>
									<div class="ps-3">
										<h6 id="sales-value">${bookingToday}</h6>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Sales Card -->


					<!-- Customers Card -->
					<div class="col-xxl-6 col-xl-12">


						<div class="card info-card customers-card" id="customers-card"
							data-today="${customerToday}" data-month="${customerMonth}"
							data-year="${customerYear}">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start"><h6>Bộ lọc</h6></li>
									<li><a class="dropdown-item" href="javascript:void(0)"
										onclick="updateFilter('customers', 'today', 'Hôm nay')">Hôm
											nay</a></li>
									<li><a class="dropdown-item" href="javascript:void(0)"
										onclick="updateFilter('customers', 'month', 'Tháng này')">Tháng
											này </a></li>
									<li><a class="dropdown-item" href="javascript:void(0)"
										onclick="updateFilter('customers', 'year', 'Năm này')">Năm
											này </a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Khách hàng <span id="customers-filter-label">| Hôm nay</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6 id="customers-value">${customerToday}</h6>

									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- End Customers Card -->


					<!-- Revenue Card -->
					<div class="col-12">
						<div class="col-12">
							<div class="card info-card revenue-card" id="revenue-card"
								data-today="${revenueToday}" data-month="${revenueMonth}"
								data-year="${revenueYear}">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start"><h6>Bộ lọc</h6></li>
										<li><a class="dropdown-item" href="javascript:void(0)"
											onclick="updateFilter('revenue', 'today', 'Hôm nay')">Hôm
												nay</a></li>
										<li><a class="dropdown-item" href="javascript:void(0)"
											onclick="updateFilter('revenue', 'month', 'Tháng này')">Tháng
												này </a></li>
										<li><a class="dropdown-item" href="javascript:void(0)"
											onclick="updateFilter('revenue', 'year', 'Năm này')">Năm
												này </a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Doanh thu <span id="revenue-filter-label">| Hôm nay</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6 id="revenue-value">${revenueToday}</h6>

										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- End Revenue Card -->

					<div class="col-12">
						<div class="card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Bộ lọc</h6>
									</li>
									<li><a class="dropdown-item" href="#">Tháng này</a></li>
									<li><a class="dropdown-item" href="#">Năm này</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Thống kê đặt phòng <span id="filterLabel">| Tháng này</span>
								</h5>

								<div id="reportsChart"></div>

								<script>
						                document.addEventListener("DOMContentLoaded", () => {
						                    
						                    // --- 1. LẤY DỮ LIỆU TỪ CONTROLLER ---
						                    
						                    // Dữ liệu cho "Tháng này" (Đã có trong code cũ)
						                    const catsMonth = JSON.parse('${chartCategoriesMonth}');
						                    const seriesMonth = JSON.parse('${chartSeriesMonth}');
						
						                    // Dữ liệu cho "Năm này" (Lấy từ biến chartCategories/chartSeries mà controller đã gửi ở dòng 145-146)
						                    const catsYear = JSON.parse('${chartCategories}');
						                    const seriesYear = JSON.parse('${chartSeries}');
						
						                    // --- 2. KHỞI TẠO BIỂU ĐỒ (Mặc định là Tháng) ---
						                    
						                    var options = {
						                        series: seriesMonth,
						                        chart: {
						                            height: 350,
						                            type: 'area',
						                            toolbar: { show: false },
						                        },
						                        markers: { size: 4 },
						                        colors: ['#dc3545', '#4154f1', '#2eca6a'],
						                        fill: {
						                            type: "gradient",
						                            gradient: {
						                                shadeIntensity: 1,
						                                opacityFrom: 0.3,
						                                opacityTo: 0.4,
						                                stops: [0, 90, 100]
						                            }
						                        },
						                        dataLabels: { enabled: false },
						                        stroke: { curve: 'smooth', width: 2 },
						                        xaxis: {
						                            type: 'category',
						                            categories: catsMonth // Mặc định trục X là tháng
						                        },
						                        tooltip: {
						                            x: { format: 'dd/MM/yyyy' },
						                        }
						                    };
						
						                    // Tạo biến chart toàn cục để có thể update sau này
						                    var chart = new ApexCharts(document.querySelector("#reportsChart"), options);
						                    chart.render();
						
						                    // --- 3. XỬ LÝ SỰ KIỆN CLICK BỘ LỌC ---
						
						                    const filterItems = document.querySelectorAll('.filter .dropdown-item');
						                    const filterLabel = document.getElementById('filterLabel');
						
						                    filterItems.forEach(item => {
						                        item.addEventListener('click', (e) => {
						                            e.preventDefault(); // Ngăn load lại trang
						                            const text = e.target.innerText.trim();
						
						                            if (text === "Tháng này") {
						                                // Cập nhật tiêu đề
						                                filterLabel.innerText = "| Tháng này";
						                                
						                                // Cập nhật dữ liệu biểu đồ sang Tháng
						                                chart.updateOptions({
						                                    xaxis: { categories: catsMonth }
						                                });
						                                chart.updateSeries(seriesMonth);
						                            } 
						                            else if (text === "Năm này") {
						                                // Cập nhật tiêu đề
						                                filterLabel.innerText = "| Năm này";
						
						                                // Cập nhật dữ liệu biểu đồ sang Năm (dùng biến catsYear/seriesYear)
						                                chart.updateOptions({
						                                    xaxis: { categories: catsYear }
						                                });
						                                chart.updateSeries(seriesYear);
						                            }
						                        });
						                    });
						
						                });
           						 </script>

							</div>
						</div>
					</div>
					<!-- Recent Sales -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Filter</h6>
									</li>

									<li><a class="dropdown-item" href="#">Today</a></li>
									<li><a class="dropdown-item" href="#">This Month</a></li>
									<li><a class="dropdown-item" href="#">This Year</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Recent Sales <span>| Today</span>
								</h5>

								<table class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Customer</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><a href="#">#2457</a></th>
											<td>Brandon Jacob</td>
											<td><a href="#" class="text-primary">At praesentium
													minu</a></td>
											<td>$64</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2147</a></th>
											<td>Bridie Kessler</td>
											<td><a href="#" class="text-primary">Blanditiis
													dolor omnis similique</a></td>
											<td>$47</td>
											<td><span class="badge bg-warning">Pending</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2049</a></th>
											<td>Ashleigh Langosh</td>
											<td><a href="#" class="text-primary">At recusandae
													consectetur</a></td>
											<td>$147</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Angus Grady</td>
											<td><a href="#" class="text-primar">Ut voluptatem id
													earum et</a></td>
											<td>$67</td>
											<td><span class="badge bg-danger">Rejected</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Raheem Lehner</td>
											<td><a href="#" class="text-primary">Sunt similique
													distinctio</a></td>
											<td>$165</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Recent Sales -->

					<!-- Top Selling -->
					<div class="col-12">
						<div class="card top-selling overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Filter</h6>
									</li>

									<li><a class="dropdown-item" href="#">Today</a></li>
									<li><a class="dropdown-item" href="#">This Month</a></li>
									<li><a class="dropdown-item" href="#">This Year</a></li>
								</ul>
							</div>

							<div class="card-body pb-0">
								<h5 class="card-title">
									Top Selling <span>| Today</span>
								</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">Preview</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Sold</th>
											<th scope="col">Revenue</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><a href="#"><img
													src="admin/assets/img/product-1.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Ut
													inventore ipsa voluptas nulla</a></td>
											<td>$64</td>
											<td class="fw-bold">124</td>
											<td>$5,828</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="admin/assets/img/product-2.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Exercitationem
													similique doloremque</a></td>
											<td>$46</td>
											<td class="fw-bold">98</td>
											<td>$4,508</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="admin/assets/img/product-3.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Doloribus
													nisi exercitationem</a></td>
											<td>$59</td>
											<td class="fw-bold">74</td>
											<td>$4,366</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="admin/assets/img/product-4.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Officiis
													quaerat sint rerum error</a></td>
											<td>$32</td>
											<td class="fw-bold">63</td>
											<td>$2,016</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="admin/assets/img/product-5.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Sit
													unde debitis delectus repellendus</a></td>
											<td>$79</td>
											<td class="fw-bold">41</td>
											<td>$3,239</td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Top Selling -->

				</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<div class="col-lg-4">
					    <div class="card">
					        <div class="card-body">
					            <h5 class="card-title">Hoạt động gần đây</h5>
					
					            <div class="activity activity-list-wrapper" id="activityList">
					                
					                <c:forEach items="${recentActivityList}" var="item" varStatus="loop">
					                    <div class="activity-item d-flex">
					                        <div class="activite-label text-truncate" style="width: 80px;">${item.timeAgo}</div>
					                        
					                        <c:choose>
					                            <c:when test="${item.statusId == 1}"><i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i></c:when>
					                            <c:when test="${item.statusId == 2}"><i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i></c:when>
					                            <c:when test="${item.statusId == 4}"><i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i></c:when>
					                            <c:when test="${item.statusId == 6}"><i class='bi bi-circle-fill activity-badge text-success align-self-start'></i></c:when>
					                            <c:when test="${item.statusId == 7}"><i class='bi bi-circle-fill activity-badge text-info align-self-start'></i></c:when>
					                            <c:otherwise><i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i></c:otherwise>
					                        </c:choose>
					
					                        <div class="activity-content">
					                            <span class="fw-bold text-dark">${item.customerName}</span>
					                            <c:choose>
					                                <c:when test="${item.statusId == 1}">vừa đặt phòng</c:when>
					                                <c:when test="${item.statusId == 2}">đã được xác nhận</c:when>
					                                <c:when test="${item.statusId == 3}">đã hủy phòng</c:when>
					                                <c:when test="${item.statusId == 6}">đã trả phòng</c:when>
					                                <c:when test="${item.statusId == 7}">đã đánh giá</c:when>
					                                <c:otherwise>tương tác với</c:otherwise>
					                            </c:choose>
					                            <a href="#" class="fw-bold text-dark"> ${item.roomName}</a>
					                        </div>
					                    </div>
					                </c:forEach>
					                
					                <c:if test="${empty recentActivityList}">
					                    <div class="text-center p-3">Chưa có hoạt động nào.</div>
					                </c:if>
					
					            </div> <c:if test="${recentActivityList.size() > 6}">
					                <div class="text-center mt-3">
					                    <button class="btn btn-outline-primary btn-sm" onclick="toggleActivity()" id="btnViewMore">
					                        Xem tất cả <i class="bi bi-chevron-down"></i>
					                    </button>
					                </div>
					            </c:if>
					
					        </div>
					    </div>
					</div>
				<!-- End Recent Activity -->

				<!-- Budget Report -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

					<div class="card-body pb-0">
						<h5 class="card-title">
							Budget Report <span>| This Month</span>
						</h5>

						<div id="budgetChart" style="min-height: 400px;" class="echart"></div>

						<script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                    legend: {
                      data: ['Allocated Budget', 'Actual Spending']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Allocated Budget'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Actual Spending'
                        }
                      ]
                    }]
                  });
                });
              </script>

					</div>
				</div>
				<!-- End Budget Report -->

				<!-- Website Traffic -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

					<div class="card-body pb-0">
						<h5 class="card-title">
							Website Traffic <span>| Today</span>
						</h5>

						<div id="trafficChart" style="min-height: 400px;" class="echart"></div>

						<script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              </script>

					</div>
				</div>
				<!-- End Website Traffic -->

				<!-- News & Updates Traffic -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

					<div class="card-body pb-0">
						<h5 class="card-title">
							News &amp; Updates <span>| Today</span>
						</h5>

						<div class="news">
							<div class="post-item clearfix">
								<img src="admin/assets/img/news-1.jpg" alt="">
								<h4>
									<a href="#">Nihil blanditiis at in nihil autem</a>
								</h4>
								<p>Sit recusandae non aspernatur laboriosam. Quia enim
									eligendi sed ut harum...</p>
							</div>

							<div class="post-item clearfix">
								<img src="admin/assets/img/news-2.jpg" alt="">
								<h4>
									<a href="#">Quidem autem et impedit</a>
								</h4>
								<p>Illo nemo neque maiores vitae officiis cum eum turos elan
									dries werona nande...</p>
							</div>

							<div class="post-item clearfix">
								<img src="admin/assets/img/news-3.jpg" alt="">
								<h4>
									<a href="#">Id quia et et ut maxime similique occaecati ut</a>
								</h4>
								<p>Fugiat voluptas vero eaque accusantium eos. Consequuntur
									sed ipsam et totam...</p>
							</div>

							<div class="post-item clearfix">
								<img src="admin/assets/img/news-4.jpg" alt="">
								<h4>
									<a href="#">Laborum corporis quo dara net para</a>
								</h4>
								<p>Qui enim quia optio. Eligendi aut asperiores enim
									repellendusvel rerum cuder...</p>
							</div>

							<div class="post-item clearfix">
								<img src="admin/assets/img/news-5.jpg" alt="">
								<h4>
									<a href="#">Et dolores corrupti quae illo quod dolor</a>
								</h4>
								<p>Odit ut eveniet modi reiciendis. Atque cupiditate libero
									beatae dignissimos eius...</p>
							</div>

						</div>
						<!-- End sidebar recent posts-->

					</div>
				</div>
				<!-- End News & Updates -->

			</div>
			<!-- End Right side columns -->

		</div>
	</section>

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->

<!-- End Footer -->

<a href="#"
	class="back-to-top d-flex align-items-center justify-content-center"><i
	class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="admin/assets/vendor/chart.js/chart.umd.js"></script>
<script src="admin/assets/vendor/echarts/echarts.min.js"></script>
<script src="admin/assets/vendor/quill/quill.js"></script>
<script src="admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="admin/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="admin/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="admin/assets/js/mainadmin.js"></script>

<script>
/**
 * Hàm cập nhật dữ liệu Card khi chọn Filter
 * @param {string} cardName - Tên loại card ('sales', 'customers', 'revenue')
 * @param {string} timeFrame - Khoảng thời gian ('today', 'month', 'year')
 * @param {string} labelText - Chữ hiển thị trên tiêu đề ('Today', 'This Month', ...)
 */
function updateFilter(cardName, timeFrame, labelText) {
    // 1. Lấy thẻ Card cha dựa trên ID
    const cardElement = document.getElementById(cardName + '-card');
    
    // 2. Lấy dữ liệu từ thuộc tính data- (được JSP render sẵn)
    let value = cardElement.getAttribute('data-' + timeFrame);

    // Xử lý trường hợp dữ liệu null hoặc rỗng
    if (!value || value === 'null') {
        value = 0;
    }

    // 3. Xử lý format tiền tệ riêng cho Revenue
    if (cardName === 'revenue') {
        // Chuyển string sang số float để format
        let money = parseFloat(value);
        
        // **********************************************
        // THAY ĐỔI TẠI ĐÂY: Dùng Locale 'vi-VN' và Currency 'VND'
        value = new Intl.NumberFormat('vi-VN', { 
            style: 'currency', 
            currency: 'VND' 
        }).format(money);
        // **********************************************
        
    }

    // 4. Cập nhật Text tiêu đề (VD: | This Month)
    const labelSpan = document.getElementById(cardName + '-filter-label');
    labelSpan.innerText = "| " + labelText;

    // 5. Cập nhật Giá trị chính (VD: 145, 3.200.000 ₫)
    const valueH6 = document.getElementById(cardName + '-value');
    valueH6.innerText = value;
}
 document.addEventListener("DOMContentLoaded", function() {
	    // 1. Lấy giá trị mặc định (Doanh thu đang mặc định hiển thị Home nay)
	    const revenueElement = document.getElementById('revenue-value');
	    let rawValue = revenueElement.innerText.trim();
	    
	    if (rawValue && rawValue !== 'null' && !isNaN(parseFloat(rawValue))) {
	        let money = parseFloat(rawValue);
	        
	        // Định dạng VNĐ
	        let formattedValue = new Intl.NumberFormat('vi-VN', { 
	            style: 'currency', 
	            currency: 'VND' 
	        }).format(money);
	        
	        // Cập nhật giá trị
	        revenueElement.innerText = formattedValue;
	    }
	});
</script>

<script>
    function toggleActivity() {
        var wrapper = document.getElementById("activityList");
        var btn = document.getElementById("btnViewMore");

        // Kiểm tra xem đang mở hay đóng
        if (wrapper.classList.contains("expanded")) {
            // Đang mở -> Đóng lại (Thu gọn)
            wrapper.classList.remove("expanded");
            btn.innerHTML = 'Xem tất cả <i class="bi bi-chevron-down"></i>';
            
            // Cuộn nhẹ lại lên đầu danh sách để user không bị hụt hẫng
            wrapper.scrollTop = 0; 
        } else {
            // Đang đóng -> Mở ra (Scroll view)
            wrapper.classList.add("expanded");
            btn.innerHTML = 'Thu gọn <i class="bi bi-chevron-up"></i>';
        }
    }
</script>
</body>

</html>