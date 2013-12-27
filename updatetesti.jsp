<%@ include file="header.jsp" %>
<%! 
	String update_text = "";
%>
<%
	String id = request.getParameter("id");
	String query = "select * from MsTestimonial where TestimonialId = " + id;
	ResultSet rs = st.executeQuery(query);
	
	if(rs.next()){
		update_text = (String)rs.getString(2);
	}
%>
<div class="content">
	<div class="tCenter tLarge">
		Testimonial Updater
	</div>
	<div class="space"></div>
	<div class="tCenter tMedium">
		Testimonial Editor
	</div>
	<div class="space"></div>
	<div class="tCenter">
		<form method="post" action="process/do_updatetesti.jsp">
			<input type="hidden" name="update_id" id="update_id" value="<%= id %>" />
			<textarea name="update_text" rows="5"><%= update_text %></textarea>
			<br />
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
			<input type="submit" value="Update Testimonial" />
		</form>
	</div>
</div>
<%@ include file="footer.jsp" %>