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
      if(f.title.value.length > 50){
         alert("최대 50자까지 입력 가능합니다.");
         f.title.focus();
         return false;
      }
      if (f.contents.value == "") {
         alert("내용을 입력하시기 바랍니다.");
         f.contents.focus();
         return false;
      }
      if (f.contents.value.length > 2000) {
         alert("최대 2000자까지 입력 가능합니다.");
         f.contents.focus();
         return false;
      }

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
        background: url( "../img/button/cc.png" ) no-repeat;
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
      div.infot{
      background-image: url('../img/bg/infot.png');
      }
      div.framebgd
	{
	background-image:url('../img/bg/framebgd.png');
	}
</style>

</head>
<body onload="doOnload();">
   <form name="f" method="post" action="/bbm/bbmInsert.do" onsubmit="return doSubmit(this);">
   <div class="infot">
      <table border="0" width="100%">
         <tr>
            <td align="center" width="120px">
            <br>
            <img src="../img/total/tit.png"/></td>
            <td>
            <br>
            <input type="text" name="title" maxlength="35"
               style="width: 425px" /></td>
         </tr>
            <tr>
               <td colspan="2">
               <hr>
               </td>
               </tr>
               <tr>
               <td>
               &nbsp;<img src="../img/total/writes.png"/>
               </td>
               </tr>
               <tr>
               <td colspan="2">
               <hr>
               </td>
               </tr>
         <tr>
            <td colspan="2">&nbsp;&nbsp;&nbsp;
            <textarea name="contents" onKeyUp="checkByte(this.form);"
                  style="width: 1120px; height: 600px"></textarea>
                  </td>
         </tr>
                  <tr>
            <td align="right" colspan="2"><hr>
            <a href="/bbm/bbmList.do">
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" " />
            </a>&nbsp;&nbsp;</td>
         </tr>
         <tr>
            <td align="center" colspan="2">
            <input type="submit"  class="img-button" value=" " />
               <input type="button" class="img-button2" onclick="javascript:doList();" value=" " />
            </td>
         </tr>
       </table>
			</div>
			<div class="framebgd">
   <table>
   <tr>
   <td>
   <br>
   </td>
   </tr>
   </table>
   </div>
   </form>
</body>
</html>