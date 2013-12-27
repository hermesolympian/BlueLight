<%@ include file="header.jsp" %>			
<div class="content">
	<%@ include file="process/do_checkcookies.jsp" %>
	<%
		if(count_cookie == 1 && session.getAttribute("cekCookie") == null){
			response.sendRedirect("process/do_signin.jsp");
		}
		if(session.getAttribute("user_name") == null){
	%>
		<form method="post" action="process/do_signin.jsp">
			<table align="center">
				<tr>
					<td>Username</td>
					<td>:</td>
					<td><input type="text" name="txtName" placeholder="Username" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td>:</td>
					<td><input type="password" name="txtPassword" placeholder="Password" /></td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input type="checkbox" name="rememberMe" /> Remember Me ?
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<label id="txtErr" name="txtErr" class="error">
							<%
								String err = request.getParameter("err");
								if(err != null){
									out.print(err);
								}
								else{
									out.print("");
								}
							%>
						</label>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2">
						<input type="submit" value="Sign In" />
					</td>
				</tr>
			</table>
		</form>
	<%
		} else {
		String username = (String)session.getAttribute("user_name");
		Integer user_online = (Integer)application.getAttribute("user_online");
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
	%>
		<%@ include file="process/show_data.jsp" %>
		<div class="tCenter">
			<span class="tLarge">
				Welcome to Bluelight <br/><br/>
			</span>
			<span class="tMedium">
				Sign In Time <br />
				<%= sdf.format(time) %> <br/>
			</span>
			<span>
				<a id="btnSignout" href="process/do_signout.jsp">
					Sign Out
				</a>
			</span>
		</div>
	<%
		}
	%>
</div>
<%@ include file="footer.jsp" %>
			