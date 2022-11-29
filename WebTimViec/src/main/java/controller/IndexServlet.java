package controller;

import java.io.IOException;

import dao.JobDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {""})
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		try {
			HttpSession session = req.getSession(true);
			session.setAttribute("listJobLatest", JobDAO.getListJobLatest());
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/index.jsp");
			dispatcher.forward(req, resp);
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
