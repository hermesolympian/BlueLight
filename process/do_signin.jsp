<%@ include file = "connect.jsp" %>
<%@ include file = "do_checkcookies.jsp" %>
<%
	String username = request.getParameter("txtName");
	String password = request.getParameter("txtPassword");
	String remember_me = request.getParameter("rememberMe");
	Integer user_online = 0;
	int using_cookie = 0;

	if(count_cookie == 1){
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies = request.getCookies();
		for(int c = 0 ; c<cookies.length;c++){
			cookie = cookies[c];
			if(cookie.getName().equals("username")){
				username = cookie.getValue();
			}
			else if(cookie.getName().equals("password")){
				password = cookie.getValue();
			}
		}
		using_cookie++;
		session.setAttribute("cekCookie","done");
	}

	if(username == null || password == null){
		username = "_direct_";
	}

	if(username.equals("_direct_")){
		response.sendRedirect("../index.jsp");
	}

	if(username.equals("")){
		response.sendRedirect("../index.jsp?err=Username must be filled");
	}
	else if(password.equals("")){
		response.sendRedirect("../index.jsp?err=Password must be filled");
	}
	else{
		String query = "select * from MsUser where UserName ='" + username +"' and Password ='" + password + "'";
		ResultSet rs = st.executeQuery(query);

		if(rs.next()){
			//Set Cookie
			if(remember_me != null){
				Cookie cookie_username = new Cookie("username", username);
	   			Cookie cookie_password = new Cookie("password", password);
				
				cookie_username.setMaxAge(60*60*24);
				cookie_password.setMaxAge(60*60*24);
				
				cookie_username.setPath("/");
				cookie_password.setPath("/");

				response.addCookie(cookie_username);
				response.addCookie(cookie_password);
			}

			if(application.getAttribute("user_online") == null){
				user_online = 0;
			}
			else{
				user_online = (Integer)application.getAttribute("user_online");
			}
			if(using_cookie == 0){
				user_online+=1;
			}
			application.setAttribute("user_online",user_online);
			session.setAttribute("user_name",username);
			session.setAttribute("user_id",rs.getString(1));
			session.setAttribute("user_role",rs.getString(7));
			response.sendRedirect("../index.jsp");
		}
		else {
			response.sendRedirect("../index.jsp?err=Username/Password Invalid");
		}
	}
%>