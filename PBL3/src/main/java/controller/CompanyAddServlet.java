package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Company;

import java.io.IOException;

import dao.CompanyDAO;

@WebServlet(urlPatterns = {"/company-add"})
public class CompanyAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html");
    	
    	try {
			
    		int id_user = (int)req.getSession().getAttribute("id_user");
    		String name = req.getParameter("name");
    		String title = req.getParameter("title");
    		String sort_desc = req.getParameter("sort_desc");
    		String address = req.getParameter("address");
    		int num_employees = Integer.parseInt(req.getParameter("num_employees"));
    		String website = req.getParameter("website");
    		String phone = req.getParameter("phone");
    		String email = req.getParameter("email");
    		
    		Company data = new Company(name, title, sort_desc, address, num_employees, website, phone, email);
    		CompanyDAO.addCompany(data, id_user);
    		
    		RequestDispatcher dispatcher = req.getRequestDispatcher("CompanyManageServlet");
    		dispatcher.forward(req, resp);
    		
    		
		} catch (Exception e) {e.printStackTrace();}
    	
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
    

}
