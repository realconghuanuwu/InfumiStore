<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Product Details</title>
<style type="text/css">
	<%@include file="/css/index.css" %>
    <%@include file="/css/all.min.css" %>
    <%@include file="/css/bootstrap.min.css" %>
</style>
<script src="https://kit.fontawesome.com/3fc1a1203a.js" crossorigin="anonymous"></script>
<link
        href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.1-web/css/all.min.css"
        rel="stylesheet">
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
                <span class="ms-1 fs-20px">Trang Chủ</span>
            </a>
        </div>
        <div class="row mt-3">
            <div class="col-4">
                <div id="carouselExampleIndicators" class="carousel slide border rounded-2" data-bs-ride="carousel">
                	<c:if test="${item.soLuong <= 0}">
                          <div class="position-absolute fw-bold p-4 rounded" style="top: 190px; left: 125px;z-index: 1; background-color: #2b2d44; color: white; opacity: 90%; font-size: 28px;">Hết Hàng</div>
                    </c:if>
                    <div class="carousel-inner">
                    	<c:forEach var="imgItem" items="${item.anhSanPhams}" varStatus="status">
						    <div class="carousel-item ${status.first ? 'active' : ''}">
						        <img src="${pageContext.request.contextPath}/images/${imgItem.ten}" class="d-block w-100"
						            alt="..." style="object-fit: contain; height: 500px;">
						    </div>
						</c:forEach>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="col-8">
                <h4 class="fs-2">${item.tieuDe}</h4>
                <p class="fs-5 fw-normal">Tác Giả: <span class="fw-medium">${item.tacGia.hoTen}</span></p>
                <div class="d-flex">
                    <div>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="text-secondary fw-medium">(12 đánh giá)</span>
                    </div>
                </div>
                <div class="fs-3 mt-3">
					<c:choose>
						<c:when test="${item.giamGia == 0}">
							<span class="text-danger fw-bold me-3"><fmt:formatNumber value="${item.donGia}" type="currency" /></span>
						</c:when>

						<c:when test="${salary != 0}">
							<span class="text-danger fw-bold me-3">
								<fmt:formatNumber value="${item.donGia - (item.donGia * item.giamGia)}" type="currency" />									
							</span>
		                    <span class="fs-4 me-1">
		                    	<del>
		                    		<fmt:formatNumber value="${item.donGia}" type="currency" />	
		                    	</del>
		                    </span>
		                    <span class="badge bg-danger p-2 fs-6">-<fmt:formatNumber value="${item.giamGia * 100}" maxFractionDigits="0" minFractionDigits="0"/>%</span>
						</c:when>
					</c:choose>
					
                </div>
                <p class="mt-3">
                	${fn:substring(item.moTa, 0, 310)}...
                </p>

<!--                 <div class="d-flex mb-3"> -->
<!--                     <span class="fs-6 fw-medium my-auto me-3">Phân Loại:</span> -->
<!--                     <select class="form-select w-25"> -->
<!--                         <option>Open this select menu</option> -->
<!--                         <option value="1">One</option> -->
<!--                         <option value="2">Two</option> -->
<!--                         <option value="3">Three</option> -->
<!--                     </select> -->
<!--                 </div> -->

                <div class="d-flex">
				    <span class="fs-6 fw-medium my-auto me-3">Số Lượng:</span>
				    <div class="btn-group" role="group" aria-label="Basic example">
				        <button type="button" class="btn btn-light border" onclick="soLuong('-')">-</button>
				        <input type="button" class="btn btn-white border" name="soLuongSanPham" id="soLuongBtn" value="1" disabled></input>
				        <button type="button" class="btn btn-light border" onclick="soLuong('+', ${item.soLuong})">+</button>
				    </div>
				</div>
				
				<div class="mt-3">
				    <a class="btn btn-outline-danger fw-medium fs-5 ms-2" id="addToCartBtn" href="${pageContext.request.contextPath}/gio-hang/add?id=${item.id}">
				        <i class="fa-light fa-cart-shopping"></i>
				        Thêm vào giỏ hàng
				    </a>
				</div>
            </div>
        </div>
        <hr>
        <h5 class="fw-bold">Thông Tin Sản Phẩm</h5>
        <table class="table table-borderless mt-3">
            <tbody>
                <tr>
                    <th>
                        Mã hàng </th>
                    <td>
                        ${item.id} </td>
                </tr>
                <tr>
                    <th>
                        Độ Tuổi </th>
                    <td>
                        ${item.doTuoi}
                    </td>
                </tr>
                <tr>
                    <th>
                        Tên Nhà Cung Cấp </th>
                    <td>
                        ${item.nhaCungCap.shortName}
                    </td>
                </tr>
                <tr>
                    <th>
                        Tác giả </th>
                    <td>
                       	${item.tacGia.hoTen } </td>
                </tr>
                <tr>
                    <th>
                        Người Dịch </th>
                    <td>
                        ${item.nguoiDich} </td>
                </tr>
                <tr>
                    <th>
                        NXB </th>
                    <td>
                        ${item.nhaXuatBan.ten} </td>
                </tr>
                <tr>
                    <th>
                        Năm XB </th>
                    <td>
                        ${item.namXuatBan } </td>
                </tr>
                <tr>
                    <th>
                        Ngôn Ngữ </th>
                    <td>
                        ${item.ngonNgu} </td>
                </tr>
                <tr>
                    <th>
                        Trọng lượng (gr) </th>
                    <td>
                        ${item.canNang} </td>
                </tr>
                <tr>
                    <th>
                        Kích Thước Bao Bì </th>
                    <td>
                        ${item.kichThuoc} cm </td>
                </tr>
                <tr>
                    <th>
                        Số trang </th>
                    <td>
                        ${item.soTrang} </td>
                </tr>
                <tr>
                    <th>
                        Hình thức </th>
                    <td>
                        ${item.kieuBia } </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding: 0px;">
                        <div>Giá sản phẩm trên InfumiStore đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại
                            sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí
                            đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...</div>
                        <div style="color: #C92127;">Chính sách khuyến mãi trên InfumiStore.com không áp dụng cho Hệ thống
                            Nhà sách InfumiStore trên toàn quốc</div>
                    </td>
                </tr>
            </tbody>
        </table>
        <hr>
        <pre class="text-dark">
        	${item.moTa}
        </pre>
    </div>

    <div class="container mt-3 bg-white p-2 rounded-4">
        <h5 class="fw-bold ">Đánh Giá Sản Phẩm</h5>
        <div class="row">
            <div class="col-2">
                <span class="fs-1 fw-bold ms-5">0<span class="fs-4">/5</span> </span>
                <div class="fs-11px ms-5">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                </div>
                <p class="text-secondary fw-medium ms-5 mt-1">(12 đánh giá)</p>
            </div>
            <div class="col-4">
                <div class="d-inline-flex">
                    <span class="me-2">5 sao</span>
                    <div class="progress mt-2 me-2" role="progressbar" style="height: 8px; width: 320px;">
                        <div class="progress-bar bg-warning" style="width: 50%"></div>
                    </div>
                    <span>50%</span>
                </div>
                <div class="d-inline-flex">
                    <span class="me-2">4 sao</span>
                    <div class="progress mt-2 me-2" role="progressbar" style="height: 8px; width: 320px;">
                        <div class="progress-bar bg-warning" style="width: 50%"></div>
                    </div>
                    <span>50%</span>
                </div>
                <div class="d-inline-flex">
                    <span class="me-2">3 sao</span>
                    <div class="progress mt-2 me-2" role="progressbar" style="height: 8px; width: 320px;">
                        <div class="progress-bar bg-warning" style="width: 50%"></div>
                    </div>
                    <span>50%</span>
                </div>
                <div class="d-inline-flex">
                    <span class="me-2">2 sao</span>
                    <div class="progress mt-2 me-2" role="progressbar" style="height: 8px; width: 320px;">
                        <div class="progress-bar bg-warning" style="width: 50%"></div>
                    </div>
                    <span>50%</span>
                </div>
                <div class="d-inline-flex">
                    <span class="me-2">1 sao</span>
                    <div class="progress mt-2 me-2" role="progressbar" style="height: 8px; width: 320px;">
                        <div class="progress-bar bg-warning" style="width: 50%"></div>
                    </div>
                    <span>50%</span>
                </div>
            </div>
            <div class="col-6">
                <p class="text-center mt-5">Chỉ có người đã mua hàng có thể viết đánh giá. Vui lòng <a href="">đăng
                        nhập</a> hoặc <a href="">đăng ký</a>.</p>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="mx-4 mb-4 w-100">
                <div class="">
                    <span class="fw-bold">Công Huấn</span>
                    <span class="fa fa-star checked fs-11px" style="margin-left: 5px;"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                </div>
                <span class="fw-normal">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet iste qui
                    reprehenderit laborum ea atque debitis, explicabo nemo! Deleniti minima dolores unde
                    doloremque earum possimus.
                </span>
                <br>
                <i class="fa-solid fa-thumbs-up"></i>
                <span class="text-success"> Hữu ích</span>
                <i class="fa-solid fa-circle-exclamation ps-2"></i>
                <span class="text-success"> Báo cáo</span>
                <i class="fa-solid fa-calendar ps-2"></i>
                <span>16:30 11/01/2024</span>
                <br>
                <img src="images/nhan-vat-ha-cap-tomozaki_tap-6-5_ban-gioi-han.jpg" alt="" width="120" height="90" class="img rounded">
            </div>
            <div class="mx-4 mb-4 w-100">
                <div class="">
                    <span class="fw-bold">Công Huấn</span>
                    <span class="fa fa-star checked fs-11px" style="margin-left: 5px;"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                    <span class="fa fa-star checked fs-11px"></span>
                </div>
                <span class="fw-normal">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet iste qui
                    reprehenderit laborum ea atque debitis, explicabo nemo! Deleniti minima dolores unde
                    doloremque earum possimus.
                </span>
                <br>
                <i class="fa-solid fa-thumbs-up"></i>
                <span class="text-success"> Hữu ích</span>
                <i class="fa-solid fa-circle-exclamation ps-2"></i>
                <span class="text-success"> Báo cáo</span>
                <i class="fa-solid fa-calendar ps-2"></i>
                <span>16:30 11/01/2024</span>
                <br>
                <img src="images/nhan-vat-ha-cap-tomozaki_tap-6-5_ban-gioi-han.jpg" alt="" width="120" height="90" class="img rounded">
            </div>
        </div>
    </div>

    <div class="container mt-3 bg-white rounded-4 p-3">
        <div class="d-flex justify-content-evenly fw-bold fs-4 text-dark">
            <p class="my-auto"><i class="fa-regular fa-house fs-3"></i> Chính Sách Rõ Ràng</p>
            <p class="my-auto"><i class="fa-light fa-truck fs-3"></i> Thời Gian Giao Hàng</p>
            <p class="my-auto"><i class="fa-light fa-money-bill-transfer fs-3"></i> Chính Sách Đổi Trả</p>
        </div>
    </div>
    <!-- panel -->
	
	
	
    <%@include file="/views/jspmodule/footer.jsp" %>
    <script>
	 	// Lấy tham chiếu đến các phần tử HTML cần thao tác
	    // Lấy tham chiếu đến các phần tử HTML cần thao tác
		const inputSoLuong = document.querySelector('input[name="soLuongSanPham"]');
		const addToCartBtn = document.getElementById('addToCartBtn');
		
		
		// Xử lý sự kiện khi nhấn nút '-' hoặc '+'
		function soLuong(action, maxSoLuong) {
		    let currentValue = parseInt(inputSoLuong.value);
		
		    if (action === '-' && currentValue > 1) {
		        currentValue--;
		    } else if (action === '+' && currentValue < maxSoLuong) {
		        currentValue++;
		    }
		
		    inputSoLuong.value = currentValue;
		
		    // Cập nhật giá trị của tham số "soluong" trong URL
		    const href = "${pageContext.request.contextPath}/gio-hang/add?id=${item.id}&soluong=" + currentValue;
		    addToCartBtn.setAttribute('href', href);
		}
		
		// Sự kiện lắng nghe khi giá trị của input thay đổi
		inputSoLuong.addEventListener('change', function() {
		    const currentValue = parseInt(inputSoLuong.value);
		    const href = "${pageContext.request.contextPath}/gio-hang/add?id=${item.id}&soluong=" + currentValue;
		    addToCartBtn.setAttribute('href', href);
		});
    </script>
</body>
</html>