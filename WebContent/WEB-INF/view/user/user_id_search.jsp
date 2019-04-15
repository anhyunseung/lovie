<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Let's see the movie! : Lovie - 아이디 찾기</title>
<script type="text/javascript">
function doSubmit(f) {
   if(f.user_name.value == ""){
      alert("성명 또는 이메일을 입력해주세요.");
      f.user_name.focus();
      return false;
   }
   
   if(f.email1.value == ""){
      alert("성명 또는 이메일을 입력해주세요.");
      f.email1.focus();
      return false;
   }
   
   if(f.email2.value == "bd"){
      alert("성명 또는 이메일을 입력해주세요.");
      f.email2.focus();
      return false;
   }
}

function doKeyOnlyNumber(event) {
   event = event || window.event;
   var keyID = (event.which) ? event.which : event.KeyCode;
   
   if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8){
      return true;
   }else{
      return false;
   }
}
function Close_Event(){
    window.close();
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
</style>

</head>
<body background="../img/user/userid/idfbg.png">
<div>
<form name="f" method="post" action="/user/user_id_search_proc.do" onsubmit="return doSubmit(this);">

<table width="460">
   <col width="150" />
   <col width="350" />
   
   <tr>
      <td align="center"><br><img src="../img/user/userjoin/name.png"/></td>
      <td><br><input type="text" name="user_name" maxlength="10" /></td>
   </tr>
   <tr>
   </tr>
   <tr>
   </tr>
   <tr>
   </tr>
   <tr>
   <tr>
   </tr>
   <tr>
   </tr>
   <tr>
   </tr>
   <tr>
   </tr>
   <tr>
      <td align="center"><br><img src="../img/user/userjoin/email.png"/></td>
      <td><br><input type="text" name="email1" maxlength="16" style="width:100px;" />@
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
      </tr>
      <tr>
      </tr>
      <tr>
      </tr>
      <tr>
      </tr>
      <tr>
      </tr><tr>
      </tr><tr>
      </tr>
      <tr>
      <td colspan="2" align="right"><br><input type="submit" class="img-button" value=" "/>&nbsp;&nbsp;&nbsp;
      </td>
      
   </tr>
</table>
</form>
</div>
</body>
</html>