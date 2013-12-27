<%@ include file="header.jsp" %>
<%
	if(session.getAttribute("user_role") == null){
		response.sendRedirect("index.jsp");
	}
	else if(role.equals("Admin") == false){
		response.sendRedirect("index.jsp");
	}
	else if(request.getParameter("id") == null){
		response.sendRedirect("product.jsp");
	}
	else{
		String id = request.getParameter("id");
		String query = "select * from MsProduct where ProductId = " + id;
		ResultSet rs = st.executeQuery(query);
		
		rs.next();

		String name = rs.getString("ProductName");
		String type = rs.getString("ProductType");
		Integer price = Integer.parseInt(rs.getString("price"));
		Integer qty = Integer.parseInt(rs.getString("qty"));
		String img = rs.getString("img");
%>
<div class="content">
	<div class="tCenter tLarge">
		Manage Product
	</div>
	<div class="space"></div>
	<div class="tCenter tMedium">
		Update Lamp Form
	</div>
	<div class="space"></div>
	<div class="tCenter">
		<form method="post" action="process/do_updateproduct.jsp">
			<table cellspacing="5" align="center" width="300px" border="1" bgcolor="#BFBFBF">
				<tr>
				    <th>Lamp Name</th>
				    <td>
				    	<input type="hidden" id="productId" name="productId" value="<%= id %>" />
				      <input type="text" name="lampName" id="lampName" disabled value="<%= name %>"/>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Lamp Type</th>
				    <td>
				      <input type="text" name="lampType" id="lampType" disabled value="<%= type %>"/>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Price</th>
				    <td>
				      <input type="text" name="price" id="price" value="<%= price %>"/>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Stock</th>
				    <td>
				      <input type="text" name="qty" id="qty" value="<%= qty %>"/>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Image</th>
				    <td>
				      <img src="Images/<%= img %>" width="100px" height="100px" />
				    </td>
			  	</tr>
			</table>
			<br />
			<div class="error tSmall">
				<%
					String err = request.getParameter("err");
					if(err == null){
						out.print("");
					}
					else{
						out.print(err);
					}
				%>
			</div>
			<br />
			<input type="submit" value="Change" />
		</form>
	</div>
</div>
<%
		}
%>
<%@ include file="footer.jsp" %>