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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/change-password" class="text-deco-none text-dark">Đổi Mật Khẩu</a></li>
                    <li class="list-group-item fw-bold">Đơn hàng của tôi</li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/my-comment" class="text-deco-none text-dark">Nhận xét của tôi</a></li>
                </ul>
            </div>
            <div class="col-9">
            	<c:forEach var="order" items="${orders}">
        			<div class="bg-white rounded-4 p-2 mb-4">
	                    <p class="ms-4"><span class="fw-medium">Mã đơn hàng:</span> ${order.id}</p>
	                    <p class="ms-4"><span class="fw-medium">Trạng thái:</span> ${order.trangThai}</p>
	                    <p class="ms-4"><span class="fw-medium">Ngày đặt:</span> ${order.ngayTao}</p>
	                    <table class="table ms-4" style="width: 95%;">
	                        <thead>
	                            <tr>
	                                <th scope="col">Hình ảnh</th>
	                                <th scope="col">Tên sản phẩm</th>
	                                <th scope="col">Đơn giá</th>
	                                <th scope="col">SL</th>
	                                <th scope="col">Thành tiền</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cthd" items="${order.chiTietHoaDons}">
	                        		<tr>
		                                <th scope="row" style="width: 80px;">
		                                    <img src="${pageContext.request.contextPath}/images/${cthd.sanPham.anhSanPhams[0].ten}"
		                                        style="width: 80px; object-fit: contain;">
		                                </th>
		                                <td>${cthd.sanPham.tieuDe}</td>
		                                <td><fmt:formatNumber value = "${cthd.sanPham.donGia - (cthd.sanPham.donGia * cthd.sanPham.giamGia)}" type = "currency"/></td>
		                                <td>${cthd.soLuong}</td>
		                                <td><fmt:formatNumber value = "${(cthd.sanPham.donGia - (cthd.sanPham.donGia * cthd.sanPham.giamGia)) * cthd.soLuong}" type = "currency"/></td>
		                            </tr>
	                        	</c:forEach>
	                        </tbody>
	                    </table>
	                    <div class="text-end me-4">
	                    	<c:set var="tongTien" value="0" />
	                        <span class="fw-medium">Thành tiền: </span><span class="fw-bold tong-tien" >
	                        	<c:forEach var="cthd" items="${order.chiTietHoaDons}">
								    <c:set var="thanhTien" value="${(cthd.sanPham.donGia - (cthd.sanPham.donGia * cthd.sanPham.giamGia)) * cthd.soLuong}" />
								    <c:set var="tongTien" value="${tongTien + thanhTien}" />
								</c:forEach>
								<fmt:formatNumber value="${tongTien}" type="currency"/>
	                        </span>
	                        <br>
	                        <span class="fw-medium">Phí vận chuyển (ước tính): </span><span class="fw-bold">25.000đ</span>
	                        <br>
	                        <span class="fw-medium">Tổng tiền (gồm VAT): </span><span
	                            class="fw-bold text-danger"><fmt:formatNumber value="${tongTien + (tongTien * 0.1) + 25000}" type="currency"/></span>
	                    </div>
                	</div>
   				</c:forEach>
            </div>
        </div>

    </div>
    <!-- panel -->
	
    <%@include file="/views/jspmodule/footer.jsp" %>
</body>
</html>