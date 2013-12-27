<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%

	Vector <String> vector_productid = new Vector<String>();
	vector_productid = (Vector <String>) session.getAttribute("vector_productid");
	Vector <String> vector_qty = new Vector<String>();
	
	for(int i=0;i<vector_productid.size();i++)
	{
		String qty="ddlqty"+String.valueOf(i);
		
		vector_qty.add(request.getParameter(qty));
	}
	
		session.setAttribute("vector_qty",vector_qty);
	
	response.sendRedirect("do_checkout.jsp");
%>