<%@ include file="header.jsp" %>

<div class="content">
	<%
		if(session.getAttribute("user_name") != null){
	%>
		<%@ include file="process/show_data.jsp" %>
	<%
		}
	%>
	<div class="tCenter tLarge">Testimonial Board</div>
	<div class="tCenter tMedium">
		<%
			String query = "select * from MsTestimonial";
			ResultSet rs = st.executeQuery(query);
			if(rs.next() == false){
				out.print("There is no Testimonial...");
			}
			else{
		%>
			<div class="space">&nbsp;</div>
			<table bgcolor="#BFBFBF" width="600px" id="tblTestimoni" align="center" cellspacing="5">
				<%
					rs.beforeFirst();
					while(rs.next()){
						String testi_id = rs.getString(1);
						String name = rs.getString(3);
						String testi = rs.getString(2);
						String testi_role;
						if(session.getAttribute("user_role") == null){
							testi_role = "Member";
						}
						else {
							testi_role = (String)session.getAttribute("user_role");
						}
				%>
					<tr>
						<td><span class="tSmall"><%= name %></span></td>
						<td><span class="tSmall"> : </span></td>
						<td><span class="tSmall"><%= testi %></span></td>
						<%
							if(name.equalsIgnoreCase((String)session.getAttribute("user_name")) && testi_role.equals("Member")){
						%>
							<td><a class="tSmall" href="updatetesti.jsp?id=<%= testi_id %>">Edit</a></td>
						<%
							}
						%>
						<%
							if(name.equalsIgnoreCase((String)session.getAttribute("user_name")) || testi_role.equals("Admin")){
						%>
							<td><a class="tSmall" href="process/do_deletetesti.jsp?id=<%= testi_id %>">X</a></td>
						<%
							}
						%>
					</tr>
				<%
					}

					if(session.getAttribute("user_name") != null){
				%>
					<form method="post" action="process/do_addtesti.jsp">
						<tr>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td class="tSmall" colspan="5" align="center">
								Testimonial Editor
							</td>
						</tr>
						<tr>
							<td colspan="5" align="center">
								<textarea rows="5" cols="50" id="txtTestimoni" name="txtTestimoni"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tSmall error" colspan="5" align="center">
								<%
									String err = request.getParameter("err");
									if(err == null){
										out.print("");
									}
									else{
										out.print(err);
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="5" align="center">
								<input type="submit" value="Submit" />
							</td>
						</tr>
					</form>
				<%
					}
				%>
			</table>
		<%
			}
		%>
	</div>
</div>
<%@ include file="footer.jsp" %>