package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class Encode {
		Connection conn;
		Statement stmt;
	void connect () throws Exception {
		Class c = Class.forName("oracle.jdbc.driver.OracleDriver");
		// forName loads the class from HDD to MM
		 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "suraj", "12345");
		System.out.println("Connected");
	}
	public boolean login(String name, String mob, String email) throws Exception{
		connect();
		stmt = conn.createStatement();
		System.out.print(name);
		int marks = 0;
		long ct=System.currentTimeMillis()/1000;
		int flag = stmt.executeUpdate("insert into TEAM_DETAILS values ( '"+ mob + "', '"+ email + "', '" + name +"',"+ct+","+marks+")");
		conn.close();
		if(flag!=0)
			return true;
		return false;
	}
	public boolean marking(int f, String tn) throws Exception
	{
		connect();
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select marks from TEAM_DETAILS where name='"+tn+"'");
		rs.next();
		float mark = rs.getFloat("marks");
		if (f == 1)
			mark +=10;
		else
			mark -= 1;
				
		int flag = stmt.executeUpdate("update TEAM_DETAILS set marks = "+ mark+"where name='"+tn+"'");
		conn.close();
		if (flag != 0)
			return true;
		return false;
	}
	public long getTime(String name) throws Exception
	{
		connect();
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select time from TEAM_DETAILS where name='"+name+"'");
		rs.next();
		long time = rs.getLong("time");
		//time /= 1000;
		conn.close();
		return time;
		
	}
}