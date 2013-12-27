<%@ include file="header.jsp" %>
<div class="content">
	<div style="margin:50px 0 0 0;" class="tCenter tLarge">
		Manage Product
	</div>
	<div class="space"></div>
	<div class="tCenter tMedium">
		Add Lamp Form
	</div>
	<div class="space"></div>
	<div class="tCenter">
		<form method="post" action="process/do_addproduct.jsp">
			<table bgcolor="#BFBFBF" cellspacing="5" align="center" border="1" width="400px">
				<tr>
				    <th>Lamp Name</th>
				    <td>
				      <input type="text" name="lampName" id="lampName"/>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Lamp Type</th>
				    <td>
				    	<select id="cbType" name="cbType">
				    		<option value="0">--Pick Lamp Type--</option>
							<option value="halogen">halogen</option>
							<option value="led">led</option>
				    	</select>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Price</th>
				    <td>
				      <input type="text" name="price" id="price"/>
				    </td>
			  	</tr>
			  	<tr>
				    <th>Stock</th>
				    <td>
				      <input type="text" name="qty" id="qty" size="2" maxlength="4" />
				    </td>
			  	</tr>
			  	<tr>
				    <th>Image</th>
				    <td>
				      <input type="text" name="img" id="img"/><button type="button">Browse</button>
				    </td>
			  	</tr>
			</table>
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
			<input type="submit" value="Add" />
		</form>
	</div>
</div>
<%@ include file="footer.jsp" %>