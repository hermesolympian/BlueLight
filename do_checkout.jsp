<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%
	String productid = request.getParameter("productid");
	String userid = (String)session.getAttribute("user_id");
	String qty = request.getParameter("ddlqty");
	
	String query = "SELECT Qty FROM MsProduct WHERE productid = "+productid;
	ResultSet rs = st.executeQuery(query);
	rs.next();
	if(rs.getInt("Qty") >= Integer.parseInt(qty)){
	
	query = "insert into TrUserBuyTransactionHistory (UserID,ProductID,OwnedQty,DateIn) values('"+userid+"','"+productid+"','"+qty+"',Now())";
	st.executeUpdate(query);
	
	query = "";
	
	query = "update MsProduct set Qty=Qty-'"+qty+"' where ProductId = " + productid;
	st.executeUpdate(query);
	con.close();
	
	Vector <String> vector_productid = new Vector<String>();
	//Vector <String> vector_qty = new Vector<String>();
	
	vector_productid = (Vector <String>) session.getAttribute("vector_productid");
	vector_productid.remove(productid);
	session.setAttribute("vector_productid",vector_productid);
	
	response.sendRedirect("../index.jsp");
	}
	
	else{
	response.sendRedirect("../mycart.jsp");
	}

%>