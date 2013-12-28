<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%
	if(request.getParameter("transactionid") == null)
		{
			response.sendRedirect("../transactionhistory.jsp");
		}
	String transactionid = request.getParameter("transactionid");

	String query = "update TrUserBuyTransactionHistory set Approved=1 where Transactionid =" + transactionid;
	st.executeUpdate(query);
	
	
	response.sendRedirect("../product.jsp");
	
%>