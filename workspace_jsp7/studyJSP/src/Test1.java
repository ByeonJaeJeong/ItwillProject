class Parent{
	
	public void pprn(){
		System.out.println("pprn() 메서드 호출");
	}
	
}
class Child extends Parent{
	public void cprn(){
		System.out.println("cprn() 메서드 호출");
	}
	
}
public class Test1 {

	public static void main(String[] args) {

		Parent p= new Parent();
		p.pprn();
		//p.cprn(); 서브클래스의 메서드이기 때문에 안됨 
		Child c= new Child();
		c.pprn();
		c.cprn();
		System.out.println("--------------------");
		//업 캐스팅: 부모타입으로 형변환 하는것
		//슈퍼클래스의 레퍼런스에 서브클래스의 인스턴트를 저장 
		//다운 캐스팅: 자식 타입으로 형변환 하는것
		//서브클래스의 레퍼런스에 슈퍼클래스의 인스턴스를 저장 
		Parent p1 =new Child(); //업 캐스팅
		p1=c; // 업 캐스팅
		p1=new Child(); //업캐스팅
		p1.pprn();
		Child c2=(Child)p1;
		c2.cprn();
		c2.pprn();
		//상속을 하기위한 조건 
		
		//오버로딩과 오버라이딩의 차이는 상속 
		//오버로딩은(print)가 대표  객체로 오버라이딩은 상속으로 
		//자식은 부모보다 접근제어자를 큰걸 사용할수 없다 !!
		//
		
		
		
		
		
		
		
		
	}

}
