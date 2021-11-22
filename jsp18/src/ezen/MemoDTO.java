package ezen;

import java.util.ArrayList;

/* DTO: Data Transfer Object */
/* DAO: Data Access Object */
public class MemoDTO extends DBManager
{
	/* '을 ''으로 */
//	private String _R(String value)
//	{
//		return value.replace("'", "''");
//	}
	
	/* insert */
	public boolean Insert(MemoVO vo)
	{
		String sql = "";
		sql += "insert into memo ";
		sql += "(title, note) ";
		sql += "values ";
		sql += "('" + _R(vo.getTitle()) + "','" + _R(vo.getNote()) + "');";
		
		//insert
		return RunSQL(sql);
	}
	
	/* Select */
	public MemoVO Select(int no)
	{
		String sql = "";
		sql += "select * ";
		sql += "from memo ";
		sql += "where no = " + no + ";";
		
		//select
		if (OpenQuery(sql) == false) return null;
		if (GetNext() == false) 	 return null;
		MemoVO vo = new MemoVO(GetValue("title"), GetValue("note"));
		
		CloseQuery();
		return vo;
	}

	/* Select*/
	public MemoVO[] SelectList()
	{
		//sql
		String sql = "";
		sql = "select count(*) as count from memo;";
		
		if (OpenQuery(sql) == false) return null;
		if (GetNext() == false) 	 return null;

		MemoVO[] list = null;
		int count = GetInteger("count");
		CloseQuery();

		if (count <= 0) return null;
		list = new MemoVO[count];
		
		int i = 0;
		sql = "select * ";
		sql += "from memo ";
		sql += "order by no;";
		
		if (OpenQuery(sql) == false) return null;
		while(GetNext())
		{
			MemoVO vo = new MemoVO(GetValue("title"), GetValue("note"));
			list[i] = vo;
			i++;
		}
		
		CloseQuery();
		return list;
	}

	/* ㄴelect - Arraylist */
	public ArrayList<MemoVO> SelectArray()
	{
		String sql = "";
		sql = "select count(*) as count from memo;";

		ArrayList<MemoVO> array = null;
		array = new ArrayList<MemoVO>();
		
		sql = "select * from memo order by no;";
		if (OpenQuery(sql) == false) return null;
		while(GetNext())
		{
			MemoVO vo = new MemoVO(GetValue("title"),GetValue("note"));
			array.add(vo);
		}
		
		CloseQuery();
		return array;
	}
	
	/* delete */
	public boolean Delete(int no)
	{
		String sql = "";
		sql += "delete from memo ";
		sql += "where no = " + no + ";";

		//delete
		return RunSQL(sql);
	}
	
	/* update */
	public boolean Update(MemoVO vo)
	{
		String sql = "";
		sql += "update memo ";
		sql += "set title = '" + _R(vo.getTitle()) + "', ";
		sql += "note = '" + _R(vo.getNote()) + "' ";
		sql += "where no = " + vo.getNo() + ";";

		return RunSQL(sql);
	}
}