<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="poly.util.CmmUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function doTop(){
    top.location.href="/top.do";
}

function doSubmit(f) {
   if(f.user_id.value.length >= 20){
      alert("아이디가 20자를 초과했습니다.");
      f.user_id.focus();
      return false;
   }
   if(f.user_id.value == ""){
      alert("아이디를 입력 해주세요.");
      f.user_id.focus();
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
   
   if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || (keyID >= 65 && keyID <= 90) || keyID==8 || keyID==37 || keyID==39 || keyID==9 ){
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
        background: url( "../img/total/cc.png" ) no-repeat;
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
<h2><img src="../img/user/userjoin/joint.png" /></h2>
</td>
</tr>
</table>
<form action="/user/user_join3.do" method="post" name="f" onsubmit="return doSubmit(this);">
   <table width="100%" border="0" bgcolor="black">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="center"><br><img src="../img/user/userjoin/name.png"/></td>
         <td><br><input type="text" name="user_name" disabled="disabled" maxlength="10" style="width:200px;"/></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="center"><br><img src="../img/top/Id.png"/></td>
         <td><br><input type="text" name="user_id" maxlength="20"  style="width:200px;" onkeydown="return doKeyIdPw(event)"/>
         &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="img-button" value=" "/>
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
         <td><br><input type="password" name="pwd1" disabled="disabled" maxlength="20" style="width:200px;"/></td>
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
         <td><br><input type="password" name="pwd2"  disabled="disabled" maxlength="20" style="width:200px;"/></td>
      </tr>      
      <tr>
         <td align="center"><br><br><img src="../img/user/userjoin/email.png"/></td>
         <td colspan="2">
         <br><br>
            <input type="text" name="email1" maxlength="16" style="width:100px;" disabled="disabled"/>&nbsp;<b>@</b>
             <input type="text" name="email2" maxlength="16" style="width:100px;" value="선택하세요" disabled="disabled"/>
         </td>
      </tr>
      <tr>
      <td align="center"><br><br><img src="../img/user/userjoin/phone.png"/></td>
      <td><br><br>
         <input type="text" name="tel_1" maxlength="4" disabled="disabled" style="width:50px" />&nbsp;<b>-</b>
         <input type="text" name="tel_2" maxlength="4" disabled="disabled" style="width:80px" />&nbsp;<b>-</b>
         <input type="text" name="tel_3" maxlength="4"  disabled="disabled" style="width:80px" />
      </td>
   </tr>   
   <tr>
         <td align="center"><br><br><img src="../img/user/userjoin/birth.png"/></td>
         <td><br><br>
         <input type="text" name="birthday" disabled="disabled" maxlength="6" style="width:200px;"/>
         </td>
      </tr>         
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
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