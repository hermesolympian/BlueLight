<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%
	String productid = "";
	String userid = (String)session.getAttribute("user_id");
	String qty = "";
	String query = "";
	int flag = 1;
	
	Vector <String> vector_productid = new Vector<String>();
	vector_productid = (Vector <String>) session.getAttribute("vector_productid");
	Vector <String> vector_qty = new Vector<String>();
	vector_qty = (Vector <String>) session.getAttribute("vector_qty");
	
	
	Vector <String> vector_productid_fail = new Vector<String>();
	Vector <String> vector_qty_fail = new Vector<String>();
	
	for(int i= 0; i<vector_productid.size();i++){
		
		productid = vector_productid.get(i);
		qty = vector_qty.get(i);
		
		query = "";
		query = "SELECT Qty FROM MsProduct WHERE productid = "+productid;
		ResultSet rs = st.executeQuery(query);
		rs.next();
		if(rs.getInt("Qty") >= Integer.parseInt(qty) && Integer.parseInt(qty) != 0){
		
		query = "insert into TrUserBuyTransactionHistory (UserID,ProductID,OwnedQty,DateIn,Approved) values('"+userid+"','"+productid+"','"+qty+"',Now(),0)";
		st.executeUpdate(query);
		
		query = "";
		query = "update MsProduct set Qty=Qty-'"+qty+"' where ProductId = " + productid;
		st.executeUpdate(query);
		
		}
		else{
		flag=0;
		vector_productid_fail.add(productid);
		vector_qty_fail.add(qty);
		}
	}
		con.close();
		
		if(flag==1){
		session.setAttribute("vector_productid",null);
		session.setAttribute("vector_qty",null);
		response.sendRedirect("../transactionhistory.jsp");
		}
		else
		{
		session.setAttribute("vector_productid",vector_productid_fail);
		session.setAttribute("vector_qty",vector_qty_fail);
		response.sendRedirect("../mycart.jsp");
		}
		
%>