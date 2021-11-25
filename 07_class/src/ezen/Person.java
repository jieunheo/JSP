package ezen;

public class Person
{
	public String getName() {
		return "ȫ�浿";
	}
	
	public static void main(String[] args)
	{
		Person p = new Person();
		String name = p.getName();
		System.out.println(name);
	}
}