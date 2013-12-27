<%@ page import="java.util.*" %>
<%
	String id = request.getParameter("id");
	String qty = request.getParameter("qty");

	String[] arr_cart = {id,qty};
	Vector <String[]> cart = null;
	if(session.getAttribute("vector_cart") == null){
		cart = new Vector <String[]>();
	}
	else{
		cart = (Vector)session.getAttribute("vector_cart");
	}
	
	cart.add(arr_cart);
	session.setAttribute("vector_cart",cart);
%>