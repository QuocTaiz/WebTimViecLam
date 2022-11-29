package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.JobApplyDAO;

@WebServlet(urlPatterns = {"/delete-job-apply"})
public class JobApplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
    	try {
			
    		int id_job_apply = Integer.parseInt(req.getParameter("id_job_apply"));
    		JobApplyDAO.deleteJobApply(id_job_apply);
    		
    		RequestDispatcher dispatcher = req.getRequestDispatcher("JobAppliedServlet");
    		dispatcher.forward(req, resp);
    		
    		
		} catch (Exception e) {e.printStackTrace();}
    }

}
