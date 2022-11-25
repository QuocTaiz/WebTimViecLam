package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.ResumeDAO;

@WebServlet(urlPatterns = {"/resume-detail"})
public class ResumeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	resp.setContentType("text/html");
    	
    	try {
			
    		int id_cv = Integer.parseInt(req.getParameter("id_cv"));
    		
    		req.setAttribute("CV", ResumeDAO.getCVFromId(id_cv));
    		
    		RequestDispatcher dispatcher = req.getRequestDispatcher("view/resume-detail.jsp");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    	
    }

}
