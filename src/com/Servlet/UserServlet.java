package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		String name=request.getParameter("fname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao = null;
		try {
			dao = new UserDAO(DbConnect.getConn());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean f=dao.addUser(us);
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		if(f==true)
		{
			session.setAttribute("reg-success", "Successfully Regestered");
			response.sendRedirect("regester.jsp");
		}
		else
		{
			session.setAttribute("failed-msg", "something went wrong");
			response.sendRedirect("regester.jsp");
		}
	}
}
