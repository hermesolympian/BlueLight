<%@ include file="header.jsp" %>

<div class="content">
	<%
		if(session.getAttribute("user_name") != null){
	%>
		<%@ include file="process/show_data.jsp" %>
	<%
		}
	%>
	<%
		String query = "SELECT * FROM MsProduct where qty > '0'";
		String type = request.getParameter("cbType");
		String cari = request.getParameter("search");

		if(cari != null){
			if(type.equals("1")){
				if(cari != null){
					query = "SELECT * FROM MsProduct WHERE ProductName LIKE '%"+cari+"%' and qty > '0'";
				}
			}
			else if(type.equals("2")){
				if(cari != null){
					query = "SELECT * FROM MsProduct WHERE ProductType LIKE '%"+cari+"%' and qty > '0'";
				}
			}
		}

		query += "order by ProductId";

		ResultSet rs = st.executeQuery(query);
		
		rs.last();
		int totaldata = rs.getRow();
		rs.beforeFirst();
		
		int banyak = 4;
		int current = 0;
		int halaman = 1;

		int totalPage = (int)Math.ceil(totaldata*1.0 / banyak*1.0);

		if(request.getParameter("halaman") != null){
			halaman = Integer.parseInt(request.getParameter("halaman"));
		}

		int akhir = banyak * halaman;
		int awal = akhir - (banyak - 1);

%>
	<div class="tCenter tLarge">Product</div>
	<div class="tCenter tMedium">
		<div class="space">&nbsp;</div>
		<form method="post" action="product.jsp">
			<table align="center">
				<tr>
					<td>
						<select id="cbType" name="cbType">
							<option value="0">--Select Searching Type--</option>
							<option value="1">Searching by Lamp Name</option>
							<option value="2">Searching by Lamp Type</option>
						</select>
					</td>
					<td><input type="text" id="search" name="search" placeholder="Search" /></td>
					<td><input type="submit" value="Search" /></td>
				</tr>
			</table>
		</form>
		<%if(role.equals("Admin")){%>
		<div><a href="addproduct.jsp">Add Product</a></div>
		<%}%>
		<table bgcolor="#BFBFBF" cellspacing="5" align="center" border="1" width="600px">
			<tr>
				<th>Lamp Name</th>
				<th>Type</th>
				<th>Price</th>
				<%if(role != null && role.equals("Admin")){%>
				<th>Stock</th>
				<%}%>
				<th>Image</th>
			<%
				if(session.getAttribute("user_name")!=null){
			%>
				<th>Action</th>
			<%
				}
			%>
			</tr>
			<%
				while(rs.next()){
					if(rs.getRow() >= awal && rs.getRow() <= akhir){
			%>
			<tr>
				<td><%= rs.getString("ProductName") %></td>
				<td><%= rs.getString("ProductType") %></td>
				<td><%= rs.getString("Price") %></td>
				<%if(role != null && role.equals("Admin")){%>
				<td><%= rs.getString("Qty") %></td>
				<%}%>
				<td><img src="Images/<%= rs.getString("Img") %>" width="100px" height="100px" /></td>
				<%
					if(role != null){
				%>
					<td>
						<% 
							if(role.equals("Admin")){
						%>
							<span><a href="process/do_deleteproduct.jsp?id=<%= rs.getString("ProductId") %>">Remove</a>&nbsp;<a href="updateproduct.jsp?id=<%= rs.getString("ProductId") %>">Update</a><span>
						<%
							}
							else if(role.equals("Member")){
						%>
							<a href="checkin.jsp?productid=<%=rs.getString("productId")%>">add to cart</a>
						<%
							}
						%>
					</td>
				<%
					}
				%>
			</tr>
			<%
					}
				}
			%>
		</table>
		<div class="tRight paginationProduct">
			<%
				if(totalPage != 1){
					for(int j=1;j<=totalPage;j++){
			%>
				<a href="product.jsp?halaman=<%= j %><%
				if(type != null && cari !=null){
					out.print("&cbType="+type+"&search="+cari);
				}%>"><%= j %></a>
			<%
					}
				}
			%>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>