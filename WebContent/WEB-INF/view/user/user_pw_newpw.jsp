<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%
   request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("PW_USER_ID"));
session.setAttribute("PW_USER_ID", "");

System.out.println("user_id : "+ CmmUtil.nvl((String)session.getAttribute("PW_USER_ID")));
System.out.println("user_id : "+ SESSION_USER_ID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
   function doSubmit(f) {
      if (f.pwd1.value.length >= 20) {
         alert("비밀번호가 20자를 초과하였습니다.");
         f.pwd1.focus();
         return false;
      }
      if (f.pwd1.value == "") {
         alert("새 비밀번호를 적어주세요.");
         f.pwd1.focus();
         return false;
      }

      if (f.pwd2.value == "") {
         alert("새 비밀번호를 적어주세요.");
         f.pwd2.focus();
         return false;
      }
      if (f.pwd2.value != f.pwd1.value) {
         alert("비밀번호가 일치하지 않습니다.");
         f.pwd1.focus();
         return false;
      }
   }
   function doKeyOnlyNumber(event) {
      event = event || window.event;
      var keyID = (event.which) ? event.which : event.KeyCode;

      if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
            || keyID == 8) {
         return true;
      } else {
         return false;
      }

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
         <td align="center"><br>
            <h2>
               <img src="../img/pwfind.png" />
            </h2></td>
      </tr>
   </table>
   <br>
   <br>
   <br>
   <form action="/user/user_pw_confirm.do" name="f" method="post"
      onsubmit="return doSubmit(this);">
      <table border="0" width="100%">
         <tr>
            <td align="center"><br>
            <img src="../img/newpw.png"/></td>
            <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
               type="password" name="pwd1" maxlength="20" style="width: 180px;" /></td>
         </tr>
         <tr>
            <td align="center"><br>
            <br>
            <img src="../img/newpwc.png"/></td>
            <td><br>
            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
               type="password" name="pwd2" maxlength="20" style="width: 180px;" /></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><br>
            <img src="../img/pwd.png"/>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="right"><br>
            <input type="submit"  class="img-button" value=" " />
            </td>
         </tr>
         <tr>
         <td>
               <input type="hidden" name="user_id"
         value="<%=SESSION_USER_ID%>" />
         </td>
         </tr>
      </table>
   </form>
</body>
</html>