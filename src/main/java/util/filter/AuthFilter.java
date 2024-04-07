package util.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import entity.KhachHang;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter({"/gio-hang/*", "/profile/*"})
public class AuthFilter extends HttpFilter implements Filter {   

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse  response = (HttpServletResponse) resp;
		String uri = request.getRequestURI();
		KhachHang user = (KhachHang) request.getSession().getAttribute("user");
		String error = "";
		
		if (user == null) {
			error = "Login Needed!";
		} 
		
		if (!error.isEmpty()) {
//			request.setAttribute("errorMessage", "Đăng nhập để thực hiện được chức năng này!");
//			request.getRequestDispatcher("/home?error=" + error).forward(request, response);
			response.sendRedirect(request.getContextPath() +"/home?error=" + error);
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
