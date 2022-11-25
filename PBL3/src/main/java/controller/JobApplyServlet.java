package controller;

import java.io.IOException;

import dao.JobDAO;
import dao.JobApplyDAO;
import dao.ResumeDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/job-apply"})
public class JobApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			
			int id_user = (int)req.getSession().getAttribute("id_user");
			int id_job = Integer.parseInt(req.getParameter("id_job"));
			req.setAttribute("job", JobDAO.getJobById(id_job));
			req.setAttribute("listResume", ResumeDAO.getListCV(id_user));
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-apply.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		
		try {
			int id_user = (int)req.getSession().getAttribute("id_user");
			int id_cv = Integer.parseInt(req.getParameter("id_cv"));
			int id_job = Integer.parseInt(req.getParameter("id_job"));
			
			JobApplyDAO.addJobApply(id_user, id_cv, id_job);
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/index.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
	}
	
}
