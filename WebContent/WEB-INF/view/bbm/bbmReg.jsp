<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
   request.setCharacterEncoding("UTF-8");

   String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID")); //아이디
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript" src="js/jquery-1.11.1.js">

var limitByte = 100; //바이트의 최대크기, limitByte 를 초과할 수 없슴


//textarea에 입력된 문자의 바이트 수를 체크
function checkByte(frm) {
     var totalByte = 0;
     var message = frm.contents.value;

     for(var i =0; i < message.length; i++) {
             var currentByte = message.charCodeAt(i);
             if(currentByte > 128) totalByte += 2;
else totalByte++;
     }



     // 현재 입력한 문자의 바이트 수를 체크하여 표시
     $('#messagebyte').text(totalByte);



     // 입력된 바이트 수가 limitByet를 초과 할 경우 경고창 
     if(totalByte > limitByte) {
             alert( limitByte+"바이트까지 전송가능합니다.");
      frm.contents.value = message.substring(0,limitByte);
     }
}
</script>
<script type="text/javascript">
function doOnload(){
   var user_id = "<%=SESSION_USER_ID%>";
   
   if (user_id==""){
      alert("로그인된 사용자만 글을 쓸 수 있습니다.");
      location.href="/bbm/bbmList.do";
      
   }
   
}

//로그인 여부 체크

   //전송시 유호성 체크
   function doSubmit(f) {
      if (f.title.value == "") {
         alert("제목을 입력하시기 바랍니다.");
         f.title.focus();
         return false;
      }
      if (calBytes(f.title.value) > 50) {
         alert("최대 50자까지 입력 가능합니다.");
         f.title.focus();
         return false;
      }
      if (f.contents.value == "") {
         alert("내용을 입력하시기 바랍니다.");
         f.contents.focus();
         return false;
      }
      if (calBytes(f.contents.value).length > 100) {
         alert("최대 3000자까지 입력 가능합니다.");
         f.contents.focus();
         return false;
      }

   }
   //글자 길이 바이트 단위로 체크하기(바이트값 전달)
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
      input {
        vertical-align: middle;
      }
      input.img-button3 {
        background: url( "../img/button/list.png" ) no-repeat;
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
            <td align="center" width="120px"><img src="../img/total/tit.png"/></td>
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
               <img src="../img/button/write.png"/>
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