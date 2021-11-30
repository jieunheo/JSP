package ezen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager
{
	//db오픈
	private Connection conn   = null;

	//db연결할 변수
	private String host   = ""; //db주소
	private String userid = ""; //id
	private String userpw = ""; //pw

	//작업 처리용 클래스
	private Statement  stmt   = null;
	private ResultSet  result = null; //데이터 cursor
	
	//쿼리문 확인
	private boolean  isMonitering = true;

	public DBManager()
	{
		host   = "jdbc:mysql://localhost:3306/boarddb?useUnicode=ture&characterEncoding=utf-8&serverTimezone=UTC";
		userid = "root";
		userpw = "ezen";
	}

	//setter
	public void setHost(String host) 	 { this.host = host;     }
	public void setUserid(String userid) { this.userid = userid; }
	public void setUserpw(String userpw) { this.userpw = userpw; }
	
	//DB 연결
	//리턴값: 성공-true, 실패-false
	public boolean DBOpen()
	{
		try
		{
			//JDBC 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//db연결
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
	
	//DB 연결 취소
	public void DBClose()
	{
		try
		{
			//db연결 종료(*필수)
			conn.close();
		} catch (SQLException e)
		{
			//DriverManager.getConnection()
			e.printStackTrace();
		}
	}
	
	//Insert, Update, Delete SQL구문 처리
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
			//작업 처리용 클래스 할당
			stmt = conn.createStatement();
			
			//sql문 적용 - 세미콜론 생략 가능
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//select SQL구문 처리 - 오픈
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
			//작업 처리용 클래스 할당
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//select SQL구문 처리 - 클로즈
	public void CloseQuery()
	{
		try
		{
			//닫기(*필수)
			result.close();
			stmt.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//select SQL구문 처리 - 커서 확인
	public boolean GetNext()
	{
		try
		{
			//다음 값 가리키기
			return result.next();
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	//select SQL구문 처리 - 값 가져오기
	public String GetValue(String culumn)
	{
		try
		{
			//값 문자열로 가져오기
			return result.getString(culumn);
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null; //값 없으면 null 반환
		}
	}
	
	//select SQL구문 처리 - 값 가져오기
	public int GetInteger(String culumn)
	{
		try
		{
			//값 문자열로 가져오기
			return result.getInt(culumn);
		} catch (SQLException e)
		{
			e.printStackTrace();
			return 0; //값 없으면 null 반환
		}
	}
	
	//Last Id
	public String GetLastID() {
		String sql = "select last_insert_id() as bno;";
		String bno = "";
		try
		{
			ResultSet result = stmt.executeQuery(sql);
			result = stmt.executeQuery(sql);
			if (result.next() == true)
			{
				bno = result.getString("bno");
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bno;
	}
	
	public static void main(String args[])
	{
	
	}
}