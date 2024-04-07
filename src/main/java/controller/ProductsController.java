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

@WebServlet({"/products"})
public class ProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	SanPhamDAO spDAO = new SanPhamDAO();
	
    public ProductsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phanLoai = request.getParameter("phanloai");
		List<SanPham> products = null;
		
		if(phanLoai.equals("LN")) {
			products = spDAO.selectSanPhamByPhanLoai("LN");
			request.setAttribute("tendanhsach","Light Novel");
		} else if(phanLoai.equals("MG")) {
			products = spDAO.selectSanPhamByPhanLoai("MG");
			request.setAttribute("tendanhsach","Manga");
		} else if(phanLoai.equals("TH")) {
			products = spDAO.selectSanPhamByPhanLoai("TH");
			request.setAttribute("tendanhsach","Tin Học");
		}
		request.setAttribute("products", products);

		
		
		
		
		
		
		request.getRequestDispatcher("/views/user/products.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
