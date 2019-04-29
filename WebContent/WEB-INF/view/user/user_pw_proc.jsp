<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg = (String)request.getAttribute("msg");
String url = (String)request.getAttribute("url");
String USER_ID = (String)session.getAttribute("USER_ID");
String USER_NAME = (String)session.getAttribute("USER_NAME");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>처리페이지</title>
<script type="text/javascript">
   <%if(msg.equals("")){%>
         location.href="<%= url%>";
      <%}else{ %>
         alert('<%= msg%>');
         location.href="<%= url%>";
      <%} %>
      
</script>
</head>
<body>
<input type="hidden" name="user_id" value="<%=USER_ID%>"/>
<input type="hidden" name="user_name" value="<%=USER_NAME %>" />
</body>
</html>