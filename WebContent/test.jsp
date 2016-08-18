<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<br>
<table border="1">
<tr><td>사번</td><td>이름</td><td>직급</td><td>입사년</td>
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
	int count = 0;
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	pstmt = conn.prepareStatement("select sawon_no,sawon_name,sawon_jik,TO_CHAR(sawon_ibsail, 'YYYY') ibsail from sawon");
	rs = pstmt.executeQuery();
	
	while(rs.next()){
	count++;
%>
	<tr style="color: yellow;">
	<td><%=rs.getString("sawon_no") %></td>
	<td><%=rs.getString("sawon_name") %></td>
	<td><%=rs.getString("sawon_jik") %></td>
	<td><%=rs.getString("ibsail") %></td>
	</tr>
	</<table>>
	
<%		
	}	%>
	인원수 : <%=count %>명
	<%
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e2){
	System.out.println(e2);
	return;
	
}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<SCRIPT type="text/javascript">

function c(id){
	if(id == "1"){
	
	}else if(id == "2"){
	
	}else if(id == "3"){
		
	}
}
</SCRIPT>
</head>
<body>
직원자료 보기
<br>

<input type="radio" name="check" id="c1" onclick="c('1');">전체</input>
<input type="radio" name="check" id="c2" onclick="c('2');">남</input>
<input type="radio" name="check" id="c3" onclick="c('3');">여</input>


</body>
</html>