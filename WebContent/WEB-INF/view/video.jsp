<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
   //전달받은 메시지
   String videosrc = CmmUtil.nvl((String) request.getAttribute("videosrc"));
System.out.print(videosrc);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/MsgToList.do/../../img/common/icon.ico" type="image/x-icon" />
<title>비디오 : Lovie</title>
<script type="text/javascript">
</script>
</head>
<body>
<iframe width="500" height="340" src="https://www.youtube.com/embed/<%=videosrc %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</body>
</html>