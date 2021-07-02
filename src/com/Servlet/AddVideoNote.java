package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
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

@WebServlet("/AddVideoNote")
public class AddVideoNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean f=false;
		String title=request.getParameter("title");
		String note=request.getParameter("note");
		String videoId = request.getParameter("videoid");
		String projectName=request.getParameter("project");
		HttpSession session=request.getSession();
		UserDetails us1 = (UserDetails) session.getAttribute("user");
		int id=us1.getId();
		float time=0;
		VideoPost p=new VideoPost(id,  title, note,time, videoId,projectName);
		System.out.println(videoId+"in addnote servlet");
		PrintWriter out=response.getWriter();
		out.println(p.getProjectName());
		out.println(projectName);
		try {
			Connection conn=DbConnect.getConn();
			VideoNoteDAO dao=new VideoNoteDAO(conn);
			f=dao.addVideoNote(p);
			//out.println(conn);
			//out.println(dao.addNote(p));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(f==true)	
		{
			session.setAttribute("note-sucess","your notes saved successfully");
			response.sendRedirect("videoNote.jsp?link=="+videoId+"&&project="+projectName+"");
		}
		else
		{
			session.setAttribute("note-fail", "some error occured at our end");
			response.sendRedirect("videoNote.jsp?link==\"+videoId+\"&&project=\"+projectName+\"");
		}
	}

}
