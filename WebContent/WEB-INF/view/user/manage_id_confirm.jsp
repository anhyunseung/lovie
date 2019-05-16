<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String SS_USER_ID_CH = CmmUtil.nvl((String)session.getAttribute("USER_ID_CH"));
String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("USER_ID"));
session.setAttribute("USER_ID_CH", "");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/user/manage_id_confirm.do/../../img/common/icon.ico" type="image/x-icon" />
<title>Let's see the movie! : Lovie - 아이디 변경</title>
<script type="text/javascript">
function Close_Event(){
    window.close();
    location.href="/top.do";
}
</script>
<style>
a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover { text-decoration: none;}
input {
        vertical-align: middle;
        background-repeat: no-repeat;
      }
      input.img-button {
        background: url( "../img/button/sign.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
</style>
</head>
<body background="../img/user/userid/idfbg.png">
<font face='Segoe UI' style=' line-height:1.4'>
<%
if (SS_USER_ID.equals("admin")){
}else{
%>
<script>
    alert("잘못된 접근입니다.");
    location.href="/top.do";
</script>    
<%
 }
%>
<table width="460" border="0">
<tr>
<td align="center">
<br><br><br>
<img src="../img/user/userid/idch.png"/>
</td>
</tr>
<tr>
<td align="right">
<br><br>
<input type="button" class="img-button" onclick="javascript:Close_Event();" value=" "/>
      &nbsp;&nbsp;&nbsp;</td>
</tr>
</table>
</font>
</body>
</html>