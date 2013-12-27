<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp" %>
<%
	String userid = (String)session.getAttribute("user_id");
	String query = "SELECT MsProduct.ProductName,MsProduct.Price,TrUserBuyTransactionHistory.OwnedQty,TrUserBuyTransactionHistory.DateIn,MsProduct.Img FROM TrUserBuyTransactionHistory INNER JOIN MsProduct on val(TrUserBuyTransactionHistory.ProductId) = MsProduct.ProductId where TrUserBuyTransactionHistory.UserId = '"+userid+"' ORDER BY TrUserBuyTransactionHistory.dateIn DESC";
	String cari = request.getParameter("search");
	
	if(cari != null){
		query = "SELECT MsProduct.ProductName,MsProduct.Price,TrUserBuyTransactionHistory.OwnedQty,TrUserBuyTransactionHistory.DateIn FROM TrUserBuyTransactionHistory INNER JOIN MsProduct on val(TrUserBuyTransactionHistory.ProductId) = MsProduct.ProductId WHERE MsProduct.ProductName LIKE '%"+cari+"%' and TrUserBuyTransactionHistory.UserId = '"+userid+"' ORDER BY TrUserBuyTransactionHistory.dateIn DESC";
	}
	
	ResultSet rs = st.executeQuery(query);
	
	rs.last();
	int totaldata = rs.getRow();
	rs.beforeFirst();
	
	int banyak = 16;
	int current = 0;
	int halaman = 1;
	
	if(request.getParameter("halaman") != null){
		halaman = Integer.parseInt(request.getParameter("halaman"));
	}
	
	int akhir = banyak * halaman;
	int awal = akhir - (banyak - 1);
	
%>

<body>
<div align="center">
	<form action="transactionhistory.jsp" method="get">
		<input type="text" name="search" />
		<input type="submit" value="search">
	</form>
</div>
<table style="width:600px;align=left; margin:25px 10px 0px 250px;" border=1>
<tr>
	<%
		while(rs.next()){
			if(rs.getRow() >= awal  && rs.getRow() <= akhir){
				if(current++%4 == 0)
				{
  %>
  </tr>
  <tr>
  <%}%>
    <td width="10px" height="110px" align="center"><img src="Images/<%= rs.getString(5) %>" width="100px" height="100px" /></td>
    <td width="400px" height="110px">
    	<b>Product Name</b>: <%=rs.getString(1)%><br/>
        <b>Price</b>: Rp. <%=rs.getString(2)%><br/>
        <b>Quantity</b>: <%=rs.getString(3)%> Pcs<br/>
        <b>Transaction Date</b>: <%=rs.getString(4)%><br/>
    </td>
	</tr>
  	<%
			}
		}
	%>
</table>
	<!--<div align="right">
    	<%
			//ceil buat buletin keatas;
			int totalhalaman = (int)Math.ceil(totaldata*1.0 / banyak*1.0);
			
			for(int i = 0;i< totalhalaman;i++ ){
				out.print("<a href=transactionhistory.jsp?halaman="+(i+1)+"> "+(i+1)+" </a>");
			}
			con.close();
		%>
    </div>-->
<%@ include file="footer.jsp" %>