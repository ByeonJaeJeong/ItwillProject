package test;

public class Cal {

	
public void sum(String stuNo,String name,int k,int e,int m){
		System.out.println(k+"+"+e+"+"+m+"="+(k+e+m));
	}

public void sum(StuJavaBean sjb){
	System.out.println(sjb.getKor()+"+"+sjb.getEng()+"+"+sjb.getMat()
	+"="+(sjb.getKor()+sjb.getEng()+sjb.getMat()));
}
public double avg(String stuNo,String name,int k,int e,int m){
	return (double)(k+e+m)/3;
	
}
public double avg(StuJavaBean sjb){
	return (double)(sjb.getKor()+sjb.getEng()+sjb.getMat())/3;
}
}
