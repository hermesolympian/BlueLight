<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%
	if(request.getParameter("transactionid") == null)
		{
			response.sendRedirect("../transactionhistory.jsp");
		}
	String transactionid = request.getParameter("transactionid");

	String query = "SELECT OwnedQty, ProductId FROM TrUserBuyTransactionHistory where TrUserBuyTransactionHistory.Transactionid="+transactionid;
	ResultSet rs = st.executeQuery(query);
	
	String qty = "";
	String productid = "";
	
	while(rs.next())
	{
	qty = rs.getString(1);
	productid = rs.getString(2);
	//break;
	}
	
	query = "SELECT Qty FROM MsProduct where productid="+productid;
	rs = st.executeQuery(query);
	
	while(rs.next())
	{
	qty = Integer.toString((Integer.parseInt(qty)+Integer.parseInt(rs.getString(1))));
	//break;
	}
	
	query = "update MsProduct set Qty='"+qty+"' where ProductId = " + productid;
	st.executeUpdate(query);
	
	query = "delete from TrUserBuyTransactionHistory where TransactionId="+transactionid;
	st.executeUpdate(query);
	
	response.sendRedirect("../product.jsp");
	
%>