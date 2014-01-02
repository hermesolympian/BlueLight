<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp" %>
<%
	String userid = (String)session.getAttribute("user_id");
	if(request.getParameter("transactionid") == null)
	{
		response.sendRedirect("../transactionhistory.jsp");
	}
	String transactionid = request.getParameter("transactionid");
	String query = "SELECT MsProduct.ProductName,MsProduct.Price,TrUserBuyTransactionHistory.OwnedQty FROM TrUserBuyTransactionHistory INNER JOIN MsProduct on val(TrUserBuyTransactionHistory.ProductId) = MsProduct.ProductId where TrUserBuyTransactionHistory.UserId = '"+userid+"' and TrUserBuyTransactionHistory.Transactionid="+transactionid;
	ResultSet rs = st.executeQuery(query);
%>

<body>
<div style="width:600px;text-align: center; margin:25px 10px 0px 250px;"> 
<b>Detail Transaction</b>
</div>
<table style="width:600px;align=left; margin:25px 10px 0px 250px;" border=1>
<tr>
	<th>Product Name</th>
	<th>Price</th>
	<th>Quantity</th>
</tr>
		<%
		while(rs.next()){
		%>
  <tr>
    <td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	</tr>
  	<%
		}
	%>
</table>
<%@ include file="footer.jsp" %>