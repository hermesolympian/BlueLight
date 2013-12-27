<%@ include file="connect.jsp" %>
<%
	try
	{
		String user = request.getParameter("usertxt");
		String pass = request.getParameter("passtxt");
		String cpass = request.getParameter("cpasstxt");
		String address = request.getParameter("addresstxt");
		String tlp = request.getParameter("tlptxt");
		String email = request.getParameter("emailtxt");
		boolean isAngka = true;
		long angka;
		int idx = 0;
		boolean isEmail = false;
		boolean isUserExists = false;

		//Cek User Exists
		String queryCekUser = "select * from msuser where username like '%"+user+"%'";
		ResultSet rs = st.executeQuery(queryCekUser);
		if(rs.next()){
			isUserExists = true;
		}

		for(int i=0;i<email.length();i++){
			if(i>0){
				if(email.contains("@")){
					idx = i+2;
					break;
				}
			}
		}
		try{
			isAngka = true;
			angka = Long.parseLong(tlp);
		}catch(Exception e){
			isAngka = false;
		}
		if(idx != 0){
			for(int i=idx;i<email.length()-1;i++){
				if(email.contains(".")){
					isEmail = true;
				}
			}
		}
		
		if(user.equals("") || user == null){
			response.sendRedirect("../register.jsp?err=Username must be filled");
		}
		else if(isUserExists){
			response.sendRedirect("../register.jsp?err=Username is Exists");
		}
		else if(pass.equals("") || pass == null){
			response.sendRedirect("../register.jsp?err=Password must be filled");
		
		}
		else if(cpass.equals("") || cpass == null){
			response.sendRedirect("../register.jsp?err=Confirm Password must be filled");
		
		}
		else if(cpass.equals(pass)==false){
			response.sendRedirect("../register.jsp?err=Confirm Password must be the same with the password");
		}
		else if(address.equals("") || address == null){
			response.sendRedirect("../register.jsp?err=Address must be filled");
		
		}
		else if(address.length()<10 || address.contains("street")==false){
			response.sendRedirect("../register.jsp?err=Address must contains street and 10 characters");
		}
		else if(tlp.equals("") || tlp == null){
			response.sendRedirect("../register.jsp?err=Telephone must be filled");
		
		}
		else if(isAngka == false){
			response.sendRedirect("../register.jsp?err=Telephone must be numeric");
		}
		else if(tlp.length()<12 || tlp.length()>15){
			response.sendRedirect("../register.jsp?err=Telephone must be 12-15 digits");
			
		}
		else if(email.equals("") || email == null){
			response.sendRedirect("../register.jsp?err=Email must be filled");
		
		}
		else if(isEmail == false){
			response.sendRedirect("../register.jsp?err=Wrong email format");
		
		}
		else{
			String query = "insert into MsUser(UserName,Password,Email,Telephone,Address,Role) values('"+user+"','"+pass+"','"+email+"','"+tlp+"','"+address+"','Member')";
			out.print(query);
			st.executeUpdate(query);
			con.close();
			response.sendRedirect("../index.jsp");
		}
		
	}
	catch(Exception e)
	{
		out.print(e);
		//response.sendRedirect("../register.jsp?err=Please input your data correctly");
	}
%>