package study2.mapping;

public class Test5_5Service{

	
	public String guguDan(int dan) {
		String str = "* "+dan+"단*<br/>";
		
		for(int i=1; i<=9; i++) {
			str += dan + " * " + i + " = " + (dan * i) + "<br/>";
		}
		
		return str; //request 서블릿객체가 없기 때문에 저장소에 담아서 못 보냄. 직렬화이기떄문에 바로 넘겨도도미 
	}
}
