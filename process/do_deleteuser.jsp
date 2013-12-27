<%@ include file="connect.jsp" %>
<%
	String id = request.getParameter("id");
	String query = "delete from MsUser where UserId = " + id;
	st.executeUpdate(query);
	con.close();
	response.sendRedirect("../userlist.jsp");
%>