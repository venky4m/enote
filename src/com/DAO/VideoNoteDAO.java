package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.VideoPost;

public class VideoNoteDAO {
		private Connection conn;
		public  VideoNoteDAO(Connection conn)
		{
			super();
			this.conn=conn;
		}
		public boolean addVideoNote(VideoPost p)
		{
			boolean f=false;
			try {
				String query="insert into enote_vedio_note values(?,?,?,?,?,?)";
				PreparedStatement ps=conn.prepareStatement(query);
				ps.setInt(1,p.getNid());
				ps.setString(2, p.getVideoId());
				ps.setString(3,p.getTitle());
				ps.setString(4,p.getNote());
				ps.setFloat(5,p.getTime());
				ps.setString(6, p.getProjectName());
				System.out.println(p.getVideoId()+"this is videoid");
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
		public List<VideoPost> getNotes(int id)
		{
			List<VideoPost> ls=new ArrayList<VideoPost>();
			String query= "select * from enote_vedio_note where id=? order by vedioid";
			try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				VideoPost p =new VideoPost(rs.getInt(1),rs.getString(3),rs.getString(4),rs.getFloat(5),rs.getString(2),rs.getString(6));
				ls.add(p);
				//System.out.println(p);
			}
			}
			catch(Exception e) {}
			return ls;
			
		}
		public List<VideoPost> deleteNote(int id,String videoId)
		{
			String query= "delete  from enote_vedio_note  where id=? and vedioid=?";
			System.out.println(videoId);
			try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, videoId);
			int rs=ps.executeUpdate();
			}
			catch(Exception e) {}
			List<VideoPost> ls=getNotes(id);
			return ls;
		}
}
