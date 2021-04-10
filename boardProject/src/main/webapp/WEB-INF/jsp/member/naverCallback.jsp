<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
</head>
<body>
 <%
    String clientId = "9iK41XPuMNKiA_HdjHl_";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "cxCgrSQ9u6";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8808/member/naverCallback.do", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
        JSONParser parsing = new JSONParser();
        Object obj = parsing.parse(res.toString());
        JSONObject jsonObj = (JSONObject)obj;
    	access_token =(String) jsonObj.get("access_token");
    	refresh_token =(String) jsonObj.get("refresh_token");
    
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
</body>
<script>

$(document).ready(function() {
	fn_movePage('naverCallbackAfter.do','Y')"
});
</script>
<form id="frm" name="frm" >
<input type="hidden"  id="access_token" name="access_token" value="<%=access_token%>">
<input type="hidden" id="refresh_token" name="refresh_token" value="<%=refresh_token%>">

</form>
</html>