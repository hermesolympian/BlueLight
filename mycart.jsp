<%@ include file="header.jsp" %>
	
	<div class="content">
	<label>
	<%
	if(request.getParameter("info") != null)
	{
		out.print(request.getParameter("info"));
	}
	else
	{
		out.print("");
	}
	%>
	</label>
	<%
	Vector <String> vector_productid = new Vector<String>();
	vector_productid = (Vector <String>) session.getAttribute("vector_productid");
	if(vector_productid != null){
		if(vector_productid.contains(request.getParameter("removeproductid")))
		{
		vector_productid.remove(request.getParameter("removeproductid"));
		session.setAttribute("vector_productid",vector_productid);
		}
	}
	else{
	out.print(request.getParameterValues("productid"));
	}
	%>
	<form method="get" action="process/do_checkoutall.jsp">
		<table border="1">
				<tr>
					<th>no.</th>
					<th>Image</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Quantity to Buy</th>
					<th>Action</th>
				</tr>
				<%
				if(vector_productid != null)
				{
					Vector <String> vector_qty = new Vector<String>();
						for(int i =0; i<vector_productid.size();i++){
						
						String productid = vector_productid.get(i);
						
						if(!productid.equals(""))
						{
							String query = "select Img, ProductName, Price, Qty from MsProduct where ProductId = "+productid;
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
							int qty = Integer.parseInt(rs.getString("Qty"));
							String productname = rs.getString("ProductName");
							String price = rs.getString("Price");
							%>
								<tr>
									<td>
									<%out.print(i+1);%>
									</td>
									<td>
									<img src="Images/<%= rs.getString("Img") %>" width="100px" height="100px" />
									</td>
									<td>
									<%=productname%>
									</td>
									<td>
									<%=price%>
									</td>
									<td>
									<select name="ddlqty<%out.print(i);%>">
									<%
									if(qty != 0){for(Integer x =1;x<=qty && x<=5;x++){%>
									<option value="<%=x%>"><%out.print(x);%></option>
									<%}
									} 
									else{
									%>
									<option value="<%=0%>"><%out.print(0);%></option>
									<%}%>
									</select>
									</td>
									<td>
									<a href="mycart.jsp?removeproductid=<%=productid%>">remove</a>
									</td>
								</tr>
				<%			}
						}
					}
					con.close();
				}
			%>
		</table>
	<%if(vector_productid != null){%>
	<input type="submit" name="btn" value="check out all">
	<%}%>
	</form>
	<div>
	<a href="product.jsp">continue shopping</a>
</div>
<%@ include file ="footer.jsp"%>