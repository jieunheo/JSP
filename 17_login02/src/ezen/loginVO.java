package ezen;

import java.text.SimpleDateFormat;

public class loginVO
{
	protected String userID;    //아이디
	protected String userName;  //이름
	protected int	 userAge;   //나이
	protected String userLevel; //A:관리자, U:사용자
	
	/* 생성자 */
	public loginVO() {}
	public loginVO(String userID, String userName, int userAge, String userLevel) {
		this.userID 	= userID;
		this.userName 	= userName;
		this.userAge 	= userAge;
		this.userLevel 	= userLevel;
	}
	
	/* getter */
	public String getUserID()	 { return userID;	 }
	public String getUserName()	 { return userName;	 }
	public int 	  getUserAge()	 { return userAge;	 }
	public String getUserLevel() { return userLevel; }
	
	/* setter */
	public void setUserID(String userID)	   { this.userID = userID;		 }
	public void setUserName(String userName)   { this.userName = userName;	 }
	public void setUserAge(int userAge)		   { this.userAge = userAge;	 }
	public void setUserLevel(String userLevel) { this.userLevel = userLevel; }
	
	/* 권한 가져오기 */
	public String getLevelName()
	{
		if( userLevel.equals("A") )	return "관리자";
		else						return "사용자";
	}
	
	/* 정보 출력 */
	public void PrintInfo() {
		SimpleDateFormat date = new SimpleDateFormat("[yyyy.MM.dd HH:mm:ss]");
		String now = date.format(System.currentTimeMillis());
		
		System.out.println("--------------login 정보--------------");
		System.out.println(now + " ID: "    + this.getUserID());
		System.out.println(now + " Name: "  + this.getUserName());
		System.out.println(now + " Age: "   + this.getUserAge());
		System.out.println(now + " Level: " + this.getUserLevel());
		System.out.println(now + " LevelName: " + this.getLevelName());
		System.out.println("-------------------------------------");
	}
	
	
	public static void main(String[] args)
	{
		loginVO vo = new loginVO("test", "홍선생", 20, "A");
		vo.PrintInfo();
	}
}