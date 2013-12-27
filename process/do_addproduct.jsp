<%@include file="connect.jsp"%>
<%
	if(session.getAttribute("user_name") == null){
		response.sendRedirect("../index.jsp");
	}
	else{
		String name = request.getParameter("lampName");
		String type = request.getParameter("cbType");
		String price = request.getParameter("price");
		String qty = request.getParameter("qty");
		String img = request.getParameter("img");
		String err = "";

		if(name.equals("") || name == null){
			response.sendRedirect("../addproduct.jsp?err=Product name must be filled");
		}
		else if(type.equals("0")){
			response.sendRedirect("../addproduct.jsp?err=Product type must be chosen");
		}
		else if(price.equals("") || price == null){
			response.sendRedirect("../addproduct.jsp?err=Price must be filled");
		}
		else if(qty.equals("") || qty == null){
			response.sendRedirect("../addproduct.jsp?err=Stock must be filled");
		}
		else if(img.equals("") || img == null){
			response.sendRedirect("../addproduct.jsp?err=Image must be filled");
		}
		else if(name.length() > 25){
			response.sendRedirect("../addproduct.jsp?err=Max 25 characters for Product Name");
		}
		else if(!img.endsWith(".jpg") && !img.endsWith(".png")){
			response.sendRedirect("../addproduct.jsp?err=Product Image must have extension .jpg/.png (Case Sensitive)");
		}else{
			int val = 0;
			Integer price2 = null;
			Integer qty2 = null;
			try{
				price2 = Integer.parseInt(price);
			}
			catch(Exception e){
				val = 1;
			}

			try{
				qty2 = Integer.parseInt(qty);
			}
			catch(Exception e){
				val = 2;
			}
			if(val == 1){
				response.sendRedirect("../addproduct.jsp?err=Price must be Number");
			}
			else if(val == 2){
				response.sendRedirect("../addproduct.jsp?err=Stock must be Number");
			}
			else{
				String query = "insert into msproduct(ProductName, Price, Qty, Img,ProductType) values('"+ name +"','"+price+"','"+qty+"','"+img+"','"+type+"')";
				out.print(query);
				st.executeUpdate(query);
				con.close();
				response.sendRedirect("../product.jsp");
			}
		}
	}
%>
