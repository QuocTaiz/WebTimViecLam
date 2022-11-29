package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;



import dao.AccountDAO;

@WebServlet(urlPatterns = {"/change-pass"})
public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html");
    	
    	try {
    		
    		String email = (String) req.getSession().getAttribute("email");
			
    		String pass_old = req.getParameter("pass_old");
    		String pass_new = req.getParameter("pass_new");
    		
    		String msg = "";
    		String color = "";
    		
    		if (AccountDAO.changePassword(email, pass_old, pass_new)) {
    			msg = "Đổi mật khẩu thành công!";
    			color = "green";
    		} else {
    			msg = "Đổi mật khẩu không thành công do mật khẩu cũ bị sai!";
    			color = "red";
    		}
    		
    		req.setAttribute("msg", msg);
    		req.setAttribute("color_msg", color);
    		RequestDispatcher dispatcher = req.getRequestDispatcher("view/change-pass.jsp");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html");
    	RequestDispatcher dispatcher = req.getRequestDispatcher("view/change-pass.jsp");
    	dispatcher.forward(req, resp);
    	
    }

}
