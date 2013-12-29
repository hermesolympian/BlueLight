<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.Date,java.util.Vector, java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file = "process/connect.jsp" %>
<%!
int level;
String oldParent = " ";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="jquery.js"></script>
	<script type="text/javascript">
	$(document).ready ( function(){
   $('#menuHolder li ul:eq(0)').hide();
	});
	</script>
	<style>
	#menuHolder > li{
	display: inline-block;
	vertical-align: top;
    padding: 0px 25px 0px 25px;
    margin: 0;
    list-style: none;
}

   #menuHolder{
	text-align: cemter;
   }
   
    #menuHolder li a{
	font-weight: bold;
	color: orange;
	}
  
.childMenu{
	z-index: 100;
    list-style: none;
    padding: 0px 10px 0px 10px;
	display: none;
}

	</style>
		<link href="style.css" rel="stylesheet" type="text/css">
		<title>Home</title>
	</head>
	<body>
		<div class="wrapper">
			<div class="header">
				<span class="txtHeader" style="color: orange;">Bluelight Online Shop</span>
				<br />
				<!--menuHolder ini adalah management menu untuk mengambil menu dari database
					Query yang digunakan menggunakan join agar menghindari menggunakan 2 query atau netsted while.
					Karena jika menggunakan 2 query nanti harus disediakan lagi 2 file connect.
				-->
				<ul id="menuHolder" style="padding: 0 0 0 0; height: 10px;">
						<li><div><a href="index.jsp">Home</a></div></li>
						<%
							String role = (String)session.getAttribute("user_role");
							if(role == null){
						%>
						<li><div>Register</div></li>
						<li><div><a href="product.jsp">Product</a></div></li>
						<li><div><a href="testimonial.jsp">Testimonial</a></div></li>
						<%
							}
							else {
								if(role.equals("Admin"))
									level = 3;
								else if(role.equals("Member")) //user
									level = 1;
						%>
								<li><div><a href="changepassword.jsp">Change Password</a></div></li>
						<%
								oldParent = " ";
								ResultSet parentMenu = st.executeQuery("select MsParentMenu.ParentName,IIF(MsParentMenu.ParentAddress is null,'-',MsParentMenu.ParentAddress) as ParentAddress,MsMenu.* from MsParentMenu left join MsMenu on MsParentMenu.ParentMenuID=MsMenu.ParentMenuID where MsParentMenu.User <= " + level + " AND IIF(MsMenu.User is null, true, MsMenu.User <= " +level+") Order by ParentMenuOrder,MenuOrder");
							while(parentMenu.next()){
								boolean a = oldParent.equals(parentMenu.getString("ParentName"));
								if(!a)
								{
									if(!oldParent.equals(" "))
									{%>
									</ul></li>
									<%}
								oldParent = parentMenu.getString("ParentName");
								String PLink = parentMenu.getString("ParentAddress");
								if(!PLink.equals("-"))
								{
								%>
									<li style="width: <%=oldParent.length()*10%>px;"><div><a href="<%=PLink%>.jsp"><%=oldParent%></a></div></li>
								<%
								oldParent = " ";
								continue;
								}
								else{
								%>
								<li style="width:135px;"><div><a href="#"><%=oldParent%></a></div>
								<ul class="childMenu">
								<%}}%>
							<li style="width:135px;"><a href="<%=parentMenu.getString(7)%>.jsp"><%=parentMenu.getString("MenuName")%></a></li>
							<%}}%>
<!--					<li><a href="testimonial.jsp">Testimonial</a></li>-->
						</ul>
			</div>