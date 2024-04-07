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

@WebServlet({"/home"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    SanPhamDAO spDAO;
    List<SanPham> LNproducts;
    List<SanPham> MGproducts;
    List<SanPham> THproducts;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		spDAO = new SanPhamDAO();
		LNproducts = spDAO.selectSanPhamByPhanLoai("LN");
		MGproducts = spDAO.selectSanPhamByPhanLoai("MG");
		THproducts = spDAO.selectSanPhamByPhanLoai("TH");
		
		
		
		request.setAttribute("LNproducts", LNproducts.subList(0, Math.min(LNproducts.size(), 4)));
		request.setAttribute("MGproducts", MGproducts.subList(0, Math.min(MGproducts.size(), 4)));
		request.setAttribute("THproducts", THproducts.subList(0, Math.min(MGproducts.size(), 1)));
		request.getRequestDispatcher("/views/user/home.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
