package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CV;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import dao.ConnectDB;

@WebServlet(urlPatterns = {"/resume-manage"})
public class ResumeManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
    	
    	try {
    		
			int id_user = (Integer)req.getSession().getAttribute("id_user");
			List<CV> listCV = new Vector<CV>();
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from cv where id_create = ?";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setInt(1, id_user);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				CV data = new CV();
				data.setId(rs.getInt("id"));
				data.setName(rs.getString("name"));
				data.setTitle(rs.getString("title"));
				data.setSort_desc(rs.getString("sort_desc"));
				data.setAddress(rs.getString("address"));
				data.setOld(rs.getInt("old"));
				data.setEmail(rs.getString("email"));
				data.setPhone(rs.getString("phone"));
				data.setChange_time(rs.getDate("change_time"));
				listCV.add(data);
			}
			conn.close();
			
			req.setAttribute("listCV", listCV);
			RequestDispatcher dispatcher = req.getRequestDispatcher("view/resume-manage.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {e.printStackTrace();}
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doGet(req, resp);
    }
    

}
