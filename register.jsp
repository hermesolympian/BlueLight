<%@ include file="header.jsp" %>
<%
	if(session.getAttribute("user_role") != null){
		response.sendRedirect("index.jsp");
	}
%>
<div class="content">
	<div class="tCenter tLarge">
		Register
	</div>
	<div class="space"></div>
	<div class="tCenter tMedium">
		Register Form
	</div>
	<div class="space"></div>
	<div class="tCenter">
		<form method="post" action="process/do_register.jsp">
			<table cellspacing="5" align="center" width="400px" border="1" bgcolor="#BFBFBF">
			<tr>
		    	<td>Username</td>
		        <td><input type="text" name="usertxt" id="usertxt"/></td>
		    </tr>
			<tr>
		    	<td>Password</td>
		        <td><input type="password" name="passtxt" id="passtxt"/></td>
		    </tr>
			<tr>
		    	<td>Confirm Password</td>
		        <td><input type="password" name="cpasstxt" id="cpasstxt"/></td>
		    </tr>
			<tr>
		    	<td>Address</td>
		        <td><textarea rows='5' cols='30' name="addresstxt" id="addresstxt"></textarea></td>
		    </tr>
			<tr>
		    	<td>Telephone</td>
		        <td><input type="text" name="tlptxt" id="tlptxt"/></td>
		    </tr>
			<tr>
		    	<td>Email</td>
		        <td><input type="text" name="emailtxt" id="emailtxt"/></td>
		    </tr>
			</table>
			<div class="error tSmall">
				<%
					String err = request.getParameter("err");
					if(err == null){
						out.print("");
					}
					else{
						out.print(err);
					}
				%>
			</div>
			<input type="submit" value="Register" />
		</form>
	</div>
</div>
<%@ include file="footer.jsp" %>