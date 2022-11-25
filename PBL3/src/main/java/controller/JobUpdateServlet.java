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
import model.Job;
import service.Service;

@WebServlet(urlPatterns = {"/job-update"})
public class JobUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			
			int id_user = (int)req.getSession().getAttribute("id_user");
			int id_job = Integer.parseInt(req.getParameter("id_job"));
			req.setAttribute("job", JobDAO.getJobById(id_job));
			req.setAttribute("listNameCpn", CompanyDAO.getListNameCompanyById(id_user));
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-add.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			
			int id_job = Integer.parseInt(req.getParameter("id_job"));
			int id_cpn = CompanyDAO.getIdCompanyByName(req.getParameter("nameCpn"));
    		String name_cpn = CompanyDAO.getCompanyById(id_cpn).getName();
    		String title = req.getParameter("title");
    		String sort_desc = req.getParameter("sort_desc");
    		String address = req.getParameter("address");
    		String job_type = req.getParameter("job_type");
    		String job_salary = req.getParameter("job_salary");
    		String job_NoHW = req.getParameter("job_NoHW");
    		String job_exp = req.getParameter("job_exp");
    		String job_degree = Service.getStringFromListString(req.getParameterValues("job_degree"));
    		Job job = new Job(id_job, id_cpn, name_cpn, title, sort_desc, address, job_type, job_salary, job_exp, job_NoHW, job_degree);
    		JobDAO.updateJob(job);
    		
    		RequestDispatcher dispatcher = req.getRequestDispatcher("JobManageServlet");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
	}
	
}
