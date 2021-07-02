package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.User.UserDetails;


public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addUser(UserDetails us)
	{
		boolean f=false;
		try {
			String query="insert into enote_user(name,email,password) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3, us.getPassword());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public UserDetails loginUser(UserDetails us)
	{
		UserDetails user=null;
		
		String query="select * from enote_user where email=? and password=?";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				user=new UserDetails();
				user.setName(rs.getString(1));
				user.setEmail(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setId(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
