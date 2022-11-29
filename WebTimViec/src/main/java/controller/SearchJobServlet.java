package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Job;

import java.io.IOException;
import java.util.List;
import dao.JobDAO;

@WebServlet(urlPatterns = {"/job-list"})
public class SearchJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		
		try {
			
			String keySearch = req.getParameter("txtSearch");
			String address = req.getParameter("txtAddress");
			String jobCate = req.getParameter("cbbJobCate");
			
			
			List<Job> listJob = JobDAO.getListJobBySearch(keySearch, address, jobCate);
			req.setAttribute("listJob", listJob );
			req.setAttribute("countJob", listJob.size());
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-list.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		
		try {
			List<Job> listJob = JobDAO.getListJobBySearch("", "", "");
			req.setAttribute("listJob", listJob );
			req.setAttribute("countJob", listJob.size());
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-list.jsp");
			dispatcher.forward(req, resp);
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
}
