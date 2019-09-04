<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
입력된 데이터<br>
<%
Connection conn=null;

Boolean connect = false;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
	conn = ds.getConnection();
   
  
	String sql = "SELECT * FROM test";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    	out.println(rs.getString("name")+"<br>");
    }
    connect = true;
    conn.close();
}catch(Exception e){
    connect = false;
    e.printStackTrace();
}

%>
</body>
</html>