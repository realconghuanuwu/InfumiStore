package controller;

import jakarta.persistence.NoResultException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import dao.ChiTietGioHangDAO;
import dao.ChiTietHoaDonDAO;
import dao.GioHangDAO;
import dao.HoaDonDAO;
import dao.KhachHangDAO;
import dao.SanPhamDAO;
import entity.ChiTietGioHang;
import entity.ChiTietHoaDon;
import entity.GioHang;
import entity.HoaDon;
import entity.KhachHang;
import entity.SanPham;

@WebServlet({ "/gio-hang", "/gio-hang/add", "/gio-hang/delete", "/gio-hang/update", "/thanh-toan" })
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SanPhamDAO spDAO = new SanPhamDAO();
	ChiTietGioHangDAO ctghDAO = new ChiTietGioHangDAO();
	KhachHangDAO khDAO = new KhachHangDAO();
	GioHangDAO ghDAO = new GioHangDAO();
	ChiTietHoaDonDAO cthdDAO = new ChiTietHoaDonDAO();
	HoaDonDAO hdDAO = new HoaDonDAO();
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		KhachHang kh = (KhachHang) request.getSession().getAttribute("user");
		
		if (kh == null) {
			request.getRequestDispatcher("/views/user/cart.jsp").forward(request, response);
			return;
		}
//
		if (uri.contains("add")) {
			doAddSanPhamToGioHang(request, response, kh);
		} else if (uri.contains("update")) {
			boolean congAction = request.getParameter("action").trim().equals("cong");
			int idSanPham = Integer.parseInt(request.getParameter("id"));
			SanPham sp = spDAO.selectByID(idSanPham);
			GioHang gh = ghDAO.selectGioHangByMaKhachHang(kh.getId());
			
			if (congAction) {
				System.out.println(sp.getSoLuong());
				if(sp.getSoLuong() <= 0) {
					System.out.println("Sản phẩm có số lượng 0 không thể thêm!");
					response.sendRedirect(request.getContextPath() + "/home?error=san pham het hang");
					return;
				}
				List<ChiTietGioHang> ctgh = ctghDAO.selectChiTietGioHangByMaGioHang(gh.getId());
				for (ChiTietGioHang item : ctgh) {
					if (item.getSanPham().getId() == sp.getId()) {
						item.setId(item.getId());
						item.setGioHang(gh);
						item.setSanPham(sp);
						if(item.getSoLuong() > item.getSanPham().getSoLuong()) {
							item.setSoLuong(item.getSoLuong());
						} else {
							item.setSoLuong(item.getSoLuong() + 1);
						}
						ctghDAO.update(item);
						break;
					}
				}
				forwardToGioHang(request, response, kh);
			} else {
				List<ChiTietGioHang> ctgh = ctghDAO.selectChiTietGioHangByMaGioHang(gh.getId());
				for (ChiTietGioHang item : ctgh) {
					if (item.getSanPham().getId() == sp.getId()) {
						item.setId(item.getId());
						item.setGioHang(gh);
						item.setSanPham(sp);
						if (item.getSoLuong() <= 1) {
							deleteCTSP(request, response, kh);
							updateGioHang(request, gh);
							response.sendRedirect(request.getContextPath() + "/gio-hang");
						} else {
							item.setSoLuong(item.getSoLuong() - 1);
							ctghDAO.update(item);
							updateGioHang(request, gh);
							forwardToGioHang(request, response, kh);
						}
						break;
					}
				}
			}

		} else if (uri.contains("delete")) {
			deleteCTSP(request, response, kh);
			forwardToGioHang(request, response, kh);
		} else if (uri.contains("thanh-toan")) {
			doThanhToan(request, response, kh);
			
		} else {
			forwardToGioHang(request, response, kh);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void doThanhToan(HttpServletRequest request, HttpServletResponse response, KhachHang kh) throws IOException {
		GioHang gh = ghDAO.selectGioHangByMaKhachHang(kh.getId());
		
		HoaDon newHD = new HoaDon();
		newHD.setId(gh.getId());
		newHD.setKhachHang(gh.getKhachHang());
		newHD.setNgayTao(LocalDate.now());
		newHD.setTrangThai("Đang xử lý");
		hdDAO.insert(newHD);
					
		List<ChiTietGioHang> ctgh = ctghDAO.selectChiTietGioHangByMaGioHang(gh.getId());

		for (ChiTietGioHang ctghItem : ctgh) {
			ChiTietHoaDon newCTHD = new ChiTietHoaDon();
			SanPham spPham = ctghItem.getSanPham(); 
			newCTHD.setHoaDon(newHD);
			newCTHD.setId(ctghItem.getId());
			newCTHD.setSanPham(spPham);
			newCTHD.setSoLuong(ctghItem.getSoLuong());
			cthdDAO.insert(newCTHD);
			ctghDAO.delete(ctghItem.getGioHang().getId(), spPham.getId());
			
			//update lại số lượng khi xóa giỏ hàng
			spPham.setSoLuong(spPham.getSoLuong() - ctghItem.getSoLuong());
			spDAO.update(spPham);
		}
		
		ghDAO.delete(gh.getId().intValue());
		updateGioHang(request, gh);
		response.sendRedirect(request.getContextPath() + "/profile/my-order");
	}

	private void doAddSanPhamToGioHang(HttpServletRequest request, HttpServletResponse response, KhachHang kh)
			throws ServletException, IOException {
		// get giá trị sản phẩm vs giỏ hàng
		int idSanPham = Integer.parseInt(request.getParameter("id"));
		String soLuongInDetailPage = request.getParameter("soluong");
		GioHang gh;
		try {
			gh = ghDAO.selectGioHangByMaKhachHang(kh.getId());
		} catch (NoResultException e) {
			gh = new GioHang();
			gh.setKhachHang(kh);
			gh.setNgayTao(LocalDate.now());
			ghDAO.insert(gh);
		}
		
		
		SanPham sp = spDAO.selectByID(idSanPham);
		//validation	
		if(sp.getSoLuong() <= 0) {
			System.out.println("Sản phẩm có số lượng 0 không thể thêm!");
			response.sendRedirect(request.getContextPath() + "/home?error=san pham het hang");
			return;
		} else if(soLuongInDetailPage != null) {
			if(Integer.parseInt(soLuongInDetailPage) > sp.getSoLuong()) {
				response.sendRedirect(request.getContextPath() + "/home?error=so luong san pham khong du de them");
				return;
			}
		}
		
		if (gh != null && sp != null) {
			ChiTietGioHang ctgh = new ChiTietGioHang();
			ctgh.setGioHang(gh);
			ctgh.setSanPham(sp);
			
			
					
			
			if(soLuongInDetailPage != null) {
				ctgh.setSoLuong(Integer.parseInt(soLuongInDetailPage));
			} else {
				ctgh.setSoLuong(1);
			}
			
			// check nếu sản phẩm đã tồn tại trong CHiTietGIoHang thì update
			for (ChiTietGioHang item : ctghDAO.selectChiTietGioHangByMaGioHang((long) gh.getId())) {
				if (item.getSanPham().getId() == sp.getId()) {
					// update
					ctgh.setId(item.getId());
					if(soLuongInDetailPage != null) {
						ctgh.setSoLuong(item.getSoLuong() + Integer.parseInt(soLuongInDetailPage));
					} else {
						ctgh.setSoLuong(item.getSoLuong() + 1);
					}
					
					ctghDAO.update(ctgh);
										
					response.sendRedirect(request.getContextPath() + "/home");
					return;
				}
			}

			ctghDAO.insert(ctgh);
			updateGioHang(request, gh);
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}

	private void forwardToGioHang(HttpServletRequest request, HttpServletResponse response, KhachHang kh)
			throws ServletException, IOException {
		GioHang gh = ghDAO.selectGioHangByMaKhachHang(kh.getId());
		List<ChiTietGioHang> listCTGH = ctghDAO.selectChiTietGioHangByMaGioHang(gh.getId());
		request.setAttribute("ctghs", listCTGH);
		double thanhTien = 0;
		for (ChiTietGioHang chiTietGioHang : listCTGH) {
			double gia = (double) (chiTietGioHang.getSanPham().getDonGia() * chiTietGioHang.getSoLuong());
			thanhTien += gia;
		}
		request.setAttribute("thanhtien", thanhTien);
		request.getRequestDispatcher("/views/user/cart.jsp").forward(request, response);
	}

	private void deleteCTSP(HttpServletRequest request, HttpServletResponse response, KhachHang kh)
			throws ServletException, IOException {
		// get mã sp và mã giỏ hàng
		int idSanPham = Integer.parseInt(request.getParameter("id"));
		GioHang gh = ghDAO.selectGioHangByMaKhachHang(kh.getId());
		if (idSanPham != 0 && gh != null) {
			ctghDAO.delete(gh.getId(), (long) idSanPham);
		}
		updateGioHang(request, gh);
	}
	
	private void updateGioHang(HttpServletRequest request, GioHang gh) {
		request.getSession().setAttribute("cart", ctghDAO.selectChiTietGioHangByMaGioHang((long) gh.getId()));	
	}
}
