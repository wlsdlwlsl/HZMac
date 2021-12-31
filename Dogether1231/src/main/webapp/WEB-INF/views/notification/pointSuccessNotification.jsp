<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import='java.net.*, java.io.*'%>

<%
	// FCM 서버에서 보낸 토큰값 :   FirebaseInstanceId.getInstance().getToken()
	// 콘솔에 출력하고는 그 값을 복사해서 사용해야 한다
	// 실제적으로는 이 값을 DB에 넣고 jsp에서는 DB에서 가지고 와서 사용
	//userDeviceIdKey is the device id you will query from your database
	//.......
	String userDeviceIdKey = "dSSz1QxmQXCioFsTem7Vt6:APA91bE4hpCKTTvYybBNijUj5nxztTXGC9-d5j42weXd6hLJxn0kD9B5txXRidGKQ2jRC9ZWCgpdBQHnBakvc2nD6A-Xp1eWYmTzcnObYQMcyAOa7V9hodZ7DtKJfWB0x28MEz-FmpbQ";
	//Method to send Notifications from server to client end.
	// firebase.google.com 사이트에서 해당 프로젝트 > 설정 > 클라우드 메세지 > 서버 키 토큰 복사
	//프로젝트키값
	String AUTH_KEY_FCM = "AAAAWaG2pec:APA91bFZ_Bqk9oq0zz3UrdYACepGQKGaIIRdZB_oI0DTI4RwvE1IVZmBKkqImRZvC2xlU-5y7Lobu1McOL9rCa_C4HDvRuC-o-CcySpyZvY5NbYFRpst1JkyRxqjxuOx_2MmTbCTBHZm";
	String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	
	URL url = new URL(API_URL_FCM);
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	
	conn.setUseCaches(false);
	conn.setDoInput(true);
	conn.setDoOutput(true);
	
	conn.setRequestMethod("POST");
	conn.setRequestProperty("Authorization", "key=" + AUTH_KEY_FCM);
	conn.setRequestProperty("Content-Type", "application/json");
	
	JsonObject json = new JsonObject();
	System.out.println(userDeviceIdKey.trim());
	json.addProperty("to", userDeviceIdKey.trim());
	JsonObject info = new JsonObject();
	//info.put("title", "my message");   // Notification title
	//info.put("body", "test"); // Notification body
	info.addProperty("title", "Dogether"); // Notification title
	info.addProperty("body", "ㅎㅇㅎㅇ"); // Notification body
	json.add("notification", info);
	
	OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
	System.out.println(">" + json.toString());
	wr.write(json.toString());
	wr.flush();
	conn.getInputStream();
%>

