<%@ page import="java.sql.*" %>
<%@ page import="com.Db.DbConnect" %>
<%@ page import="com.User.UserDetails" %>
<%@ page language="java"  contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>ENotes</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
	<%@ include file="all_component/navbar.jsp" %>
	<%
		Connection conn=DbConnect.getConn();
	%>
	<div class="container-fluid back-img">
	<div class="text-center heading" > 
	<h1 class="text-white"><i class="fa fa-handshake-o" aria-hidden="true"></i><span></span>ENotes-Save your Notes</h1>
	<a href="./login.jsp" class="btn btn-light"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
	<a href="./regester.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i>Regester</a>
	</div>
	</div>
	<%@ include file="all_component/footer.jsp" %>
</body> 
</html>
