<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.User.VideoPost"%>
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
<style>
	.btn-danger
	{
		padding:0px;
		margin-left:10%;
	}
</style>
<title>ShowNotes</title>
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
	<%
	List<VideoPost> l = (List<VideoPost>)session.getAttribute("notes");
	if (l == null) {
		session.setAttribute("login_error", "Please login first");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container">
	<div class="row justify-content-between">
	<%
	for (VideoPost p : l) {
	%>
		<div class="card col-3 card-custom m-2" style="width: 18rem;">
			<div class="card-body">
				<h5 class="card-title"><%=p.getTitle()%></h5>
				<p class="card-text"><%=p.getNote()%></p>
				<div>
				<a href="./videoNote.jsp?link=<%="=" + p.getVideoId()%>&&project=<%=p.getProjectName() %>"
					class="btn btn-primary">goto video</a>
				<a href="DeleteNote?videoId=<%=p.getVideoId()%>&&uid=<%=p.getNid() %>" class="btn btn-danger"><i class="fa fa-trash cust"></i></a>
				</div>
			</div>
		</div>
	<%
	}
	%>
	</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>