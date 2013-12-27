<%@ include file="connect.jsp" %>
<%
	String id = request.getParameter("id");
	String query = "delete from MsTestimonial where TestimonialId =" + id;
	st.executeUpdate(query);
	con.close();
	response.sendRedirect("../testimonial.jsp");
%>