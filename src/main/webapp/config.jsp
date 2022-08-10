<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String url="jdbc:mysql://localhost:3306/course";
String usera="root";
String pass="password";
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(url,usera,pass);

%>