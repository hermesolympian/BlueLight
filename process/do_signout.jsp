<%
	session.invalidate();
	Integer user_online = (Integer)application.getAttribute("user_online");
	if(user_online == null)
	{
		user_online = 0;
	}
	else if(user_online > 0)
	{
		user_online--;
	}
	application.setAttribute("user_online",user_online);

	//Cookie
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0 ; i < cookies.length;i++){
			cookies[i].setMaxAge(0);
			cookies[i].setPath("/");
			response.addCookie(cookies[i]);
		}
	}

	response.sendRedirect("../index.jsp");
%>