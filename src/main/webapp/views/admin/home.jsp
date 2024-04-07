<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>InfumiStore - ${tendanhsach}</title>
<style type="text/css">
	<%@include file="/css/index.css" %>
    <%@include file="/css/all.min.css" %>
    <%@include file="/css/bootstrap.min.css" %>
</style>
<script src="https://kit.fontawesome.com/3fc1a1203a.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</head>
<body class="bg-light-grey">
  <fmt:setLocale value="vi_VN"/>
  <jsp:include page="/views/jspmodule/admin-navbar.jsp"/>
  
  <div class="container-fluid bg-white border p-3">
    <div class="container d-flex">
      <h5 class="my-auto">Quản Lý</h5>
      <nav>
        <ol class="breadcrumb ms-3 my-auto">
          <li class="breadcrumb-item ">Trang Chủ</li>
          <li class="breadcrumb-item active" aria-current="page">Tất Cả</li>
        </ol>
      </nav>
    </div>
  </div>
  <div class="container bg-white rounded-3 mt-3 p-3">
    <a class="btn btn-primary mb-3" href="${pageContext.request.contextPath}/admin/product/create">Thêm Sách Mới</a>
    <button class="btn btn-secondary  mb-3">Thêm Nhà Cung Cấp</button>
    <button class="btn btn-secondary mb-3">Thêm Nhà Xuất Bản</button>
    <button class="btn btn-secondary mb-3">Thêm Tác Giả</button>
    <button class="btn btn-secondary mb-3">Thêm Thể Loại</button>
    <button class="btn btn-secondary mb-3">Thêm Phân Loại</button>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Ảnh</th>
          <th scope="col">Tên Sách</th>
          <th scope="col">Tác Giả</th>
          <th scope="col">SL</th>
          <th scope="col">Tên NCC</th>
          <th scope="col">NXB</th>
          <th scope="col">Năm XB</th>
          <th scope="col">Ngôn Ngữ</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach var="item" items="${products}">
      		<tr>
	          <th scope="row">${item.id}</th>
	          <td style="width: 65px;">
	            <img src="${pageContext.request.contextPath}/images/${item.anhSanPhams[0].ten}" alt="" style="width: 65px; object-fit: contain;">
	          </td>
	          <td>${item.tieuDe }</td>
	          <td>${item.tacGia}</td>
	          <td>${item.soLuong}</td>
	          <td>${item.nhaCungCap.shortName}</td>
	          <td>${item.nhaXuatBan.ten}</td>
	          <td>${item.namXuatBan}</td>
	          <td>${item.ngonNgu}</td>
	          <td class="d-flex">
	            <a href="${pageContext.request.contextPath}/admin/product/edit?id=${item.id}" class="btn btn-primary">Edit</a>
	            <a href="${pageContext.request.contextPath}/admin/product/delete?id=${item.id}" class="btn btn-danger ms-2">Delete</a>
	          </td>
        	</tr>
      	</c:forEach>
      </tbody>
    </table>
  </div>
  
  <div class="container bg-white rounded-3 mt-3 p-3">
    <button class="btn btn-primary mb-3">Thêm Nhân Viên Mới</button>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Ảnh</th>
          <th scope="col">Tên Sách</th>
          <th scope="col">Tác Giả</th>
          <th scope="col">SL</th>
          <th scope="col">Tên NCC</th>
          <th scope="col">NXB</th>
          <th scope="col">Năm XB</th>
          <th scope="col">Ngôn Ngữ</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td style="width: 65px;">
            <img src="images/duoc_su_tu_su_tieu_thuyet_tap_4.jpg" alt="" style="width: 65px; object-fit: contain;">
          </td>
          <td>[Light Novel] Dược Sư Tự Sự - Tập 4 - Tặng Kèm Bookmark + Bìa Áo Đặc Biệt</td>
          <td>Natsu Hyuuga, Touko Shino</td>
          <td>10</td>
          <td>Kim Đồng</td>
          <td>Kim Đồng</td>
          <td>2022</td>
          <td>Tiếng Việt</td>
          <td class="d-flex">
            <a href="" class="btn btn-primary">Edit</a>
            <a href="" class="btn btn-danger ms-2">Delete</a>
          </td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td style="width: 65px;">
            <img src="images/duoc_su_tu_su_tieu_thuyet_tap_4.jpg" alt="" style="width: 65px; object-fit: contain;">
          </td>
          <td>[Light Novel] Dược Sư Tự Sự - Tập 4 - Tặng Kèm Bookmark + Bìa Áo Đặc Biệt</td>
          <td>Natsu Hyuuga, Touko Shino</td>
          <td>10</td>
          <td>Kim Đồng</td>
          <td>Kim Đồng</td>
          <td>2022</td>
          <td>Tiếng Việt</td>
          <td class="d-flex">
            <a href="" class="btn btn-primary">Edit</a>
            <a href="" class="btn btn-danger ms-2">Delete</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  
  <div class="container bg-white rounded-3 mt-3 p-3">
  Hóa Đơn
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Ảnh</th>
          <th scope="col">Tên Sách</th>
          <th scope="col">Tác Giả</th>
          <th scope="col">SL</th>
          <th scope="col">Tên NCC</th>
          <th scope="col">NXB</th>
          <th scope="col">Năm XB</th>
          <th scope="col">Ngôn Ngữ</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td style="width: 65px;">
            <img src="images/duoc_su_tu_su_tieu_thuyet_tap_4.jpg" alt="" style="width: 65px; object-fit: contain;">
          </td>
          <td>[Light Novel] Dược Sư Tự Sự - Tập 4 - Tặng Kèm Bookmark + Bìa Áo Đặc Biệt</td>
          <td>Natsu Hyuuga, Touko Shino</td>
          <td>10</td>
          <td>Kim Đồng</td>
          <td>Kim Đồng</td>
          <td>2022</td>
          <td>Tiếng Việt</td>
          <td class="d-flex">
            <a href="" class="btn btn-primary">Edit</a>
            <a href="" class="btn btn-danger ms-2">Delete</a>
          </td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td style="width: 65px;">
            <img src="images/duoc_su_tu_su_tieu_thuyet_tap_4.jpg" alt="" style="width: 65px; object-fit: contain;">
          </td>
          <td>[Light Novel] Dược Sư Tự Sự - Tập 4 - Tặng Kèm Bookmark + Bìa Áo Đặc Biệt</td>
          <td>Natsu Hyuuga, Touko Shino</td>
          <td>10</td>
          <td>Kim Đồng</td>
          <td>Kim Đồng</td>
          <td>2022</td>
          <td>Tiếng Việt</td>
          <td class="d-flex">
            <a href="" class="btn btn-primary">Edit</a>
            <a href="" class="btn btn-danger ms-2">Delete</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  
</body>

</html>