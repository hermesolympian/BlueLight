<link href="../style.css" rel="stylesheet">
<div class="tRight tMedium">
	Welcome, <%= session.getAttribute("user_name") %>
	<br />
	User Online : <%= application.getAttribute("user_online") %>
</div>
<div class="space">&nbsp;</div>