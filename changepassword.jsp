<%@ include file="header.jsp" %>
<div class="content">
	<%
		if(session.getAttribute("user_name") == null){
			response.sendRedirect("index.jsp");
		}
		else{
	%>
		<%@ include file="process/show_data.jsp" %>
		<%
			if(role.equals("Admin")){
		%>
				<div id="btnUserlist" class="tLeft tMedium">
					<a href="userlist.jsp">User List</a>
				</div>
		<%
			}
		%>
		<div class="tCenter tLarge">
			Updating Profile 
		</div>
		<br/><br/>
		<div>
			<form method="post" action="process/do_changepass.jsp">
				<table align="center">
					<tr>
						<th>Old Password</th>
						<td>:</td>
						<td><input type="password" name="txtOld" placeholder="Old Password" /></td>
					</tr>
					<tr>
						<th>New Password</th>
						<td>:</td>
						<td><input type="password" name="txtNew" placeholder="New Password" /></td>
					</tr>
					<tr>
						<th>Confirm New Password</th>
						<td>:</td>
						<td><input type="password" name="txtConf" placeholder="Confirm New Password" /></td>
					</tr>
					<tr>
						
						<td colspan="3" align="center">
							<%
								String err = request.getParameter("err");
								if(err == null){
									out.print("<span></span>");
								}
								else if(err.equals("Change Password Succeed")){
									out.print("<span class=success>" + err + "</span>");
								}
								else {
									out.print("<span class=error>" + err + "</span>");
								}
							%>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="submit" value="Change Password" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	<%
		}
	%>
</div>
<%@ include file="footer.jsp" %>