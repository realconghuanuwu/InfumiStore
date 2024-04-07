<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                    <li class="breadcrumb-item active" aria-current="page">Chỉnh Sửa Sản Phẩm</li>
                </ol>
            </nav>
        </div>
    </div>
    <form method="POST" action="${pageContext.request.contextPath}/admin/product/create" enctype="multipart/form-data">
	    <div class="container bg-white rounded-3 mt-3 p-3">
	        <div class="row">
	            <div class="col-6">
	                <label for="">ID</label>
	                <input type="text" class="form-control" name="id" value="${product.id}" disabled>
	            </div>
	            <div class="col-6">
	                <label for="">Tiêu đề</label>
	                <input type="text" class="form-control" name="tieuDe" value="${product.tieuDe}">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	            	<!-- 
	                <label for="">Tác giả</label>
	                <input type="text" class="form-control" name="tacGia" value="${product.tacGia.hoTen}">
	                 -->
	                <label for="">Đơn giá</label>
	                <input type="text" class="form-control" name="donGia" value="${product.donGia}">
	                <label for="">Trạng thái</label>
	                <input type="text" class="form-control" name="trangThai" value="${product.trangThai}">
	            </div>
	            <div class="col-6">
	            	<c:forEach var="item" items="${product.anhSanPhams}">
	            		<img src="${pageContext.request.contextPath}/images/${item.ten}" alt="${item.ten}" style="width: 100px;">
	            	</c:forEach>
	                <br>
	                <input type="file" class="form-control" accept=".jpg, .jpeg, .png, .gif" multiple>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	                <label for="">Kích thước</label>
	                <input type="text" class="form-control" name="kichThuoc" value="${product.kichThuoc}">
	            </div>
	            <div class="col-6">
	                <label for="">Số trang</label>
	                <input type="text" class="form-control" name="soTrang" value="${product.soTrang}">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	                <label for="">Giảm giá</label>
	                <input type="text" class="form-control" name="giamGia" value="${product.giamGia}">
	            </div>
	            <div class="col-6">
	                <label for="">Ngôn ngữ</label>
	                <input type="text" class="form-control" name="ngonNgu" value="${product.ngonNgu}">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	                <label for="">Kiểu bìa</label>
	                <input type="text" class="form-control" name="kieuBia"  value="${product.kieuBia}">
	            </div>
	            <div class="col-6">
	                <label for="">Số lượng</label>
	                <input type="text" class="form-control" name="soLuong"  value="${product.soLuong}">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	                <label for="">Độ tuổi</label>
	                <input type="text" class="form-control" name="doTuoi" value="${product.doTuoi}">
	            </div>
	            <div class="col-6">
	                <label for="">Người dịcn</label>
	                <input type="text" class="form-control" name="nguoiDich" value="${product.nguoiDich}">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	                <label for="">Cân nặng</label>
	                <input type="text" class="form-control" name="canNang" value="${product.canNang}">
	            </div>
	            <div class="col-6">
	            	<!-- 
	                <label for="">Thể loại</label>
	                <input type="text" class="form-control" name="" value="${product.theLoai.tenTheLoai}">
	                -->
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-6">
	            	<!-- 
	                <label for="">Nhà xuất bản</label>
	                <input type="text" class="form-control" name=" " value="${product.nhaXuatBan.ten}">
	            </div>
	            <div class="col-6">
	                <label for="">Phân loại</label>
	                <input type="text" class="form-control" name=" " value="${product.phanLoai.tenPhanLoai}">
	            </div>
	            -->
	        </div>
	        <div class="row">
	            <div class="col-6">
	            	<!-- 
	                <label for="">Nhà cung cấp</label>
	                <input type="text" class="form-control"  name=" " value="${product.nhaCungCap.shortName}"> -->
	            </div>
	            <div class="col-6">
	                <label for="">Năm xuất bản</label>
		            <input type="text" class="form-control" name="namXuatBan" value="${product.namXuatBan}">
	            </div>
	        </div>
	        <label for="">Mô Tả</label>
	        <textarea class="form-control" rows="5" name="moTa">${product.moTa}</textarea>
	        <div class="text-center">
	        	<button class="btn btn-primary py-2 px-5 fw-medium mt-3">Thêm</button>
				<!-- <button class="btn btn-secondary py-2 px-5 fw-medium mt-3" type="submit" formaction="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}">Sửa</button>	 -->
			</div>
		</div>
		</div>
	</form>
    
  
</body>

</html>