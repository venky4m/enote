<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="all_component/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Getting Started</title>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
	<div class="row justify-content-center mt-4">
	<div class="col-6">
		<form action="./videoNote.jsp">
			<div class="mb-3">
			
					<input name="project" type="text" class="form-control mb-3"
					id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ProjectName">
					<input name="link" type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Paste your link">
					
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
	
</body>
</html>
