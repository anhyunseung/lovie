<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String SS_USER_NAME = CmmUtil.nvl((String)session.getAttribute("USER_NAME"));
session.setAttribute("USER_NAME", "");
String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("USER_ID"));
session.setAttribute("USER_ID", "");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Let's see the movie! : Lovie - ���̵� ã��</title>
<script type="text/javascript">
function Close_Event(){
    window.close();
}
</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/sign.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
</style>
</head>
<body background="../img/idfbg.png">
<table width="460">
   <col width="150" />
   <col width="350" />
<tr>
<td align="center">
<br>
</td>
</tr>
</table><br><br><br>
<table width="100%">
<tr>
<td align="center">
<b><%=SS_USER_NAME %></b><img src="../img/idfs.png"/> 
</td>
</tr>
<tr>
<td align="center">
<b><%=SS_USER_ID %></b> <img src="../img/idfss.png"/>
</td>
</tr>
<tr>
<td align="right">
<br>
<br>
<br>
<input type="button" class="img-button" onclick="javascript:Close_Event();" value=" "/>
      </td>
</tr>
<tr>
<td align="right"><br><br> <img src="../img/pwfl.png"/><font color="black"><b>&nbsp;-></b></font>
      <a href="user_pw_search.do" onClick="window.open('/user/user_pw_search.do','��й�ȣ ã��','width=470, height=366, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;" >
      <img src="../img/pwf.png"/>
      </a>
      </td>
</tr>
</table>
</body>
</html>