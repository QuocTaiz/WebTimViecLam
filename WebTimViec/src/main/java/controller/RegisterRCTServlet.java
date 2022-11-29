package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

import com.mysql.jdbc.PreparedStatement;

import dao.AccountDAO;
import dao.ConnectDB;

@WebServlet(urlPatterns = {"/register-rct"})
public class RegisterRCTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
		
		try {
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
			String role = "recruiter";
			
			if (AccountDAO.checkEmail(email)==false) {
				String sql = "insert into account(email, password, role) values ( ? , ? , ?)";
			
				Connection conn = ConnectDB.getConnection();
				PreparedStatement prestmInsert = (PreparedStatement)conn.prepareStatement(sql);
				prestmInsert.setString(1, email);
				prestmInsert.setString(2, pass);
				prestmInsert.setString(3, role);
				prestmInsert.executeUpdate();
				conn.close();
				
				req.setAttribute("status", "success");
				RequestDispatcher dispatcher = req.getRequestDispatcher("view/user-register.jsp");
				dispatcher.forward(req, resp);
			} else {
				req.setAttribute("status", "fail");
				RequestDispatcher dispatcher = req.getRequestDispatcher("view/user-register.jsp");
				dispatcher.forward(req, resp);
			}
			
		} catch (Exception e) {e.printStackTrace();}
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
    
}
