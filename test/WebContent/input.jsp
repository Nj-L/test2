<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% 
 // index.jsp 에서 넘어오는 데이터 처리
 
 String name = request.getParameter("name");
 
 Connection conn=null;
 
 Boolean connect = false;

 try{
 	Context init = new InitialContext();
 	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
 	conn = ds.getConnection();
    
   
 	String sql = "INSERT INTO test (name) VALUES (?)";
     PreparedStatement pstmt = conn.prepareStatement(sql);
     pstmt.setString(1, name);
     pstmt.executeUpdate();
     connect = true;
     
     conn.close();
 }catch(Exception e){
     connect = false;
     e.printStackTrace();
 }

 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
입력한 내용 : <%=name %>
<br>
<a href = "view.jsp"> <h1>입력된 데이터를 보기</h1> </a> 
</body>
</html>