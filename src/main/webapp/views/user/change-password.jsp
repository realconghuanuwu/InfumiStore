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
    <div class="container mt-3 bg-white p-2 rounded-4">
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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/edit" class="text-deco-none text-dark">Thông tin tài khoản</a></li>
                    <li class="list-group-item fw-bold">Đổi Mật Khẩu</li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/my-order" class="text-deco-none text-dark">Đơn hàng của tôi</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/my-comment" class="text-deco-none text-dark">Nhận xét của tôi</a></li>
                </ul>
            </div>
            <div class="col-9">
                <div class="bg-white rounded-2 py-3">
                    <h4 class="ms-2">Đổi mật khẩu</h4>
                    <p class="text-danger">${errorMessage}</p>
                    <form action="${pageContext.request.contextPath}/profile/change-password" method="POST">
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Mật khẩu hiện tại*</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập mật khẩu hiện tại" name="password" required>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Mật khẩu mới*</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập mật khẩu mới" name="new-password" required>
	                        </div>
	                    </div>
	                    <div class="row mt-3">
	                        <div class="col-2">
	                            <label class="form-label fw-medium ms-3">Xác nhận*</label>
	                        </div>
	                        <div class="col-9">
	                            <input type="text" class="form-control" placeholder="Nhập lại mật khẩu mới" name="confirm-new-password" required>
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
	
    <%@include file="/views/jspmodule/footer.jsp" %>
</body>
</html>