<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<sangpums>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}catch(Exception e){
	System.out.println(e);
	return;
	
}

try{
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	pstmt = conn.prepareStatement("select sawon_no,sawon_name,buser_name,sawon_jik,TO_CHAR(sawon_ibsail, 'YYYY') ibsail,sawon_gen from sawon inner join buser on buser_num=buser_no");
	rs = pstmt.executeQuery();
	
	while(rs.next()){
%>
	<sangpum>
	<code><%=rs.getString(1) %></code>
	<sang><%=rs.getString(2) %></sang>
	<su><%=rs.getString(3) %></su>
	<dan><%=rs.getString(4) %></dan>
	<gen><%=rs.getString(5) %></gen>
	</sangpum>
<%		
	}
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e2){
	System.out.println(e2);
	return;
	
}






%>	
</sangpums>