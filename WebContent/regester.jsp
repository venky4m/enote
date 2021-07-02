<!DOCTYPE html>
<html>
<head>
<title>Regester</title>
<%@ include file="all_component/allcss.jsp"%>
<link rel="stylesheet" href="css/regester.css">
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid custom-reg">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">

					<div class="card-header">
						<h4 class="text-center">
							<i class="fa fa-user-plus" aria-hidden="true"></i>Regestration
						</h4>
					</div>
					<%
							String msg=(String)session.getAttribute("reg-success");
							
							if(msg != null)
							{
						%>
					<div class="alert alert-success" role="alert"><%=msg %><a href="login.jsp">Click here</a>
					</div>
					<%
						session.removeAttribute("reg-success");
						}%>
					<%
							String failmsg=(String)session.getAttribute("failed-msg");
							if(failmsg!=null)
							{
						%>
					<div class="alert alert-danger" role="alert"><%=failmsg %></div>
					<%
					session.removeAttribute("failed-msg");
							} %>
					<div class="card-body">
						<form action="UserServlet" method="Post">
							<div class="form-group">
								<label for="exampleInputFullName">Full Name</label> <input
									type="text" class="form-control" required="true" id="exampleInputFullName1"
									aria-describedby="emailHelp" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"  required="true" name="uemail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control"  required="true" id="exampleInputPassword1"
									name="upassword">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Regester</button>
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>