package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.VideoNoteDAO;
import com.Db.DbConnect;
import com.User.Post;
import com.User.UserDetails;
import com.User.VideoPost;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Servlet implementation class ShowNotes
 */
@WebServlet("/ShowNotes")
public class ShowNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
			try {
					conn=DbConnect.getConn();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			HttpSession session=request.getSession();
			UserDetails us2=(UserDetails) session.getAttribute("user");
			VideoNoteDAO dao=new VideoNoteDAO(conn);
			List<VideoPost> ls=new ArrayList<VideoPost>();
			if(us2==null)
			{
				response.sendRedirect("login.jsp");
			}
			ls=dao.getNotes(us2.getId());
			/*PrintWriter out=response.getWriter();
		
			 * out.println("<h1>Hello</h1>"); out.println(conn); out.println(dao);
			 * out.println("<br>");
			 */
			//out.println(j);
			session.setAttribute("notes", ls);
			response.sendRedirect("shownotes.jsp");
	}

}
