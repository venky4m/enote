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
							<i class="fa fa-sign-in" aria-hidden="true"></i>Login
						</h4>
					</div>
					<%
						String msg = (String) session.getAttribute("invalid");
						if (msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=msg%></div>
					<%
						session.removeAttribute("invalid");
						}
					%>
					<%
						String loginer = (String) session.getAttribute("login_error");
						if (loginer != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=loginer%></div>
					<%
						session.removeAttribute("login_error");
						}
					%>
					<%
						String logout = (String) session.getAttribute("logout_success");
						if (logout != null) {
					%>
					<div class="alert alert-success" role="alert"><%=logout%></div>
					<%
						session.removeAttribute("logout_success");
						}
					%>
					<div class="card-body">
						<form action="./LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="upassword">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>

					</div>


				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>