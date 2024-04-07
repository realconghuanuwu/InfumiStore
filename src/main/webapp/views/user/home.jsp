<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <title>Trang Chủ</title>
            <style type="text/css">
                <%@include file="/css/index.css" %><%@include file="/css/all.min.css" %><%@include file="/css/bootstrap.min.css" %>
            </style>
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="./js/popper.min.js" type="text/javascript"></script>
            <script src="./js/bootstrap.bundle.min.js" type="text/javascript"></script>
        </head>

        <body class="bg-light-grey">
        	<fmt:setLocale value="vi_VN"/>
            <jsp:include page="/views/jspmodule/navbar.jsp"/>
                <!-- slider -->
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="padding-top:100px">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1" style="height: 7px;"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2" style="height: 7px;"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3" style="height: 7px;"></button>
                    </div>
                    <div class="container">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/banner1.jpg" class="d-block w-100"
                                    style="height: 400px; object-fit: cover;" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="images/banner2.jpg" class="d-block w-100"
                                    style="height: 400px; object-fit: cover" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="images/banner3.jpg" class="d-block w-100"
                                    style="height: 400px; object-fit: cover" alt="...">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- slider -->

                <!-- panel -->
                <div class="container mt-5 bg-white p-2 rounded-3">
                    <div class="d-flex justify-content-between">
                        <h4 class="fw-bold">Light Novel</h4>
                        <a href="${pageContext.request.contextPath}/products?phanloai=LN" class="text-orange text-deco-none fw-medium">View All</a>
                    </div>
                    <div class="row mt-2">
                        <c:forEach var="item" items="${LNproducts}">
                            <div class="col-3 mb-3">
                                <a href="${pageContext.request.contextPath}/product?id=${item.id}" class="text-deco-none text-dark">
                                    <div class="box bg-white border">
                                        <div class="d-flex p-2 position-relative">
                                        	<c:if test="${item.soLuong <= 0}">
                                        		<div class="position-absolute fw-bold p-3 rounded" style="top: 68px; left: 102px;z-index: 1; background-color: #2b2d44; color: white; opacity: 90%;">Hết Hàng</div>
                                        	</c:if>
                                            <img src="${pageContext.request.contextPath}/images/${item.anhSanPhams[0].ten}"
                                                style="width: 120px; height: 180px; object-fit: contain;">
                                            <div class="d-block ms-2">
                                                <div class="text-limit-2">
                                                    <span class="d-block p-0 fw-bold">${item.tieuDe}</span>
                                                </div>
                                                <div class="position-absolute">
                                                    <div>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span> 
                                                        <span style="font-size: 12px"> (${item.chiTietHoaDons != null ? item.chiTietHoaDons.size() : 0} đã bán)</span>
                                                    </div>
                                                    <c:choose>         
												         <c:when test = "${item.giamGia == 0}">
												            <span class="fw-bold fs-5 mt-5 text-danger">                                                 
                                                    			<fmt:formatNumber value = "${item.donGia}" type = "currency"/>
                                                    		</span>
												         </c:when>
												         
												         <c:when test = "${salary != 0}">
												            <del>
												            	<span class="fw-bold fs-5 mt-5">                                                 
                                                    				<fmt:formatNumber value = "${item.donGia}" type = "currency"/>
                                                    			</span>
												            </del>
												            <br>
			                                                    <span class="fw-bold fs-5 mt-5 text-danger">
			                                                    	<fmt:formatNumber value = "${item.donGia - (item.donGia * item.giamGia)}" type = "currency"/>
			                                                    </span>
												         </c:when>
											      	</c:choose>                                                  
                                                    
                                                    <a class="btn btn-outline-danger mt-2 fw-bold px-4 py-1" href="${pageContext.request.contextPath}/gio-hang/add?id=${item.id}">Add To Cart</a>
                                                        
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
                
                <!-- panel -->
                <div class="container mt-5 bg-white p-2 rounded-3">
                    <div class="d-flex justify-content-between">
                        <h4 class="fw-bold">Manga</h4>
                        <a href="${pageContext.request.contextPath}/products?phanloai=MG" class="text-orange text-deco-none fw-medium">View All</a>
                    </div>
                    <div class="row mt-2">
                        <c:forEach var="item" items="${MGproducts}">
                            <div class="col-3 mb-3">
                                <a href="${pageContext.request.contextPath}/product?id=${item.id}" class="text-deco-none text-dark">
                                    <div class="box bg-white border">
                                        <div class="d-flex p-2 position-relative">
                                        	<c:if test="${item.soLuong <= 0}">
                                        		<div class="position-absolute fw-bold p-3 rounded" style="top: 68px; left: 102px;z-index: 1; background-color: #2b2d44; color: white; opacity: 90%;">Hết Hàng</div>
                                        	</c:if>
                                            <img src="images/${item.anhSanPhams[0].ten}"
                                                style="width: 120px; height: 180px; object-fit: contain;">
                                            <div class="d-block ms-2">
                                                <div class="text-limit-2">
                                                    <span class="d-block p-0 fw-bold">${item.tieuDe}</span>
                                                </div>
                                                <div class="position-absolute">
                                                    <div>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span style="font-size: 12px"> (${item.chiTietHoaDons != null ? item.chiTietHoaDons.size() : 0} đã bán)</span>
                                                    </div>
                                                    <c:choose>         
												         <c:when test = "${item.giamGia == 0}">
												            <span class="fw-bold fs-5 mt-5 text-danger">                                                 
                                                    			<fmt:formatNumber value = "${item.donGia}" type = "currency"/>
                                                    		</span>
												         </c:when>
												         
												         <c:when test = "${salary != 0}">
												            <del>
												            	<span class="fw-bold fs-5 mt-5">                                                 
                                                    				<fmt:formatNumber value = "${item.donGia}" type = "currency"/>
                                                    			</span>
												            </del>
												            <br>
			                                                    <span class="fw-bold fs-5 mt-5 text-danger">
			                                                    	<fmt:formatNumber value = "${item.donGia - (item.donGia * item.giamGia)}" type = "currency"/>
			                                                    </span>
												         </c:when>
											      	</c:choose>                                                  
                                                    
                                                    <a class="btn btn-outline-danger mt-2 fw-bold px-4 py-1" href="${pageContext.request.contextPath}/gio-hang/add?id=${item.id}">Add To Cart</a>
                                                        
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
                
                <!-- panel -->
                <div class="container mt-5 bg-white p-2 rounded-3">
                    <div class="d-flex justify-content-between">
                        <h4 class="fw-bold">Tin Học</h4>
                        <a href="${pageContext.request.contextPath}/products?phanloai=TH" class="text-orange text-deco-none fw-medium">View All</a>
                    </div>
                    <div class="row mt-2">
                        <c:forEach var="item" items="${THproducts}">
                            <div class="col-3 mb-3">
                                <a href="${pageContext.request.contextPath}/product?id=${item.id}" class="text-deco-none text-dark">
                                    <div class="box bg-white border">
                                        <div class="d-flex p-2 position-relative">
                                        	<c:if test="${item.soLuong <= 0}">
                                        		<div class="position-absolute fw-bold p-3 rounded" style="top: 68px; left: 102px;z-index: 1; background-color: #2b2d44; color: white; opacity: 90%;">Hết Hàng</div>
                                        	</c:if>
                                            <img src="images/${item.anhSanPhams[0].ten}"
                                                style="width: 120px; height: 180px; object-fit: contain;">
                                            <div class="d-block ms-2">
                                                <div class="text-limit-2">
                                                    <span class="d-block p-0 fw-bold">${item.tieuDe}</span>
                                                </div>
                                                <div class="position-absolute">
                                                    <div>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span style="font-size: 12px"> (${item.chiTietHoaDons != null ? item.chiTietHoaDons.size() : 0} đã bán)</span>
                                                    </div>
                                                    <c:choose>         
												         <c:when test = "${item.giamGia == 0}">
												            <span class="fw-bold fs-5 mt-5 text-danger">                                                 
                                                    			<fmt:formatNumber value = "${item.donGia}" type = "currency"/>
                                                    		</span>
												         </c:when>
												         
												         <c:when test = "${salary != 0}">
												            <del>
												            	<span class="fw-bold fs-5 mt-5">                                                 
                                                    				<fmt:formatNumber value = "${item.donGia}" type = "currency"/>
                                                    			</span>
												            </del>
												            <br>
			                                                    <span class="fw-bold fs-5 mt-5 text-danger">
			                                                    	<fmt:formatNumber value = "${item.donGia - (item.donGia * item.giamGia)}" type = "currency"/>
			                                                    </span>
												         </c:when>
											      	</c:choose>                                                  
                                                    
                                                    <a class="btn btn-outline-danger mt-2 fw-bold px-4 py-1" href="${pageContext.request.contextPath}/gio-hang/add?id=${item.id}">Add To Cart</a>
                                                        
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