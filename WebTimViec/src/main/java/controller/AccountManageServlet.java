package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.AccountDAO;

@WebServlet(urlPatterns = {"/acc-manage"})
public class AccountManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
    	try {
			
    		req.setAttribute("listAccount", AccountDAO.getAllAccount());
    		RequestDispatcher dispatcher = req.getRequestDispatcher("view/acc-manage.jsp");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	resp.setContentType("text/html");
    	try {
			
    		int id_acc = Integer.parseInt(req.getParameter("id_account"));
    		String status = req.getParameter("status");
    		if (status.equals("block")) {
    			AccountDAO.blockAccount(id_acc);
    		}
    		if (status.equals("delete")) {
    			AccountDAO.deleteAccount(id_acc);
    		}
    		if (status.equals("unblock")) {
    			AccountDAO.unBlockAccount(id_acc);
    		}
    		
    		req.setAttribute("listAccount", AccountDAO.getAllAccount());
    		RequestDispatcher dispatcher = req.getRequestDispatcher("view/acc-manage.jsp");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    	
    }
    
}
