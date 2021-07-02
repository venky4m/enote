<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_component/allcss.jsp"%>
<style>
{
}
</style>
<title>Notes</title>
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
	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col">

				<div id="player">
					<%!String videoid = "";
					String project="";
					%>
					<%
					String str = request.getParameter("link");
					project=request.getParameter("project");
					 String pattern = "(?<=youtu.be/|watch\\?v=|/videos/|embed\\/)[^#\\&\\?]*";
					    Pattern compiledPattern = Pattern.compile(pattern);
					    Matcher matcher = compiledPattern.matcher(str);
					    if(matcher.find()){
					        videoid = matcher.group();
					    }
					%>
					
				</div>
				<h1><%=project %></h1>
			</div>
			<div class="col">

				<form action="./AddVideoNote" method="post">

					<div class="mb-3">

						<label for="exampleInputEmail1" class="form-label">Title</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="title">
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Notes</label>
							<div class="form-floating">
								<textarea class="form-control" rows="10" cols="25"
									placeholder="Write your notes here" id="floatingTextarea"
									name="note"></textarea>
							</div>
								<input
								id="videoid" type="hidden" name="project" value="<%= project%>">
								<input
								id="videoid" type="hidden" name="videoid" value="<%= videoid%>">
						</div>
						<button type="submit" id="send" class="btn btn-primary">Submit</button>
					</div>
					<%
					String succ = (String) session.getAttribute("note-sucess");
					if (succ != null) {
					%>
					<div class="alert alert-success" role="alert"><%=succ%></div>


					<%
					session.removeAttribute("note-sucess");
					}
					%>
					<%
					String failer = (String) session.getAttribute("note-fail");
					if (failer != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failer%></div>


					<%
					session.removeAttribute("note-fail");
					}
					%>
				</form>


			</div>

		</div>

		<!--<div class="center col-6 offset-6 float">!-->
	

	</div>









	<script type="text/javascript">
		const send = document.querySelector("#send");
		const time = document.querySelector("#time");
		const videoid = document.querySelector("#videoid");
		send.addEventListener("click", () => {
			  time.value = player.getCurrentTime();
			  videoid.value=videoId;
			});
		</script>
	<script>
				// 2. This code loads the IFrame Player API code asynchronously.
				var tag = document.createElement('script');

				tag.src = "https://www.youtube.com/iframe_api";
				var firstScriptTag = document.getElementsByTagName('script')[0];
				firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

				// 3. This function creates an <iframe> (and YouTube player)
				//    after the API code downloads.
				var player;
				var videoId ='<%=videoid%>';
				function onYouTubeIframeAPIReady() {
					player = new YT.Player('player', {
						height : '390',
						width : '640',
						videoId : videoId,
						playerVars : {
							'playsinline' : 1
						},
						events : {
							'onReady' : onPlayerReady,
							'onStateChange' : onPlayerStateChange
						}
					});
				}

				// 4. The API will call this function when the video player is ready.
				function onPlayerReady(event) {
					event.target.playVideo();
				}

				// 5. The API calls this function when the player's state changes.
				//    The function indicates that when playing a video (state=1),
				//    the player should play for six seconds and then stop.
				var done = false;
				function onPlayerStateChange(event) {
					if (event.data == YT.PlayerState.PLAYING && !done) {
						setTimeout(stopVideo, 6000);
						done = true;
					}
				}
				function stopVideo() {
					player.stopVideo();
				}
			</script>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>