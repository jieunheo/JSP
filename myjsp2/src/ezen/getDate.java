package ezen;

import java.text.SimpleDateFormat;

public class getDate {
	public String getToday() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd");
		String now = date.format(System.currentTimeMillis());
		
		return now;
	}
}
