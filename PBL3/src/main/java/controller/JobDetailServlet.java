package controller;

import java.io.IOException;

import dao.JobDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/job-detail"})
public class JobDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		try {
			
			 int id_job = Integer.parseInt(req.getParameter("id_job"));
			 req.setAttribute("job", JobDAO.getJobById(id_job));
			 
			 RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-detail.jsp");
			 dispatcher.forward(req, resp);
			 
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
