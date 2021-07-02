package com.DAO;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.User.Post;

import java.sql.Date;

public class NotesDAO {
	private Connection conn;

	public NotesDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addNote(Post p)
	{
		boolean f=false;
		try {
			String query="insert into enote_notes values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,p.getTitle());
			ps.setString(2,p.getNote());
			ps.setInt(3,p.getNid());
			int i=ps.executeUpdate();
			if(i ==1)
			{
				f=true;
			}		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
		
	}
	public List<Post> getNotes(int id)
	{
		return null;
	}
}
