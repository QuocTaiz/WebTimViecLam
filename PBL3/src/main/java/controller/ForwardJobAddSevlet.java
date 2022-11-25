package controller;

import java.io.IOException;

import dao.CompanyDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/forward-job-add"})
public class ForwardJobAddSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			resp.setContentType("text/html");
			
			try {
				
				int id_user = (int)req.getSession().getAttribute("id_user");
				req.setAttribute("listNameCpn", CompanyDAO.getListNameCompanyById(id_user));
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("view/job-add.jsp");
				dispatcher.forward(req, resp);
				
			} catch (Exception e) {e.printStackTrace();}
			
		}	
		
}
