<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>
{"sangpums":
[
 <%
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	String result = "";

 	try {
 		Class.forName("oracle.jdbc.driver.OracleDriver");
 	} catch (Exception e) {
 		System.out.println(e);
 		return;

 	}

 	try {

 		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
 		pstmt = conn.prepareStatement("select distinct gogek_name,gogek_tel,sawon_name,buser_tel,case when gogek_jumin like '%-1%' then '남'when gogek_jumin like '%-2%' then '여'end gen from sawon inner join gogek on sawon_no=gogek_damsano inner join buser on sawon.buser_num=buser.buser_no");
 		rs = pstmt.executeQuery();

 		while (rs.next()) {
 			result += "{";

 			result += "\"code\":" + "\"" + rs.getString(1) + "\",";
 			result += "\"sang\":" + "\"" + rs.getString(2) + "\",";
 			result += "\"su\":" + "\"" + rs.getString(3) + "\",";
 			result += "\"dan\":" + "\"" + rs.getString(4) + "\",";
 			result += "\"gen\":" + "\"" + rs.getString(5) + "\"";
 			result += "},";
 	}
 		if(result.length() > 0){
 			result = result.substring(0,result.length() - 1);
 		}
 		result += "]}";
 		out.println(result);
 		
 		rs.close();
 		pstmt.close();
 		conn.close();
 	} catch (Exception e2) {
 		System.out.println(e2);
 		return;

 	}
 %>