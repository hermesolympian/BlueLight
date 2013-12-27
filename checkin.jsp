<%@page language="java" import="java.util.*"%>
<%@ include file="header.jsp" %>
<%
	
	Vector <String> vector_productid = new Vector<String>();
	
	if(session.getAttribute("vector_productid")!= null){
		vector_productid = (Vector <String>) session.getAttribute("vector_productid");
	}
	
	if(!vector_productid.contains(request.getParameter("productid"))){
	vector_productid.add(request.getParameter("productid"));
	session.setAttribute("vector_productid",vector_productid);
	}
	
	//out.print("productid =" + request.getParameter("productid"));
	
	response.sendRedirect("mycart.jsp");
%>