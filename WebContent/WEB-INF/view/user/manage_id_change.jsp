<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String SS_USER_ID_CH = CmmUtil.nvl((String)session.getAttribute("USER_ID_CHE"));
String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("USER_ID"));
System.out.print(SS_USER_ID_CH);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/user/manage_id_change.do/../../img/common/icon.ico" type="image/x-icon" />
<title>Let's see the movie! : Lovie - 아이디 변경</title>
<script type="text/javascript">
function doIdchack(f){
	if(f.user_id.value == ""){
	      alert("아이디를 입력해주세요.");
	      f.user_id.focus();
	      return false;
	   }
}
function doKeyIdPw(event) {
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.KeyCode;
	   
	   if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || (keyID >= 65 && keyID <= 90) || keyID==8 || keyID==37 || keyID==39 || keyID==9){
	      return true;
	   }else{
	      return false;
	   }
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
        background: url( "../img/button/change.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
</style>
</head>
<body background="../img/user/userid/idfbg.png">
<font face='Segoe UI' style=' line-height:1.4'>
<form name="f" method="post" action="/user/manage_id_check.do" onsubmit="return doIdchack(this);">
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
<br>
<br>
<b><%=SS_USER_ID_CH%></b>&nbsp;&nbsp;<img src="../img/user/userid/idc.png"/>
</td>
</tr>
<tr>
<td align="center">
<br>
<input type="text" name="user_id" maxlength="20"
				style="width: 110px;" onkeydown="return doKeyIdPw(event)"/>
&nbsp;&nbsp;&nbsp;<input type="submit" class="img-button" value=" "/>
</td>
</tr>
<tr>
<td align="center">
<img src="../img/user/userjoin/idd.png"/>
</td>
</tr>
</table>
</form>
</font>
</body>
</html>