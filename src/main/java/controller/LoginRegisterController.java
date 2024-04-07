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
import dao.GioHangDAO;
import dao.KhachHangDAO;
import entity.ChiTietGioHang;
import entity.GioHang;
import entity.KhachHang;

@WebServlet({"/dang-nhap","/dang-ky","/dang-xuat"})
public class LoginRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    KhachHangDAO khDAO = new KhachHangDAO();
    ChiTietGioHangDAO ctghDAO = new ChiTietGioHangDAO();
	GioHangDAO ghDAO = new GioHangDAO();

	
    public LoginRegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("dang-xuat")) {
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}

		request.getRequestDispatcher("/views/user/login-register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("dang-nhap")) {
			doLogin(request, response);
		} else if(uri.contains("dang-ky")) {
			doRegister(request, response);
		}
	}
	
	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			KhachHang loginer = khDAO.selectByEmail(email);
			if(loginer != null) {
				if(password.equals(loginer.getPassword().trim())) {
					request.getSession().setAttribute("user", loginer);
					GioHang gh;
					try {
						gh = ghDAO.selectGioHangByMaKhachHang(loginer.getId());
					} catch (NoResultException e) {
						gh = new GioHang();
						gh.setKhachHang(loginer);
						gh.setNgayTao(LocalDate.now());
						ghDAO.insert(gh);
					}
					if(gh != null) {
						List<ChiTietGioHang> listCTGH = ctghDAO.selectChiTietGioHangByMaGioHang(gh.getId());
						request.getSession().setAttribute("cart", listCTGH);
					} 
					
					request.setAttribute("errorMessage", "Đăng nhập thành công!<br>");
				} else {
					request.setAttribute("errorMessage", "Email hoặc mật khẩu sai!<br>");
				}
			} else {
				request.setAttribute("errorMessage", "Email hoặc mật khẩu sai!");
			}
			doGet(request, response);
		} catch (NoResultException e) {
			response.sendRedirect(request.getContextPath() +"/dang-nhap");
		}
		
		
		
		
	}
	
	private void doRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("register-email");
		String password = request.getParameter("register-password");
		String confirmPassword = request.getParameter("register-confirm-password");
		String otp = request.getParameter("register-otp");
		//insert			
		
		KhachHang register = new KhachHang();
		register.setEmail(email);
		register.setPassword(confirmPassword);
		khDAO.insert(register);
		
		doGet(request, response);
	}
	
	private void doLogOut(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
}
