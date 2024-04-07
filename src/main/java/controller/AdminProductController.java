package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.apache.commons.beanutils.BeanUtils;

import dao.SanPhamDAO;
import entity.SanPham;

@WebServlet({"/admin/product/edit", "/admin/product/delete", "/admin/product/create"})
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	SanPhamDAO spDAO = new SanPhamDAO();
	
    public AdminProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("/create")) {
			
		} else if(uri.contains("/edit")) {
			String id = request.getParameter("id");
			SanPham sp = spDAO.selectByID(Integer.parseInt(id));
			request.setAttribute("product", sp);
		}
		
		
		
		request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		if(uri.contains("/create")) {
			String tieuDe = request.getParameter("tieuDe");
			System.out.println(tieuDe);
			
		} else if(uri.contains("/edit")) {
			System.out.println("Edit");

		}
		request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
	}

}
