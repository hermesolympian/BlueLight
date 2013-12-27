<%@ include file="connect.jsp" %>
<%
	String id = request.getParameter("update_id");
	String text = request.getParameter("update_text");

	if (text.length() < 15) {
		response.sendRedirect("../updatetesti.jsp?id=" + id + "&err=Testimonial to short, minimum 15 characters");
	}
	else{
		String query = "Update MsTestimonial set TestimonialText = '" + text + "' where TestimonialId = " + id;
		st.executeUpdate(query);
		con.close();
		response.sendRedirect("../testimonial.jsp");
	}
%>