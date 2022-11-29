package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
    	
    	try {
			
    		HttpSession session = req.getSession();
    		session.invalidate();
    		RequestDispatcher dispatcher = req.getRequestDispatcher("");
    		dispatcher.forward(req, resp);
    		
		} catch (Exception e) {e.printStackTrace();}
    }

}
