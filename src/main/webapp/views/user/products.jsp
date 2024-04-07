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
    
	<div class="container bg-white p-2 rounded-4" style="margin-top:100px">
        <div class="d-flex justify-content-between">
            <a href="${pageContext.request.contextPath}/home" class="text-deco-none fw-bold fs-4 text-dark">
                <i class="fa-solid fa-angle-left fs-20px"></i>
                <span class="ms-1 fs-20px">${tendanhsach}</span>
            </a>
        </div>
        <div class="row mt-2">
        	<c:forEach var="item" items="${products}">
	        	 <div class="col-2">
	        	 	<a href="${pageContext.request.contextPath}/product?id=${item.id}" class="text-deco-none text-dark">
		                <div class="card mb-4" style="width: 200px; height: 365px;">
		                	<c:if test="${item.soLuong <= 0}">
                                 <div class="position-absolute fw-bold p-3 rounded" style="top: 68px; left: 45px;z-index: 1; background-color: #2b2d44; color: white; opacity: 90%;">Hết Hàng</div>
                            </c:if>
		                    <img src="${pageContext.request.contextPath}/images/${item.anhSanPhams[0].ten}" alt="..." class="img-product mt-1">
		                    <div class="card-body">
		                        <h5 class="fs-6 fw-light fw-medium text-limit-2">${item.tieuDe}</h5>
		                        <div class="card-text">
		                            <c:choose>
										<c:when test="${item.giamGia == 0}">
											<span class="fw-bold fs-5 mt-5 text-danger"> 
												<fmt:formatNumber value="${item.donGia}" type="currency" />		
											</span>
										</c:when>
	
										<c:when test="${item.giamGia != 0}">
											<del>
												<span class="fw-bold fs-5 mt-5"> 
													<fmt:formatNumber value="${item.donGia}" type="currency" />		
												</span>
											</del>
											<br>
											<span class="fw-bold fs-5 mt-5 text-danger"> <fmt:formatNumber
													value="${item.donGia - (item.donGia * item.giamGia)}"
													type="currency" />
											</span>
										</c:when>
									</c:choose>        
		                        </div>
		                        <div class="d-flex fs-11px mt-1">
		                            <div class="justify-content-start">
		                                <span class="fa fa-star checked"></span>
		                                <span class="fa fa-star checked"></span>
		                                <span class="fa fa-star checked"></span>
		                                <span class="fa fa-star checked"></span>
		                                <span class="fa fa-star checked"></span>
		                                <span class="text-secondary fs-10px">(0)</span>
		                                <span>| Đã bán ${item.chiTietHoaDons != null ? item.chiTietHoaDons.size() : 0}</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
	                </a>
	            </div>
        	</c:forEach>
           

       

        </div>
    </div>
    <!-- panel -->
    <%@include file="/views/jspmodule/footer.jsp" %>
</body>
</html>