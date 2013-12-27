<%@ include file="header.jsp" %>
<%@ include file="process/connect.jsp" %>
<%
	//String role = (String)session.getAttribute("user_online");
	if(role.equals("Admin") == false){
		response.sendRedirect("index.jsp");
	}
%>
	<div class="content">
		<%@ include file="process/show_data.jsp" %>
		<div class="tCenter tLarge">
			User List
			<br />
			<form method="post" action="userlist.jsp">
				<input type="text" name="txtSearch" placeholder="Search Username" />
				<input type="submit" value="Search" />
			</form>
		</div>
		<%
			String query = "select * from MsUser where Role not like 'Admin'";

			String search = "";
			if(request.getParameter("txtSearch") != null){
				search = request.getParameter("txtSearch");
				query += "and username like '%"+ search +"%'";
			}

			ResultSet rs = st.executeQuery(query);
		%>
		<br />
		<table align="center" border="1">
			<tr>
				<th>Username</th>
				<th>Address</th>
				<th>Telephone</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%= rs.getString("UserName") %></td>
					<td><%= rs.getString("Address") %></td>
					<td><%= rs.getString("Telephone") %></td>
					<td><%= rs.getString("Email") %></td>
					<td><a href="process/do_deleteuser.jsp?id=<%= rs.getString("UserId") %>">X</a></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
<%@ include file="footer.jsp" %>