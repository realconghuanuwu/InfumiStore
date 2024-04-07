package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

import dao.HoaDonDAO;
import dao.KhachHangDAO;
import entity.ChiTietHoaDon;
import entity.HoaDon;
import entity.KhachHang;

@WebServlet({"/profile/edit", "/profile/change-password", "/profile/my-comment", "/profile/my-order"})
public class UserProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	KhachHangDAO khDAO = new KhachHangDAO();
	ChiTietHoaDon cthdDAO = new ChiTietHoaDon();
	HoaDonDAO hdDAO = new HoaDonDAO();
	
    public UserProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("edit")) {
			KhachHang user = (KhachHang) request.getSession().getAttribute("user");
			if(user != null) {
				request.setAttribute("firstname", user.getTen());
				request.setAttribute("lastname", user.getHoVaTenLot());
				request.setAttribute("email", user.getEmail());
				request.setAttribute("sdt", user.getSoDienThoai());
				request.setAttribute("address", user.getDiaChi());
				request.setAttribute("birthday", user.getNgaySinh());
				request.setAttribute("gender", user.getGioiTinh());
			}
			request.getRequestDispatcher("/views/user/edit-profile.jsp").forward(request, response);
		} else if(uri.contains("change-password")) {
			request.getRequestDispatcher("/views/user/change-password.jsp").forward(request, response);
		} else if(uri.contains("my-comment")) {
			request.getRequestDispatcher("/views/user/my-comment.jsp").forward(request, response);
		} else if(uri.contains("my-order")) {
			KhachHang user = (KhachHang) request.getSession().getAttribute("user");	
			List<HoaDon> listHDon = hdDAO.selectGioHangByMaKhachHang(user.getId());	
			Collections.reverse(listHDon);
			request.setAttribute("orders", listHDon);
			request.getRequestDispatcher("/views/user/my-product.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/views/user/edit-profile.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("edit")) {
			doEditProfile(request,response);
			doGet(request, response);
		} else if(uri.contains("change-password")) {
			doChangePassword(request, response);
			request.getRequestDispatcher("/views/user/change-password.jsp").forward(request, response);
		} else if(uri.contains("my-comment")) {
			request.getRequestDispatcher("/views/user/my-comment.jsp").forward(request, response);
		} else if(uri.contains("my-order")) {
			request.getRequestDispatcher("/views/user/my-product.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/views/user/edit-profile.jsp").forward(request, response);
		}
	}
	
	private void doEditProfile(HttpServletRequest request, HttpServletResponse response) {
		KhachHang kh = (KhachHang) request.getSession().getAttribute("user");	
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
//		String email = request.getParameter("email");
		String sdt = request.getParameter("sdt");
		Boolean gender = request.getParameter("gender").equals("true");
		String address = request.getParameter("address");
		String birthDay = request.getParameter("birthday");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		kh.setId(kh.getId());
		kh.setTen(firstName);
		kh.setHoVaTenLot(lastName);
		kh.setGioiTinh(gender);
		kh.setDiaChi(address);
		kh.setNgaySinh(LocalDate.parse(birthDay, formatter));
		kh.setSoDienThoai(sdt);
		khDAO.update(kh);
	}
	
	private void doChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhachHang kh = (KhachHang) request.getSession().getAttribute("user");	
		String password = request.getParameter("password").trim();
		String newPassword = request.getParameter("new-password").trim();
		String confirmNewPassword = request.getParameter("confirm-new-password").trim();
		
		System.out.println(password);
		System.out.println(newPassword);
		System.out.println(confirmNewPassword);
		System.out.println(kh.getPassword());
		
		if(password.isBlank() || newPassword.isBlank() || confirmNewPassword.isBlank()) {
			request.setAttribute("errorMessage", "Ô không được để trống!");
		} else if(!password.equals(kh.getPassword().trim())) {
			request.setAttribute("errorMessage", "Mật khẩu hiện tại không đúng!");
		} else if(!newPassword.equals(confirmNewPassword)) {
			request.setAttribute("errorMessage", "Mật khẩu mới và xác nhận mật khẩu mới phải trùng!");
		} else {
			kh.setPassword(confirmNewPassword);
			khDAO.update(kh);
			request.setAttribute("errorMessage", "Cập nhật mật khẩu mới thành công!");
		}
		
	}
	
	

}
