<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String email=request.getParameter("email");
String regno=request.getParameter("regno");
String password=request.getParameter("password");
%>
<%@ include file="config.jsp" %>
<% 
PreparedStatement ps;
String sql="INSERT INTO student(name,email,phone,regno,address,password)values(?,?,?,?,?,?)";
ps=conn.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, phone);
ps.setString(4, regno);
ps.setString(5, address);
ps.setString(6, password);
int i=ps.executeUpdate();
if(i>0)
{
	out.println("<script>alert('Data has been inserted');window.location='index.jsp';</script>");
}
else
{
	out.println("<script>alert('Data has not been inserted');window.location='index.jsp';</script>");
}
%>