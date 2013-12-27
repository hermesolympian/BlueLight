<%@ include file = "connect.jsp" %>

<%
	String old = request.getParameter("txtOld");
	String new_pass = request.getParameter("txtNew");
	String conf_pass = request.getParameter("txtConf");

	if(old.equals("")){
		response.sendRedirect("../changepassword.jsp?err=Old Password must be filled");
	}
	else if(new_pass.equals("")){
		response.sendRedirect("../changepassword.jsp?err=New Password must be filled");
	}
	else if(conf_pass.equals("")){
		response.sendRedirect("../changepassword.jsp?err=Confirm Password must be filled");
	}
	else if(conf_pass.equals(new_pass) == false){
		response.sendRedirect("../changepassword.jsp?err=New Password and Confirm Password must be the same");
	}
	else{
		String user_id = (String)session.getAttribute("user_id");
		String query = "select * from MsUser where UserId = " + user_id + " and Password ='" + old + "'";
		ResultSet rs = st.executeQuery(query);

		if(rs.next()){
			String query2 = "update MsUser set Password ='" + new_pass + "' where UserId = " + user_id;
			st.executeUpdate(query2);
			response.sendRedirect("../changepassword.jsp?err=Change Password Succeed");
		}
		else{
			response.sendRedirect("../changepassword.jsp?err=Invalid Password");		
		}
	}
%>