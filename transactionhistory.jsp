<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp" %>
<%
	String userid = (String)session.getAttribute("user_id");
	String query = "";
	if(role != null && role.equals("Member")){
	query = "SELECT TrUserBuyTransactionHistory.TransactionID,MsUser.UserName,TrUserBuyTransactionHistory.DateIn FROM TrUserBuyTransactionHistory INNER JOIN MsUser on val(TrUserBuyTransactionHistory.UserId) = MsUser.UserId WHERE TrUserBuyTransactionHistory.Approved = 0 and TrUserBuyTransactionHistory.UserId = '"+userid+"' ORDER BY TrUserBuyTransactionHistory.dateIn DESC";
	}
	else
	{
	query = "SELECT TrUserBuyTransactionHistory.TransactionID,MsUser.UserName,TrUserBuyTransactionHistory.DateIn FROM TrUserBuyTransactionHistory INNER JOIN MsUser on val(TrUserBuyTransactionHistory.UserId) = MsUser.UserId WHERE TrUserBuyTransactionHistory.Approved = 0 ORDER BY TrUserBuyTransactionHistory.dateIn DESC";
	}
	ResultSet rs = st.executeQuery(query);
	
	
%>

<body>
<b>Waiting Transaction</b>
<table style="width:600px;align=left; margin:25px 10px 0px 250px;" border=1>
<tr>
	<th>Transaction ID</th>
	<th>Username</th>
	<th>Transaction Date</th>
	<th>Action</th>
</tr>
	<%
		while(rs.next()){
		String transactionid = rs.getString(1);
  %>
  <tr>
	<td><%=transactionid%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
    <td>
	<a href="detailtransactionhistory.jsp?transactionid=<%=transactionid%>">details</a>
	</br><a href="process\do_remove.jsp?transactionid=<%=transactionid%>">remove</a>
	<%//if(role != null && role.equals("Admin")){%>
	</br><a href="process\do_approve.jsp?transactionid=<%=transactionid%>">approve</a>
	<%//}%>
	</td>
	</tr>
  	<%
		}
	%>
</table>
</br></br>
<b>Approved Transaction</b>
<table style="width:600px;align=left; margin:25px 10px 0px 250px;" border=1>
<tr>
	<th>Transaction ID</th>
	<th>Username</th>
	<th>Transaction Date</th>
	<th>Action</th>
</tr>
	<%
	if(role != null && role.equals("Member")){
	query = "SELECT TrUserBuyTransactionHistory.TransactionID,MsUser.UserName,TrUserBuyTransactionHistory.DateIn FROM TrUserBuyTransactionHistory INNER JOIN MsUser on val(TrUserBuyTransactionHistory.UserId) = MsUser.UserId WHERE TrUserBuyTransactionHistory.Approved = 1 and TrUserBuyTransactionHistory.UserId = '"+userid+"' ORDER BY TrUserBuyTransactionHistory.dateIn DESC";
	}
	else
	{
	query = "SELECT TrUserBuyTransactionHistory.TransactionID,MsUser.UserName,TrUserBuyTransactionHistory.DateIn FROM TrUserBuyTransactionHistory INNER JOIN MsUser on val(TrUserBuyTransactionHistory.UserId) = MsUser.UserId WHERE TrUserBuyTransactionHistory.Approved = 1 ORDER BY TrUserBuyTransactionHistory.dateIn DESC";
	}
	rs = st.executeQuery(query);
	
	while(rs.next()){
	String transactionid = rs.getString(1);
  %>
  <tr>
	<td><%=transactionid%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
    <td>
	<a href="detailtransactionhistory.jsp?transactionid=<%=transactionid%>">details</a>
	</td>
	</tr>
  	<%
	}
	%>
</table>
</body>

<%@ include file="footer.jsp" %>