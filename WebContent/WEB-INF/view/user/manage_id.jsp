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
      alert("���̵� 20�ڸ� �ʰ��߽��ϴ�.");
      f.user_id.focus();
      return false;
   }
   if(f.user_id.value == ""){
      alert("���̵� �Է� ���ּ���.");
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
</head>
<body>
<table border="0" width="100%">
<tr>
<td align="center">
<br>
<h2><img src="../img/create.png" /></h2>
</td>
</tr>
</table><br><br><br>
<form action="/user/idover.do" method="post" name="f" onsubmit="return doSubmit(this);">
   <table width="500px">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="center"><br><b>����</b></td>
         <td><br><input type="text" disabled="disabled" name="user_name" value="" maxlength="10" style="width:200px;" onkeydown="return doKeyOnlyWord(event)"/></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="center"><br><b>ID</b></td>
         <td><br><input type="text" name="user_id" maxlength="20" style="width:200px;" onkeydown="return doKeyIdPw(event)"/>
         <input type="submit" value="�ߺ�Ȯ��" />
         </td>
      </tr>
      <tr>
      <td colspan="2">
      <font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���̵�� ����/���ڷ� 20�� ����</font> 
      </td>
      </tr>
      <tr>
         <td align="center"><br><b>��й�ȣ</b></td>
         <td><br><input type="password" disabled="disabled" name="pwd1" maxlength="20" style="width:200px;" onkeydown="return doKeyIdPw(event)"/></td>
      </tr>
      <tr>
      <td colspan="2">
      <font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��й�ȣ�� ����/���ڷ� 20�� ����</font> 
      </td>
      </tr>
      <tr>
      <td align="center"><br><b>��й�ȣ Ȯ��</b></td>
         <td><br><input type="password" disabled="disabled" name="pwd2" maxlength="20" style="width:200px;"  onkeydown="return doKeyIdPw(event)"/></td>
      </tr>      
      <tr>
         <td align="center"><br><br><b>�̸���</b></td>
         <td colspan="2">
         <br><br>
            <input type="text" disabled="disabled" name="email1" maxlength="16" style="width:100px;" onkeydown="return doKeyIdPw(event)" />&nbsp;<b>@</b>
            <select name="email2" disabled="disabled">
               <option value="bd">�����ϼ���</option>
               <option value="naver.com">naver.com</option>
               <option value="nate.com">nate.com</option>
               <option value="hanmail.com">hanmail.com</option>
               <option value="gmail.com">gmail.com</option>
            </select>
         </td>
      </tr>

      <tr>
      <td align="center"><br><br><b>��ȭ��ȣ</b></td>
      <td><br><br>
         <select name="tel_1" style="width:50px;" disabled="disabled">
         <option value=""></option>
         <option value="010">010</option>
         <option value="011">011</option>
         <option value="017">017</option>
         </select>&nbsp;<b>-</b>
         <input type="text" disabled="disabled" name="tel_2" maxlength="4" style="width:80px" onkeydown="return doKeyOnlyNumber(event)"/>&nbsp;<b>-</b>
         <input type="text" disabled="disabled" name="tel_3" maxlength="4" style="width:80px" onkeydown="return doKeyOnlyNumber(event)"/>
      </td>
   </tr>   
   <tr>
         <td align="center"><br><br><b>�������</b></td>
         <td><br><br>
         <input type="text" disabled="disabled" name="birthday" maxlength="6" style="width:200px;" onkeydown="return doKeyOnlyNumber(event)"/>
         </td>
      </tr>         
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
            <input type="button" onclick="javascript:doTop();" value="���"/>
         </td>
      </tr>
   </table>
</form>
</body>
</html>