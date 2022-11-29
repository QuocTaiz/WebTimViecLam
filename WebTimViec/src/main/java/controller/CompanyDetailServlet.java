package controller;

import java.io.IOException;

import dao.CompanyDAO;
import dao.JobDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Company;

@WebServlet(urlPatterns = {"/company-detail"})
public class CompanyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			int id_cpn = Integer.parseInt(req.getParameter("id_cpn"));
			Company data = CompanyDAO.getCompanyById(id_cpn);
			req.setAttribute("cpn", data);
			req.setAttribute("listJob", JobDAO.getListJobByIdCpn(id_cpn));
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/company-detail.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
}
