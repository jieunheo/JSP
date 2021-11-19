package ezen;

/* VO: Value Object */
public class MemoVO
{
	private int    no;    //번호
	private String title; //제목
	private String note;  //내용
	
	/* 생성자 */
	public MemoVO() {}
	public MemoVO(String title, String note) {
		this.title = title;
		this.note = note;
	}
	
	/* getter */
	public int    getNo()    { return no;    }
	public String getTitle() { return title; }
	public String getNote()  { return note;  }
	
	/* setter */
	public void setNo(int no)		   { this.no = no;		 }
	public void setTitle(String title) { this.title = title; }
	public void setNote(String note)   { this.note = note;	 }
	
	/* print Info */
	public void PrintInfo()
	{
		System.out.println("��ȣ: " + no);
		System.out.println("����: " + title);
		System.out.println("����: " + note);
	}
}