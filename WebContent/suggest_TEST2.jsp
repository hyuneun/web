<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
//System.out.print(keyword);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	String sql = "select gogek_no,gogek_name,gogek_jumin,gogek_tel from gogek inner join sawon on sawon_no=gogek_damsano where sawon_name=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, keyword);
	rs = pstmt.executeQuery();
	
	ArrayList<String> list = new ArrayList<String>();
	while(rs.next()){
		//System.out.print(rs.getString(1));
		list.add(rs.getString(1));
		list.add(rs.getString(2));	
		list.add(rs.getString(3));	
		list.add(rs.getString(4));	
	}
	
	//out.print(list.size());
	//out.print("|");
	for(int i = 0; i < list.size(); i++){
		String data = list.get(i);
		out.print(data);
		if(i < list.size() - 1){
			out.print(",");
		}
	}
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e2){
	System.out.println(e2);
	return;
	
}
%>
    