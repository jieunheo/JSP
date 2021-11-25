package ezen;

import java.util.ArrayList;

public class DBTest
{
	public static void main(String[] args)
	{
		MemoVO vo = new MemoVO();
		MemoDTO dto = new MemoDTO();
		
		if (dto.DBOpen() == true)
		{
			//0-insert, 1-select
			//2-delete, 3-update
			//4-select list, 5-arraylist
			int mode = 5;
			
			switch (mode)
			{
				case 0: //insert
					for (int i=1; i<=100; i++)
					{
						vo.setTitle(i + "번째 글");
						dto.Insert(vo);
					}
					break;
				case 1: //select
					vo = dto.Select(303);
					if (vo != null) vo.PrintInfo();
					break;
				case 2: //delete
					dto.Delete(301);
					break;
				case 3: //update
					vo = dto.Select(302);
					vo.PrintInfo();
					vo.setTitle("302 글");
					vo.setNote("302 내용");
					dto.Update(vo);
					break;
				case 4: //select list
					MemoVO[] volist = dto.SelectList();
					for(MemoVO item : volist)
					{
						if( item != null) item.PrintInfo();
						System.out.println("============================");
					}
					break;
				case 5: //select arraylist
					ArrayList<MemoVO> list;
					list = dto.SelectArray();
					for(MemoVO temp : list)
					{
						temp.PrintInfo();
						System.out.println("============================");
					}
					break;
			}
			dto.DBClose();
		}
	}
}