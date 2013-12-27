<%@ include file="connect.jsp" %>
<%
	String testi = request.getParameter("txtTestimoni");
	String sender = (String)session.getAttribute("user_name");
	sender = sender.toUpperCase();

	if(testi.length() < 15){
		response.sendRedirect("../testimonial.jsp?err=Testimonial should be more than 15 characters");
	}
	else{
		String query = "insert into MsTestimonial(TestimonialText,TestimonialSender) values ('" + testi + "','" + sender + "')";
		st.executeUpdate(query);
		con.close();
		response.sendRedirect("../testimonial.jsp");
	}
%>