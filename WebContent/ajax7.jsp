<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String irum = request.getParameter("name");
String nai = request.getParameter("age");
System.out.println(irum + nai);

out.println(irum + "님의 나이는" + nai);//jsp내장함수(클라이언트의 브라우저에 출력)

%>
