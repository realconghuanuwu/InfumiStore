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
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.bundle.min.js" type="text/javascript"></script>
</head>
<body class="bg-light-grey">
	<fmt:setLocale value="vi_VN"/>
    <jsp:include page="/views/jspmodule/navbar.jsp"/>
	
	<!-- panel -->
    <div class="container bg-white p-2 rounded-4" style="margin-top:100px">
        <div class="d-flex justify-content-between">
            <a href="${pageContext.request.contextPath}/home" class="text-deco-none fw-bold fs-4 text-dark">
                <i class="fa-solid fa-angle-left fs-20px"></i>
                <span class="ms-1 fs-20px">Đăng nhập/ Đăng ký</span>
            </a>
        </div>
        <div class="w-50" style="margin: 0 auto;">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active fw-medium" data-bs-toggle="tab" href="#home">Đăng nhập</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-medium" data-bs-toggle="tab" href="#menu1">Đăng ký</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
            	<!-- Login -->
                <div id="home" class="container tab-pane active"><br>
                	<form action="${pageContext.request.contextPath}/dang-nhap" method="POST">
                		${errorMessage}
                		<label for="" class="form-label">Email</label>
	                    <input type="text" class="form-control" placeholder="Nhập email" name="login-email" required>
	                    <br>
	                    <label for="" class="form-label">Mật khẩu</label>
	                    <input type="text" class="form-control" placeholder="Nhập mật khẩu" name="login-password" required>
	                    <a href="#">Quên mật khẩu?</a>
	                    <br>
	                    <div class="text-center mt-3">
	                        <button class="btn btn-primary fw-medium py-2 px-5">Đăng nhập</button>
	                    </div>
                	</form>
                    
                </div>
                <!-- Register -->
                <div id="menu1" class="container tab-pane fade"><br>
                	<form action="${pageContext.request.contextPath}/dang-ky" method="POST">
                		<c:if test="errorMess.lenght != 0">
                			<div class="alert alert-danger" role="alert">
	                			<i class="fa-solid fa-triangle-exclamation"></i>
	   							 <p class="text-danger">${errorMessage}</p>
							</div>
                		</c:if>
                		<label for="" class="form-label">Email</label>
	                    <input type="text" class="form-control" placeholder="Nhập email" name="register-email" required>
	                    <br>
	                    <label for="" class="form-label">Mật khẩu</label>
	                    <input type="text" class="form-control" placeholder="Nhập mật khẩu" name="register-password" required>
	                    <br>
	                    <label for="" class="form-label">Xác Nhận Mật khẩu</label>
	                    <input type="text" class="form-control" placeholder="Nhập lại mật khẩu" name="register-confirm-password" required>
	                    <br>
	                    <label for="" class="form-label">Mã xác nhận OTP</label>
	                    <input type="text" class="form-control" placeholder="6 ký tự" name="register-otp" required>
	                    <a href="#">Gửi mã</a>
	                    <br>
	                    <div class="text-center mt-3">
	                        <button class="btn btn-primary fw-medium py-2 px-5">Đăng ký</button>
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