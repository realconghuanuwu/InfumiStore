<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- nav -->
  <nav class="d-flex justify-content-end align-items-center bg-white py-3">
    <a class="btn btn-primary position-absolute" style="left:-5px" data-bs-toggle="offcanvas" href="#offcanvasExample"
      role="button" aria-controls="offcanvasExample">
      <i class="fa-solid fa-caret-right"></i>
    </a>
    <div class="position-relative">
      <span class="badge bg-danger text-light position-absolute  rounded-pill" style="top: -7px; left: 19px;">44</span>
      <i class="fa-solid fa-envelope fs-3 me-5"></i>
    </div>
    <div class="position-relative">
      <span class="badge bg-danger text-light position-absolute  rounded-pill" style="top: -7px; left: 15px;">44</span>
      <i class="fa-solid fa-bell fs-3 me-5"></i>
    </div>



    <img src="images/social-media/Icon_of_Zalo.svg.png" alt="" class="img-thumbnail rounded me-3 " width="50px"
      height="50px">
    <div class="d-block me-5">
      <p class="my-0 fw-bold ">Công Huấn</p>
      <p class="my-0 text-primary">Admin</p>
    </div>
  </nav>
  <!-- offcanvas - side nav-->
  <div class="offcanvas offcanvas-start" style="width: 12.5rem;" tabindex="-1" id="offcanvasExample"
    aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
      <a class="btn btn-primary position-absolute px-5" style="right:-16px;top: 1.35rem;" data-bs-dismiss="offcanvas">
        <i class="fa-solid fa-caret-left"></i>
      </a>
    </div>
    <div class="offcanvas-body mt-5">
      <a href="${pageContext.request.contextPath}/admin/home" class="text-deco-none">
        <div class="d-flex py-2 my-3 text-primary">
          <i class="fa-solid fa-house my-auto" style="font-size: 25px;"></i>
          <p style="" class="fw-bold mx-auto my-auto">Trang Chủ</p>
        </div>
      </a>
      <a href="#" class="text-deco-none">
        <div class="d-flex py-2 my-3">
          <i class="fa-solid fa-flag my-auto" style="font-size: 25px;"></i>
          <p style="" class="fw-bold mx-auto my-auto">Báo Cáo</p>
        </div>
      </a>
    </div>
  </div>