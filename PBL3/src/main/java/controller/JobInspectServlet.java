package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.JobDAO;

@WebServlet(urlPatterns = {"/job-inspect"})
public class JobInspectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			
			req.setAttribute("listJob", JobDAO.getListAllJob());
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-inspect.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			
			int id_job = Integer.parseInt(req.getParameter("id_job"));
			String status = req.getParameter("status");
			if (status.equals("Đã duyệt")) {
				JobDAO.setStatus(id_job, status);
			}
			if (status.equals("Xoá")) {
				JobDAO.deleteJob(id_job);
			}
			
			req.setAttribute("listJob", JobDAO.getListAllJob());
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-inspect.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}

}
