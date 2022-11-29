package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.CompanyDAO;

@WebServlet(urlPatterns = {"/company-delete"})
public class CompanyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	resp.setContentType("text/html");
    	
    	try {
			
    		int id_cpn = Integer.parseInt(req.getParameter("id_cpn"));
    		CompanyDAO.deleteCompanyById(id_cpn);
    		
    		RequestDispatcher dispatcher = req.getRequestDispatcher("CompanyManageServlet");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    	
    }

}
