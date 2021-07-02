<%@ page import="com.User.UserDetails"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_component/allcss.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/homepage.css">

<title>Home</title>
<style>
body {
	background-image: url("img/home.jpg");
	background-position: 50% 50%;
}

.MyContainer div div {
	margin: 15% auto;
	width: 80%;
}

.centered {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<%
	UserDetails us1 = (UserDetails) session.getAttribute("user");
	if (us1 == null) {
		session.setAttribute("login_error", "Please login first");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="MyContainer">
		<div>
			<div class="centered">
				<div class="container-fluid col-md-12 dic">
					<a href="AddLink.jsp" class="btn btn-light text-center btn-lg ">startHere</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>








