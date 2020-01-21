import java.util.ArrayList;
import java.util.List;

public class ArrayListTest {
	public static void main(String[] args) {
		//동일한 타입의 데이터를 한번에 여러개 저장할수 있는것? (고정길이)배열
		
		
		//=>가변길이 배열 ArrayList
		//	*컬렉션:자료구조(데이터를 효율적으로 꺼내고 쓰는 학문)자바에서 사용할수 있도록
		//	생성한 클레스/인터페이스(JDK5이후 도입된 개념 )2004년이후~
		// 	*필요에 따라서 배열의 크기가 자동으로 증가
		// 	*서로 다른타입의 정보를 한번에 저장 가능
		//	List 계열: 순서가 존재하는집합,중복을 허용 
		
		//(ArrayList,Vector,Stack,LinkedList)
		
		List arr=new ArrayList();
		List arr2=new ArrayList();
		
		
		System.out.println("배열의 요소의 개수:"+arr.size());
		
		arr.add(1); //5버전 이하에는 참조형 변수로 적어주어야함 
		arr.add("2"); //5버전 이후부터 오토 박싱 기능이 추가되어 알아서 바꾸어줌
		arr.add(4.123);//double->Double->Object 업캐스팅
		arr.add("five");
		arr.add(true);//boolean ->Boolean->Object 업 캐스팅
		
		//기본형타입->참조형 변경 클래스 Wrapper 클래스(첫글자 대문자로) 총8개

		boolean b;
		Boolean B; Byte By; Short sh;Float F ; Double d;
		//int i;
		//Integer ii;// int와 char만 Integer Charater로 바꿈 나머지는 첫글자 대문자
		char c;
		Character ch;
		for(int i=0;i<arr.size();i++){
			System.out.println(arr.get(i));
		}
		
		
		
		
		
		
	}
}
