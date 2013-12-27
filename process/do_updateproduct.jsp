<%@include file="connect.jsp"%>
<%
	if(session.getAttribute("user_name") == null){
		response.sendRedirect("../index.jsp");
	}
	else{
		String id = request.getParameter("productId");
		String price = request.getParameter("price");
		String qty = request.getParameter("qty");
		String err = "";

		if(id == null){
			response.sendRedirect("../index.jsp");
		}
		else{
			if(price.equals("") || price == null){
				response.sendRedirect("../updateproduct.jsp?err=Price must be filled&id="+id);
			}
			else if(qty.equals("") || qty == null){
				response.sendRedirect("../updateproduct.jsp?err=Price must be filled&id="+id);
			}
			else{
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
					response.sendRedirect("../updateproduct.jsp?err=Price must be Number&id="+id);
				}
				if(val == 2){
					response.sendRedirect("../updateproduct.jsp?err=Stock must be Number&id="+id);
				}
				else{
					String query = "UPDATE MsProduct SET Price='"+price2+"', Qty='"+qty2+"' where ProductID = " + id;
					st.executeUpdate(query);
					con.close();
					response.sendRedirect("../product.jsp");
				}
			}
		}
	}
%>
