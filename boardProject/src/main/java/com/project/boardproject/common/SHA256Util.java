package com.project.boardproject.common;

import java.security.MessageDigest;
import java.util.Random;

/***
 * @ClassName : SHA256Util.java
 * @Description :  SHA256 관련 유틸 클래스
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
* @ 2021.07.14   김채아      최초생성
*   
 * @author 김채아
 * @since 2021.08.18
 * @version 1.0
 * 
 */

public class SHA256Util {

	//솔트값을 생성한다.
	public static String getSalt() {
		Random random = new Random();
		byte[] salt = new byte[10];
		
		random.nextBytes(salt);
		
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<salt.length; i++) {
			sb.append(String.format("%02x", salt[i]));
		}
		return sb.toString();
	}
	
	public static String getEncrypt(String pwd, String salt) {
		return getEncrypt(pwd, salt.getBytes());
	}
	
	//암호화한다.
	public static String getEncrypt(String pwd, byte[] salt) {
		String result = "";

		byte[] pwdBytes = pwd.getBytes();
		// String.getBytes()
		// 문자열로 들어온 파라미터를 byte[]배열 기반의 데이터로 전환해주는 메서드
		// String src = "채카롱";  src.getBytes();
		// "채카롱" -> 인코딩하여 byte[] 배열로 구성
		
		byte[] allBytes = new byte[salt.length + pwdBytes.length];
	      
		
		/*System.Arraycopy(src, srcPos, dest, destPos, length);
		  - byte[] 형태의 데이터를 자르거나 연접하기 위해 사용되는 메서드
		 - Obejct src : 원본데이터
		 - int srcPos : 원본 데이터의 시작 위치를 지정(어느 시점부터 시작할지 지정한다)
		 - Object dest : 복사하려는 대상 지정
		 - int destos : 위의 복사본(src)를 받을 때 어느 시점부터 시작할지 정해준다.
		 - int length : 원본에서 복사본으로 데이터를 읽어서 쓸 데이터의 길이 지정
		 
		 * */
		System.arraycopy(pwdBytes, 0, allBytes, 0, pwdBytes.length);
	    System.arraycopy(salt, 0, allBytes, pwdBytes.length, salt.length);
	     
	      try {
	    	 MessageDigest md = MessageDigest.getInstance("SHA-256");
	    	 md.update(allBytes);	// 지정된 바이트 데이터를 사용하여 다이제스트를 갱신.
	    	 
	    	 byte[] b = md.digest();		//바이트 배열로 해쉬를 변환하여 반환
	    	 
	    	 StringBuffer sb = new StringBuffer();	// byte -> HexString 변환
	    	 
	    	 for(int i=0; i<b.length; i++) {
	    		 sb.append(Integer.toString((b[i] & 0xFF) + 256, 16).substring(1));
	    	 }
	    	 result = sb.toString();
	      }catch(Exception e) {
	    	 e.getMessage();
	      }
	      
	      return result;
	      
	}
} 
