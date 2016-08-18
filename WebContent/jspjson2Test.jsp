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
 		pstmt = conn.prepareStatement("select * from sawon left join buser on buser_num=buser_no order by sawon_no");
 		rs = pstmt.executeQuery();

 		while (rs.next()) {
 			result += "{";
 			result += "\"sano\":" + "\"" + rs.getString("sawon_no") + "\",";
 			result += "\"sana\":" + "\"" + rs.getString("sawon_name") + "\",";
 			result += "\"saji\":" + "\"" + rs.getString("sawon_jik") + "\",";
 			result += "\"sage\":" + "\"" + rs.getString("sawon_gen") + "\",";
 			result += "\"buna\":" + "\"" + rs.getString("buser_name") + "\",";
 			result += "\"bute\":" + "\"" + rs.getString("buser_tel") + "\"";
 			
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