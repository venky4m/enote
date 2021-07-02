package com.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DbConnect;
import com.User.UserDetails;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		Connection conn=null;
		try {
			conn=DbConnect.getConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		UserDAO dao=new UserDAO(conn);
		UserDetails ud=dao.loginUser(us);
		
		if(ud!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("user", ud);
			response.sendRedirect("home.jsp");
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("invalid", "invalid username and password");
			response.sendRedirect("login.jsp");
		}
		
	}

}
