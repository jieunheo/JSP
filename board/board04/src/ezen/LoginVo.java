package ezen;

public class LoginVo
{
	private String no;   //ȸ�� ��ȣ
	private String id;   //ȸ�� ���̵�
	private String name; //ȸ�� ����
	
	/* ������ */
	public LoginVo(String no, String id, String name)
	{
		setNo(no);
		setId(id);
		setName(name);
	}
	
	/* getter */
	public String getNo()   { return no;	}
	public String getId()   { return id;	}
	public String getName() { return name;	}
	
	/* setter */
	public void setNo(String no)     { this.no = no;	 }
	public void setId(String id)     { this.id = id;	 }
	public void setName(String name) { this.name = name; }
	
	
	public static void main(String[] args)
	{
		
	}
}