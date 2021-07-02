<%@ page import="com.User.UserDetails" %>
<div class="header">
	<nav class="venky navbar navbar-expand-lg navbar-dark navbar-custom ">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa fa-handshake-o" aria-hidden="true"></i>ENotes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home
						<span class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a href="AddLink.jsp" class="nav-link" href="#"><i
						class="fa fa-pencil-square" aria-hidden="true"></i>AddNotes <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a href="ShowNotes" class="nav-link" href="#"><i
						class="fa fa-book" aria-hidden="true"></i>ShowNotes <span
						class="sr-only">(current)</span></a></li></ul>
				<%
      				UserDetails usd=(UserDetails)session.getAttribute("user");
      				if(usd!=null)
      				{
      					String name=usd.getName();
      			%>
			<a href="#" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-user"></i><%=name %></a>
			<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa fa-sign-out" aria-hidden="true"></i>logout</a>


			<%
      } 
      else
      { %>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
			<a href="regester.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
			<%
			session.removeAttribute("user");
			} %>
		</div>
	</nav>
</div>