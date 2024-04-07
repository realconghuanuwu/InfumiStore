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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/profile/my-order" class="text-deco-none text-dark">Đơn hàng của tôi</a></li>
                    <li class="list-group-item fw-bold">Nhận xét của tôi</li>
                </ul>
            </div>
            <div class="col-9">
                <div class="bg-white rounded-4 p-2 mb-4">
                    <table class="table ms-4" style="width: 95%;">
                        <thead>
                            <tr>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col"></th>
                                <th scope="col">Nhận xét</th>
                                <th scope="col">Đánh giá</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row" style="width: 80px;">
                                    <img src="images/thien_su_nha_ben_tap_8_bia_3.jpg" alt="" srcset=""
                                        style="width: 80px; object-fit: contain;">
                                </th>
                                <td style="width: 120px;">Thiên Sứ Nhà Bên</td>
                                <td>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Est ratione voluptatibus
                                    inventore aliquam aspernatur beatae, soluta quod hic sequi necessitatibus cum,
                                    officiis, saepe fuga quae labore vel voluptate harum nulla iure odit provident
                                    possimus eligendi? Praesentium, non debitis. Nobis, sint dolorum modi aliquid, culpa
                                    voluptates, a velit provident blanditiis et minus. Impedit laborum non delectus,
                                    enim deserunt eveniet aut accusamus, nesciunt commodi repellat nisi tenetur at earum
                                    natus laudantium! Unde nostrum deserunt adipisci architecto distinctio magnam
                                    consequuntur quasi quia, ipsam corporis, illo inventore ducimus minima animi
                                    repudiandae iusto voluptas omnis nesciunt! Praesentium iure tenetur rerum, iusto
                                    facilis magni totam assumenda.</td>
                                <td style="width: 120px;">
                                    <div class="fs-11px">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                    </div>
                                </td>
                                <td><a href="#" class="text-deco-none">Xem bình luận</a></td>
                            </tr>

                            <tr>
                                <th scope="row" style="width: 80px;">
                                    <img src="images/thien_su_nha_ben_tap_8_bia_3.jpg" alt="" srcset=""
                                        style="width: 80px; object-fit: contain;">
                                </th>
                                <td style="width: 120px;">Thiên Sứ Nhà Bên</td>
                                <td>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Est ratione voluptatibus
                                    inventore aliquam aspernatur beatae, soluta quod hic sequi necessitatibus cum,
                                    officiis, saepe fuga quae labore vel voluptate harum nulla iure odit provident
                                    possimus eligendi? Praesentium, non debitis. Nobis, sint dolorum modi aliquid, culpa
                                    voluptates, a velit provident blanditiis et minus. Impedit laborum non delectus,
                                    enim deserunt eveniet aut accusamus, nesciunt commodi repellat nisi tenetur at earum
                                    natus laudantium! Unde nostrum deserunt adipisci architecto distinctio magnam
                                    consequuntur quasi quia, ipsam corporis, illo inventore ducimus minima animi
                                    repudiandae iusto voluptas omnis nesciunt! Praesentium iure tenetur rerum, iusto
                                    facilis magni totam assumenda.</td>
                                <td style="width: 120px;">
                                    <div class="fs-11px">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                    </div>
                                </td>
                                <td><a href="#" class="text-deco-none">Xem bình luận</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- panel -->
	
    <%@include file="/views/jspmodule/footer.jsp" %>
</body>
</html>