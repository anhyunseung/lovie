<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%
   request.setCharacterEncoding("euc-kr");

   String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID")); //���̵�
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>
<script type="text/javascript" src="js/jquery-1.11.1.js">

var limitByte = 100; //����Ʈ�� �ִ�ũ��, limitByte �� �ʰ��� �� ����


//textarea�� �Էµ� ������ ����Ʈ ���� üũ
function checkByte(frm) {
     var totalByte = 0;
     var message = frm.contents.value;

     for(var i =0; i < message.length; i++) {
             var currentByte = message.charCodeAt(i);
             if(currentByte > 128) totalByte += 2;
else totalByte++;
     }



     // ���� �Է��� ������ ����Ʈ ���� üũ�Ͽ� ǥ��
     $('#messagebyte').text(totalByte);



     // �Էµ� ����Ʈ ���� limitByet�� �ʰ� �� ��� ���â 
     if(totalByte > limitByte) {
             alert( limitByte+"����Ʈ���� ���۰����մϴ�.");
      frm.contents.value = message.substring(0,limitByte);
     }
}
</script>
<script type="text/javascript">
function doOnload(){
   var user_id = "<%=SESSION_USER_ID%>";
   
   if (user_id==""){
      alert("�α��ε� ����ڸ� ���� �� �� �ֽ��ϴ�.");
      location.href="/bbm/bbmList.do";
      
   }
   
}

//�α��� ���� üũ

   //���۽� ��ȣ�� üũ
   function doSubmit(f) {
      if (f.title.value == "") {
         alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
         f.title.focus();
         return false;
      }
      if (calBytes(f.title.value) > 50) {
         alert("�ִ� 50�ڱ��� �Է� �����մϴ�.");
         f.title.focus();
         return false;
      }
      if (f.contents.value == "") {
         alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
         f.contents.focus();
         return false;
      }
      if (calBytes(f.contents.value).length > 100) {
         alert("�ִ� 3000�ڱ��� �Է� �����մϴ�.");
         f.contents.focus();
         return false;
      }

   }
   //���� ���� ����Ʈ ������ üũ�ϱ�(����Ʈ�� ����)
   function calBytes(str) {

      var tcount = 0;
      var tmpStr = new String(str);
      var strCnt = tmpStr.length;

      var onechar;
      for (i = 0; i < srtCnt; i++) {
         onechar = tmpStr.charAt(i);

         if (escape(onechar).length > 4) {
            tcount += 2;
         } else {
            tcount += 1;
         }
      }
      return tcount;
   }
   function doList(){
	    location.href="/bbm/bbmList.do";
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
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/cc.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button3 {
        background: url( "../img/list.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
</style>

</head>
<body onload="doOnload();">
   <form name="f" method="post" action="/bbm/bbmInsert.do" onsubmit="return doSubmit(this);">
      <br>
      <table border="0" width="100%">
         <tr>
            <td align="center" width="120px"><img src="../img/tit.png"/></td>
            <td><input type="text" name="title" maxlength="35"
               style="width: 425px" /></td>
         </tr>
            <tr>
               <td colspan="2">
               <hr>
               </td>
               </tr>
               <tr>
               <td>
               <br>
               <img src="../img/write.png"/>
               </td>
               </tr>
               <tr>
               <td colspan="2">
               <hr>
               </td>
               </tr>
         <tr>
            <td colspan="2"><textarea name="contents" onKeyUp="checkByte(this.form);"
                  style="width: 515px; height: 600px"></textarea>
                  </td>
         </tr>
                  <tr>
            <td align="right" colspan="2"><hr>
            <a href="/bbm/bbmList.do">
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" " />
            </a></td>
         </tr>
         <tr>
            <td align="center" colspan="2">
            <input type="submit"  class="img-button" value=" " />
               <input type="button" class="img-button2" onclick="javascript:doList();" value=" " />
            </td>
         </tr>

      </table>
   </form>
</body>
</html>