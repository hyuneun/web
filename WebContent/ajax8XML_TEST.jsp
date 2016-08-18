<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<sawons>
<%
request.setCharacterEncoding("utf-8");
String buser = request.getParameter("buser");
//System.out.println(buser);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	String sql = "select distinct gogek_name,gogek_tel,sawon_name,buser_tel,case when gogek_jumin like '%-1%' then '남'when gogek_jumin like '%-2%' then '여'end gen from sawon inner join gogek on sawon_no=gogek_damsano inner join buser on sawon.buser_num=buser.buser_no";
	pstmt = conn.prepareStatement(sql);
	 //where buser_name=?
	//pstmt.setString(1, buser);
	rs = pstmt.executeQuery();
	//String ss = "";
	
	while(rs.next()){
		
		
%>
		<sawon>
		<code><%=rs.getString(1) %></code>
		<sang><%=rs.getString(2) %></sang>
		<su><%=rs.getString(3) %></su>
		<dan><%=rs.getString(4) %></dan>
		<gen><%=rs.getString(5) %></gen>
		</sawon>
<%	
		/* ss += "(" + rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + rs.getString(4) + ")";
		ss += "<br>"; */
	}
	
	//out.print(ss);
	
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e2){
	System.out.println(e2);
	return;
	
}






%>	
</sawons>
