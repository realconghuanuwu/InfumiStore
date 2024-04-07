package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.SanPhamDAO;
import entity.SanPham;

@WebServlet({ "/product" })
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SanPhamDAO spDAO = new SanPhamDAO();

	public ProductDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		SanPham sp = spDAO.selectByID(Integer.parseInt(id));
		if (sp != null) {
			request.setAttribute("item", sp);
		}

		request.getRequestDispatcher("/views/user/product-detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
