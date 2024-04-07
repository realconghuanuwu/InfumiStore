package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.SanPhamDAO;
import entity.SanPham;

@WebServlet({"/admin/home"})
public class AdminHomePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    SanPhamDAO spDAO = new SanPhamDAO();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<SanPham> products = spDAO.selectAll();
		request.setAttribute("products", products);	
		request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
