<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="poly.util.CmmUtil"%>
    <%
	request.setCharacterEncoding("UTF-8");

    String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
    String id_over =CmmUtil.nvl((String) session.getAttribute("id_over"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<%if(SESSION_USER_ID==""){%>
<%}else{%>
alert("잘못된 접근입니다.");
top.location.href="/top.do";
<%}%>
function doTop(){
    top.location.href="/top.do";
}

function doSubmit(f) {
   if(f.user_id.value.length >= 20){
      alert("아이디 및 비밀번호가 20자를 초과했습니다.");
      f.user_id.focus();
      return false;
   }
   
   if(f.pwd1.value.length >= 20){
      alert("아이디 및 비밀번호가 20자를 초과했습니다.");
      f.pwd1.focus();
      return false;
   }
   
   if(f.user_name.value == ""){
      alert("모두 입력을 해주세요.");
      f.user_name.focus();
      return false;
   }
   
   if(f.user_id.value == ""){
      alert("모두 입력을 해주세요.");
      f.user_id.focus();
      return false;
   }
   
   if(f.pwd1.value == ""){
      alert("모두 입력을 해주세요.");
      f.pwd1.focus();
      return false;
   }
   
   if(f.pwd2.value == ""){
      alert("모두 입력을 해주세요.");
      f.pwd2.focus();
      return false;
   }
   
   if(f.pwd1.value != f.pwd2.value){
      alert("패스워드가 일치하지 않습니다.");
      f.pwd1.focus();
      return false;
   }

   if(f.email1.value == ""){
      alert("모두 입력을 해주세요.");
      f.email1.focus();
      return false;
   }
   
   if(f.email2.value == "bd"){
      alert("모두 입력을 해주세요.");
      f.email2.focus();
      return false;
   }
   
   if(f.tel_1.value == ""){
      alert("모두 입력을 해주세요.");
      f.tel_1.focus();
      return false;
   }
   
   if(f.tel_2.value == ""){
      alert("모두 입력을 해주세요.");
      f.tel_2.focus();
      return false;
   }
   
   if(f.tel_3.value == ""){
      alert("모두 입력을 해주세요.");
      f.tel_3.focus();
      return false;
   }
   
   if(f.birthday.value == ""){
      alert("모두 입력을 해주세요.");
      f.birthday.focus();
      return false;
   }
   
   if(f.birthday.value.length != 6){
      alert("6자리로 입력해 주세요 \n ( ex.991111 )");
      f.birthday.focus();
      return false;
   }
}
function doKeyOnlyNumber(event) {
   event = event || window.event;
   var keyID = (event.which) ? event.which : event.KeyCode;
   
   if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==37 || keyID==39 || keyID==9){
      return true;
   }else{
      return false;
   }
}

function doKeyOnlyWord(event) {
   event = event || window.event;
   var keyID = (event.which) ? event.which : event.KeyCode;
   
   if((keyID >= 65 && keyID <= 90) || keyID==8 || keyID==37 || keyID==39 || keyID==9 || keyID==229){
      return true;
   }else{
      return false;
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
}
function doTop(){
    top.location.href="/top.do";
}
</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/button/sign.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/button/cc.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
</style>
</head>
<body>
<table border="0" width="100%" bgcolor="black">
<tr>
<td align="center">
<br>
<img src="../img/user/userjoin/joint.png" />
<br><br><br>
</td>
</tr>
</table>
<form action="/user/user_join_save.do" method="post" name="f" onsubmit="return doSubmit(this);">
   <table width="100%" border="0" bgcolor="black">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="center"><br><img src="../img/user/userjoin/name.png"/></td>
         <td><br><input type="text" name="user_name" maxlength="10" style="width:200px;" onkeydown="return doKeyOnlyWord(event)"/></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="center"><br><img src="../img/top/Id.png"/></td>
         <td><br><input type="text" name="user_id" maxlength="20"  style="width:200px;" value="<%=id_over%>"  disabled="disabled"/>
         </td>
      </tr>
      <tr>
      <td>
      </td>
      <td colspan="2" align="left">
      <img src="../img/user/userjoin/idd.png"/>
      <br>
      </td>
      </tr>
      <tr>
         <td align="center"><br><img src="../img/top/pw.png"/></td>
         <td><br><input type="password" name="pwd1" maxlength="20" style="width:200px;" onkeydown="return doKeyIdPw(event)"/></td>
      </tr>
      <tr>
      <td>
      </td>
      <td colspan="2" align="left">
      <img src="../img/user/userjoin/pwd.png"/>
      <br>
      </td>
      </tr>
      <tr>
      <td align="center"><br><img src="../img/user/userjoin/pwc.png"/></td>
         <td><br><input type="password" name="pwd2" maxlength="20" style="width:200px;"  onkeydown="return doKeyIdPw(event)"/></td>
      </tr>      
      <tr>
         <td align="center"><br><br><img src="../img/user/userjoin/email.png"/></td>
         <td colspan="2">
         <br><br>
            <input type="text" name="email1" maxlength="16" style="width:100px;" onkeydown="return doKeyIdPw(event)"/>&nbsp;<b>@</b>
            <select name="email2">
               <option value="bd">선택하세요</option>
               <option value="naver.com">naver.com</option>
               <option value="nate.com">nate.com</option>
               <option value="hanmail.com">hanmail.com</option>
               <option value="gmail.com">gmail.com</option>
            </select>
         </td>
      </tr>
      <tr>
      <td align="center"><br><br><img src="../img/user/userjoin/phone.png"/></td>
      <td><br><br>
         <select name="tel_1" style="width:50px;">
         <option value=""></option>
         <option value="010">010</option>
         <option value="011">011</option>
         <option value="017">017</option>
         </select>&nbsp;<b>-</b>
         <input type="text" name="tel_2" maxlength="4" style="width:80px" onkeydown="return doKeyOnlyNumber(event)"/>&nbsp;<b>-</b>
         <input type="text" name="tel_3" maxlength="4" style="width:80px" onkeydown="return doKeyOnlyNumber(event)"/>
      </td>
   </tr>   
   <tr>
         <td align="center"><br><br><img src="../img/user/userjoin/birth.png"/></td>
         <td><br><br>
         <input type="text" name="birthday" maxlength="6" style="width:200px;" onkeydown="return doKeyOnlyNumber(event)"/>
         </td>
      </tr>         
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
            <input type="submit" class="img-button" value=" "/>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="img-button2" onclick="javascript:doTop();" value=" "/>
            <br>
            <br>
            <br>
         </td>
      </tr>
   </table>
</form>
</body>
</html>