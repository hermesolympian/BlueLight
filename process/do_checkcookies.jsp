<%
	int count_cookie = 0;
	Cookie[] my_cookies = request.getCookies();
		if(my_cookies != null){
		for(int j = 0 ;j<my_cookies.length;j++){
			if(my_cookies[j].getName().equals("username")){
				count_cookie++;
			}
		}
	}
%>