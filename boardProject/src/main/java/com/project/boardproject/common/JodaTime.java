package com.project.boardproject.common;

import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.chrono.GregorianChronology;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;


public class JodaTime {


		public static void main(String[] args) {
			String usrPwRgtDtm = "20200101";
			DateTime dateTime = new DateTime(usrPwRgtDtm);
			DateTime compareTime = new DateTime().plusMonths(3);
			if(dateTime.compareTo(compareTime) >0) {
				System.out.println("여기");
			}else {
				System.out.println("22");
			}
		}
	public void shouldGetAfterOneDay() {
		Chronology chrono =GregorianChronology.getInstance();
		LocalDate theDay = new LocalDate(1582,10,4,chrono);
		String pattern = "yyyy.MM.dd";

		DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm:ss");
		DateTime dt = formatter.parseDateTime("15/07/2021 13:54:00");
		System.out.println(formatter);
		System.out.println(dt);
		
		DateTimeFormat.forPattern("dd/MM/yyyy HH:mm:ss").parseDateTime("04/02/2011 20:27:05");
		
	
		/*
		 * JUnit assert 주요 메서드
		 	- assertArrayEquals(a,b) 배열 A와 B가 일치함을 확인
		 	- assertEquals(a,b);  객체 A와 B가 일치함을 확인
		 	- assertSame(a,b);   객체A와 B가 같은 객체임을 확인한다.
		 	ㅇ 차이점 assertEquals메소드는 두객체의 값이 같은가를 검사하지만
		 	                assertSame 메소드는 두객체가 동일한가 하나의 객체인가를 확인 (== 연산자)
		 	- assertTrue(a);   조건 A가 참인가를 확인한다.
		 	- assertNotNull(a);  객체 A가 null이 아님을 확인한다.               
	
		 * */
		
	}
	
	
}
