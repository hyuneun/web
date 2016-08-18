<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String irum = request.getParameter("name");
	String nai = request.getParameter("age");

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
		pstmt = conn.prepareStatement(
				"select gogek_name,gogek_tel,case when gogek_jumin like '%-1%' then '남' when gogek_jumin like '%-2%' then '여'end gen from sawon left join gogek on sawon_no=gogek_damsano where gogek_damsano='" + irum + "' order by sawon_no");
		rs = pstmt.executeQuery();
		result = "<table border=1><tr><td>고객명</td><td>고객전화</td><td>성별</td></tr>";
		while (rs.next()) {
			if(rs.getString("gen").equals("남")){
			result += "<tr style='color: blue;'>";	
			}else if(rs.getString("gen").equals("여")){
			result += "<tr style='color: yellow;'>";
			}
			result += "<td>" + rs.getString("gogek_name") + "</td>";
			result += "<td>" + rs.getString("gogek_tel") + "</td>";
			result += "<td>" + rs.getString("gen") + "</td>";
			result += "</tr>";
		}
		result += "</table>";
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e2) {
		System.out.println(e2);
		return;

	}
	out.println(result);//jsp내장함수(클라이언트의 브라우저에 출력)
%>
