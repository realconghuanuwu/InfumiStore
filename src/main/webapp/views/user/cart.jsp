<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ Hàng</title>
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
    <div class="container mt-3 bg-white p-2 rounded-4" style="margin-top:100px!important">
        <div class="d-flex justify-content-between">
            <a href="${pageContext.request.contextPath}/home" class="text-deco-none fw-bold fs-4 text-dark">
                <i class="fa-solid fa-angle-left fs-20px"></i>
                <span class="ms-1 fs-20px">Giỏ Hàng</span>
            </a>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-8">
                <div class="container-fluid mt-3 bg-white rounded-4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" style="width: 140px;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked"
                                        style="margin-top: 5px"checked>
                                        <label class="form-check-label" for="flexCheckChecked">
                                            Chọn tất cả
                                        </label>
                                    </div>
                                </th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="ctgh" items="${ctghs}">
                        		<tr>
	                                <th scope="row" style="width: 140px;">
	                                    <div class="form-check">
	                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked"
	                                        style="margin-top: 55px; width: 25px; height: 25px;" checked>
	                                    </div>
	                                </th>
	                                <td style="width: 100px;">
	                                    <img src="${pageContext.request.contextPath}/images/${ctgh.sanPham.anhSanPhams[0].ten}" alt="${ctgh.sanPham.anhSanPhams[0].ten}"
	                                        style="width: 100px; height: 130px; object-fit: contain;">
	                                </td>
	                                <td style="width: 220px;">
	                                    <p class="fw-medium fs-6 text-limit-2">${ctgh.sanPham.tieuDe}</p>
	                                     <c:choose>
											<c:when test="${ctgh.sanPham.giamGia == 0}">
												<span class="fs-5 fw-medium"><fmt:formatNumber value="${ctgh.sanPham.donGia}" type="currency" /></span>	
											</c:when>
		
											<c:when test="${ctgh.sanPham.giamGia != 0}">
												<span class="fs-6 fw-medium"><fmt:formatNumber value="${ctgh.sanPham.donGia - (ctgh.sanPham.donGia * ctgh.sanPham.giamGia)}" type="currency" /></span>	
												<span class="fs-6"><del><fmt:formatNumber value="${ctgh.sanPham.donGia}" type="currency" /></del></span>
											</c:when>
										</c:choose>     
	                                </td>
	                                <td style="width: 128px; padding-top: 50px;" class="ms-5 fw-medium">
		                                <div class="btn-group" role="group" aria-label="Basic example">
		                                	<a class="btn btn-light border" href="${pageContext.request.contextPath}/gio-hang/update?id=${ctgh.sanPham.id}&&action=tru">-</a>
	                                        <button type="button" class="btn btn-white border" disabled>${ctgh.soLuong}</button>
	                                        <a class="btn btn-light border" href="${pageContext.request.contextPath}/gio-hang/update?id=${ctgh.sanPham.id}&&action=cong">+</a>
	                                     </div>
	                                <td>
	                                <td style="padding-top: 50px;" class="fw-bold text-danger">
	                                	<fmt:formatNumber value="${(ctgh.sanPham.donGia - (ctgh.sanPham.donGia * ctgh.sanPham.giamGia)) * ctgh.soLuong}" type="currency" />
	                                <td>
	                                <td><a class="btn fs-5" style="margin-top: 32px;" href="${pageContext.request.contextPath}/gio-hang/delete?id=${ctgh.sanPham.id}"><i class="fa-regular fa-trash-can"></i></a></td>
                            	</tr>
                        	</c:forEach>                          
                        </tbody>
                    </table>
                </div>

                
            </div>
            <div class="col-4">
                <div class="container-fluid mt-3 bg-white rounded-4 pt-3">
                	<div class="form-floating mb-3">
					  <input class="form-control"  placeholder="Nhập số điện thoại của bạn ở đây..." value="${sessionScope.user.soDienThoai}" disabled>
					  <label for="floatingInput">Số điện thoại</label>
					</div>
					<div class="form-floating">
					  <input class="form-control"  placeholder="Nhập địa chỉ giao hàng ở đây..." value="${sessionScope.user.diaChi}" disabled>
					  <label for="floatingPassword">Địa chỉ</label>
					</div>                   	
                    <div class="d-flex justify-content-between pt-4">
                        <span class="fw-medium ">Thành tiền</span>
                        <span class="fw-light"><fmt:formatNumber value="${thanhtien} " type="currency" /></span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span class="fw-bold">Tổng Số Tiền (gồm VAT)</span>
                        <span class="text-danger fw-3 fw-bold"><fmt:formatNumber value="${thanhtien + (thanhtien*0.1)}" type="currency" /></span>
                    </div>
                    <label>*chưa bao gồm phí vận chuyển</label>
                    <br>
                    <a class="btn btn-danger fw-medium w-100 mb-4 p-2 fs-5 mt-2" href="${pageContext.request.contextPath}/thanh-toan">THANH TOÁN</a>
                </div>
            </div>
        </div>
	</div>
        <!-- panel -->
    <%@include file="/views/jspmodule/footer.jsp" %>
</body>
</html>