package ezen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager
{
	private Connection conn   = null;

	private String host   = ""; //db주소
	private String userid = ""; //id
	private String userpw = ""; //pw

	private Statement  stmt   = null;
	private ResultSet  result = null;
	
	//작성한 sql구문 보여주기
	private boolean  isMonitering = true;

	public DBManager()
	{
		host   = "jdbc:mysql://localhost:3306/memodb?useUnicode=ture&characterEncoding=utf-8&serverTimezone=UTC";
		userid = "root";
		userpw = "ezen";
	}

	//setter
	public void setHost(String host) 	 { this.host = host;     }
	public void setUserid(String userid) { this.userid = userid; }
	public void setUserpw(String userpw) { this.userpw = userpw; }
	
	//DB 연결
	//반환: 성공-true, 실패-false
	public boolean DBOpen()
	{
		try
		{
			//JDBC 연결
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//db로그인
			conn = DriverManager.getConnection(host, userid, userpw);
		} catch (ClassNotFoundException e)
		{
			//Class.forName()
			e.printStackTrace();
			return false;
		} catch (SQLException e)
		{
			//DriverManager.getConnection()
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//DB 닫기
	public void DBClose()
	{
		try
		{
			//db닫기
			conn.close();
		} catch (SQLException e)
		{
			//DriverManager.getConnection()
			e.printStackTrace();
		}
	}
	
	//Insert, Update, Delete
	public boolean RunSQL(String sql)
	{
		if (isMonitering)
		{
			System.out.println("==========================");
			System.out.println(sql);
			System.out.println("==========================");
		}
		
		try
		{
			stmt = conn.createStatement(); //연결
			stmt.executeUpdate(sql); //sql
			stmt.close(); //닫기
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//select 열기
	public boolean OpenQuery(String sql)
	{
		if (isMonitering)
		{
			System.out.println("==========================");
			System.out.println(sql);
			System.out.println("==========================");
		}
		
		try
		{
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//select 닫기
	public void CloseQuery()
	{
		try
		{
			result.close();
			stmt.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//select getNext
	public boolean GetNext()
	{
		try
		{
			return result.next();
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	//select getValue
	public String GetValue(String culumn)
	{
		try
		{
			return result.getString(culumn);
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	//select getInteger
	public int GetInteger(String culumn)
	{
		try
		{
			return result.getInt(culumn);
		} catch (SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	
	//get last no
	public String GetLastNo() {
		String sql = "select last_insert_id() as no;";
		String no = null;
		
		OpenQuery(sql);
		if (GetNext() == true) no = GetValue("no");
		CloseQuery();
		return no;
	}
	
	/* '을 ''으로 */
	public String _R(String value)
	{
		return value.replace("'", "''");
	}
}