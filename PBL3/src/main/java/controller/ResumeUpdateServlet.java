package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CV;

import java.io.IOException;

import dao.ResumeDAO;

@WebServlet(urlPatterns = {"/resume-update"})
public class ResumeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html");
    	
    	try {
			
    		int id_cv = Integer.parseInt(req.getParameter("id_cv"));
    		
    		CV data = ResumeDAO.getCVFromId(id_cv);
    		
    		req.setAttribute("CV", data);
    		RequestDispatcher dispatcher = req.getRequestDispatcher("view/resume-add.jsp");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    	
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html");
    	
    	try {
    		int id_cv = Integer.parseInt(req.getParameter("id_cv"));
    		String name = req.getParameter("name");
    		String title = req.getParameter("title");
    		String sort_desc = req.getParameter("sort-desc");
    		String address = req.getParameter("address");
    		int old = Integer.parseInt(req.getParameter("old"));
    		String email = req.getParameter("email");
    		String phone = req.getParameter("phone");
    		String exp = req.getParameter("exp");
    		String degree = req.getParameter("degree");
    		
    		CV data = new CV(id_cv, name, title, sort_desc, address, old, email, phone, exp, degree);
    		
    		ResumeDAO.updateCV(data);
    		
    		RequestDispatcher dispatcher = req.getRequestDispatcher("ResumeManageServlet");
    		dispatcher.forward(req, resp);
    		
    	} catch (Exception e) {e.printStackTrace();}
    
    }

}
