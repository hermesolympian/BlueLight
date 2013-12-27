<%@include file="connect.jsp"%>
<%
	String id = request.getParameter("id");
	String query = "delete from MsProduct where ProductID = " + id;
	st.executeUpdate(query);
	con.close();
	response.sendRedirect("../product.jsp");
%>
