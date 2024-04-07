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
    <jsp:include page="/views/jspmodule/navbar.jsp"/>
	<!-- panel -->
    <div class="container mt-3 bg-white p-2 rounded-4" style="margin-top:100px">
       <div class="d-flex justify-content-between">
            <a href="#" class="text-deco-none fw-bold fs-4 text-dark">
                <i class="fa-solid fa-angle-left fs-20px"></i>
                <span class="ms-1 fs-20px">Tài khoản</span>
            </a>
        </div>
    </div>

    <div class="container mt-3 p-2 rounded-4">
        <div class="row">
            <div class="col-3">
                <ul class="list-group list-group-flush bg-white rounded-2 ">
                    <li class="list-group-item fw-bold">Thông tin tài khoản</li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/change-password" class="text-deco-none text-dark">Đổi Mật Khẩu</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/my-order" class="text-deco-none text-dark">Đơn hàng của tôi</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/my-comment" class="text-deco-none text-dark">Nhận xét của tôi</a></li>
                </ul>
            </div>
            <div class="col-9">
                <div class="bg-white rounded-2 py-3">
                    <h4 class="ms-2">Thông tin tài khoản</h4>
                    <form action="${pageContext.request.contextPath}/profile/edit" method="POST">
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Họ và tên lót*</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập họ và tên lót" name="last-name" value="${lastname}">
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Tên*</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập tên" name="first-name" value="${firstname}">
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Email*</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập email" name="email" value="${email}" disabled>
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Số Điện Thoại</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập số điện thoại" name="sdt" value="${sdt}">
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Giới Tính</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="radio" class="form-check-input" name="gender" value="true" ${gender ? 'checked' : '' }> Nam
	                            <input type="radio" class="form-check-input ms-4" name="gender" value="false" ${gender ? '' : 'checked' }> Nữ
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Địa Chỉ</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập địa chỉ" name="address" value="${address}">
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Ngày Sinh</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="date" class="form-control" placeholder="Nhập ngày sinh" name="birthday" value="${birthday}">
	                        </div>
	                    </div>
	                    <div class="text-center">
	                        <button class="btn btn-danger fw-medium py-2 px-5 mt-3">Lưu thay đổi</button>
	                    </div>
                    </form>
                    
                </div>
                
            </div>
        </div>
        
    </div>
    <!-- panel -->
    <jsp:include page="/views/jspmodule/footer.jsp"/>
  
</body>
</html>