<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg = (String)request.getAttribute("msg");
String url = (String)session.getAttribute("url");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/user/user_login_proc.do/../../img/common/icon.ico" type="image/x-icon" />
<title>로그인 : Lovie</title>
<script type="text/javascript">
   <%if(msg.equals("")){%>
         top.location.href="<%= url%>";
      <%}else{ %>
         alert('<%= msg%>');
         top.location.href="<%= url%>";
      <%} %>
</script>
</head>
<body>

</body>
</html>