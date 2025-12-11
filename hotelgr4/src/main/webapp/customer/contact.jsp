<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/customer/header.jsp"%>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title light-background">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Liên hệ</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Trang Chủ</a></li>
            <li class="current">Liên hệ</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Contact Section -->
    <section id="contact" class="contact section">

      <!-- Map Section -->
      <div class="map-container mb-5">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.059516253107!2d105.84296037508086!3d21.03030448061931!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abf0720a11ed%3A0x6b72eb0861b71229!2sSan%20Premium%20Hotel!5e0!3m2!1svi!2s!4v1761986951700!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <!-- Contact Info -->
        <div class="row g-4 mb-5" data-aos="fade-up" data-aos-delay="300">
          <div class="col-md-6">
            <div class="contact-info-card">
              <div class="icon-box">
                <i class="bi bi-geo-alt"></i>
              </div>
              <div class="info-content">
                <h4>Địa Chỉ</h4>
                <p>36 P. Hà Trung, Hàng Bông, Hoàn Kiếm, Hà Nội</p>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="contact-info-card">
              <div class="icon-box">
                <i class="bi bi-telephone"></i>
              </div>
              <div class="info-content">
                <h4>Điện thoại &amp; Email</h4>
                <p>+84 383-952-771</p>
                <p>2uannene@gmail.com</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Contact Form -->
        <div class="row justify-content-center mb-5" data-aos="fade-up" data-aos-delay="200">
          <div class="col-lg-10">
            <div class="contact-form-wrapper">
              <h2 class="text-center mb-4">Gửi tin nhắn</h2>

              <form action="forms/contact.php" method="post" class="php-email-form">
                <div class="row g-3">
                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control" name="name" placeholder="Họ và Tên" required="">
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="email" class="form-control" name="email" placeholder="Địa Chỉ Email" required="">
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="form-group">
                      <input type="text" class="form-control" name="subject" placeholder="Tiêu Đề" required="">
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="form-group">
                      <textarea class="form-control" name="message" placeholder="Nội Dung Tin Nhắn" rows="6" required=""></textarea>
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="loading">Đang xử lý</div>
                    <div class="error-message"></div>
                    <div class="sent-message">Tin nhắn của bạn đã được gửi. Cảm ơn bạn!</div>
                  </div>

                  <div class="col-12 text-center">
                    <button type="submit" class="btn-submit">GỬI TIN NHẮN</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>

      </div>

    </section><!-- /Contact Section -->

  </main>

 

  <%@include file="/customer/footer.jsp"%>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>