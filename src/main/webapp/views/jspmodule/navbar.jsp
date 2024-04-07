<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<div class="">
	<nav class="navbar navbar-expand-sm navbar-dark bg-white fixed-top" style="height: 80px;">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <svg width="60" height="40" viewBox="0 0 60 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M0.0423565 17.5349L13.9598 0.5L19.0648 0.507022L26.543 9.71226L21.4322 13.8121L16.5022 7.74351L6.78689 19.635L16.5172 32.0628L41.3431 0.545432L46.5168 0.547292L59.915 17.5822L60 21.4885L47.225 39.264L42.0665 39.5L34.0691 30.2948L39.0409 26.0295L44.308 32.0921L53.2285 19.6799L43.9273 7.85406L19.0955 39.3789L13.9174 39.3713L0 21.5958L0.0423565 17.5349Z"
                        fill="#6251DD" />
                </svg>
            </a>
            <div class="collapse navbar-collapse" id="mynavbar">
                <input class="form-control m-auto w800px bg-light-grey" type="text" placeholder="🔎 Search">
                <form class="d-flex">
                    <div class="dropdown">
                        <button class="btn bg-light-grey me-3" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="account">
                            <svg width="24" height="24" viewBox="0 0 24 24"
                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M16.5714 6.44444C16.5714 8.89904 14.5247 10.8889 12 10.8889C9.47527 10.8889 7.42857 8.89904 7.42857 6.44444C7.42857 3.98985 9.47527 2 12 2C14.5247 2 16.5714 3.98985 16.5714 6.44444Z"
                                    stroke="#090937" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                <path
                                    d="M12 14.2222C7.58172 14.2222 4 17.7045 4 22H20C20 17.7045 16.4183 14.2222 12 14.2222Z"
                                    stroke="#090937" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="account">
                        	<c:choose>
					         <c:when test = "${sessionScope.user == null}">
					            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dang-nhap">Đăng nhập</a></li>
					             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dang-ky">Đăng ký</a></li>
					         </c:when>
					         <c:when test = "${sessionScope.user != null}">
					            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile/edit">Tài khoản của ${sessionScope.user.ten}</a></li>
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile/my-order">Đơn hàng đã mua</a></li>                         
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dang-xuat">Đăng xuất</a></li>
					         </c:when>
					      	</c:choose>
                        	
                            
                        </ul>
                    </div>
                     <div class="dropdown">
                    	<button class="btn bg-light-grey me-3 dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="d" data-bs-display="static">
                            <svg width="22" height="22"
                            viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M1 1H3.22222L3.66667 3.22222M5.44444 12.1111H16.5556L21 3.22222H3.66667M5.44444 12.1111L3.66667 3.22222M5.44444 12.1111L2.89679 14.6588C2.19682 15.3587 2.69257 16.5556 3.68246 16.5556H16.5556M16.5556 16.5556C15.3283 16.5556 14.3333 17.5505 14.3333 18.7778C14.3333 20.0051 15.3283 21 16.5556 21C17.7829 21 18.7778 20.0051 18.7778 18.7778C18.7778 17.5505 17.7829 16.5556 16.5556 16.5556ZM7.66667 18.7778C7.66667 20.0051 6.67174 21 5.44444 21C4.21715 21 3.22222 20.0051 3.22222 18.7778C3.22222 17.5505 4.21715 16.5556 5.44444 16.5556C6.67174 16.5556 7.66667 17.5505 7.66667 18.7778Z"
                                stroke="#090937" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="d" style="width: 500px; max-height: 500px; overflow-y: scroll; overflow-x: hidden;" >
                        	<c:forEach var="ctgh" items="${sessionScope.cart}">
                        		<li class="row d-flex ms-2">
                            	<div class="col-2" style="width: 60px;">
                            		<image src="${pageContext.request.contextPath}/images/${ctgh.sanPham.anhSanPhams[0].ten}" style="width: 60px; object-fit: cover;"/>
                            	</div>
                            	<span class="col-7 text-limit-2">${ctgh.sanPham.tieuDe}</span>
                            	<span class="col-3 text-danger fw-medium"><fmt:formatNumber value="${ctgh.sanPham.donGia}" type="currency" /> x ${ctgh.soLuong}</span>
                            </li>
                            <hr>
                        	</c:forEach>   
                        	<c:if test="${empty sessionScope.cart}">
                        		<p class="text-center fw-medium fs-5 my-5">Hiện không có sản phẩm trong giỏ hàng</p>
                        	</c:if>
                            <a class="btn btn-danger ms-2 fw-medium py-2 px-2" href="${pageContext.request.contextPath}/gio-hang">Tới Trang Thanh Toán</a>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>