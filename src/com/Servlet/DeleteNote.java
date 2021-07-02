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
import com.User.UserDetails;
import com.User.VideoPost;

/**
 * Servlet implementation class DeleteNote
 */
@WebServlet("/DeleteNote")
public class DeleteNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		out.println("yeah u came here");
		HttpSession session=request.getSession();
		int id=Integer.parseInt(request.getParameter("uid"));
		String videoId=request.getParameter("videoId");
		try {
			Connection conn=DbConnect.getConn();
			VideoNoteDAO dao=new VideoNoteDAO(conn);
			List<VideoPost> ls = dao.deleteNote(id, videoId);
			out.println(ls);
			session.setAttribute("notes", ls);
			response.sendRedirect("shownotes.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	}

