package controller;

import java.io.IOException;

import dao.CompanyDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/company-manage"})
public class CompanyManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			
			int id_user = (int)req.getSession().getAttribute("id_user");
			req.setAttribute("listCpn", CompanyDAO.getListCompanyById(id_user));
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/company-manage.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
