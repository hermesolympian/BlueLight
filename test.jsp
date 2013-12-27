<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.sql.*" errorPage="" %>
<%
	String price = "33a";
	try{
		Integer tempPrice = Integer.parseInt(price);
		if(tempPrice < 1) {
			out.print("Bukan integer");
		}
		else{
			out.print(price);
		}
	}catch(Exception e){
		out.print("Bukan integer");
	}

	Vector <String[]> cart = (Vector)session.getAttribute("vector_cart");
	out.print(cart.get(1)[0]);
	/*Cookie cookies[] = request.getCookies();
	if(cookies == null){
		out.print("KSG");
	}
	else{
		Cookie c = cookies[0];
		out.print(c.getMaxAge());
	}*/
	/*Cookie cookie = null;
				Cookie[] cookies = null;
				cookies = request.getCookies();
				if(cookies != null){
					out.print("ada cookies");
					for(int i = 0 ; i<cookies.length;i++){
						cookie = cookies[i];
						out.print(cookie.getName());
					}
				}*/

		//----------------------------------------------------//
		/*int count_cookie = 0;
		Cookie[] cookies = request.getCookies();
		for(int i = 0 ;i<cookies.length;i++){
			if(cookies[i].getName().equals("username")){
				count_cookie++;
			}
		}
		out.print(count_cookie);*/

		/*
			//add to cart
			<%@ include file="header.jsp" %>
			<div class="content">
				<table>
					<tr>
						<td>No</td>
						<td>Name</td>
						<td>Qty</td>
						<td>Add to Cart</td>
					</tr>
					<tr>
						<td>1</td>
						<td>Name 1 </td>
						<td>2</td>
						<td><a href="process/do_addtocart.jsp?id=1&qty=2">Add</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Name 2 </td>
						<td>4</td>
						<td><a href="process/do_addtocart.jsp?id=2&qty=4">Add</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>Name 3 </td>
						<td>6</td>
						<td><a href="process/do_addtocart.jsp?id=3&qty=6">Add</a></td>
					</tr>
				</table>
			</div>
			<%@ include file="footer.jsp" %>
		*/
%>