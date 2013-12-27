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
	//out.print(cart.get(1)[0]);
	/*Cookie cookies[] = request.getCookies();
	if(cookies == null){
		out.print("KSG");
	}
	else{
		Cookie c = cookies[0];
		out.print(c.getMaxAge());
	}*/
	Cookie cookie = null;
				Cookie[] cookies = null;
				cookies = request.getCookies();
				if(cookies != null){
					out.print("ada cookies");
					for(int i = 0 ; i<cookies.length;i++){
						cookie = cookies[i];
						out.print(cookie.getName());
					}
				}
%>