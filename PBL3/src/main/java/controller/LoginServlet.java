package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;




import dao.AccountDAO;


@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			String email = (String)req.getParameter("email");
			String password = (String)req.getParameter("pass");
			
			Account data = AccountDAO.checkLogin(email, password);
			
			
			
			if (data.getRole() == "") {
				
				req.setAttribute("status", "wrong");
				RequestDispatcher dispatcher = req.getRequestDispatcher("view/user-login.jsp");
				dispatcher.forward(req, resp);
				
			} 
			if (data.getRole() != "" && data.isBlock() == true) {
				
				req.setAttribute("status", "blocked");
				RequestDispatcher dispatcher = req.getRequestDispatcher("view/user-login.jsp");
				dispatcher.forward(req, resp);
				
			} 
			if (data.getRole() != "" && data.isBlock() == false){
				HttpSession session = req.getSession(true);
				session.setAttribute("role", data.getRole());
				session.setAttribute("email", email);
				session.setAttribute("id_user", data.getId());
				RequestDispatcher dispatcher = req.getRequestDispatcher("view/index.jsp");
				dispatcher.forward(req, resp);
			
			}
			
			
			
		} catch (Exception e) {e.printStackTrace();}
		
	}	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}

