<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
<body>
<table border="0" width="100%">
<tr>
<td align="center">
</td>
</tr>
</table><br><br><br>
<table width="100%">
<tr>
<td align="center">
<img src="../img/pwch.png"/>
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
</table>
</body>
</html>