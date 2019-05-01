<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.BBMDTO" %>
<%
BBMDTO rDTO = (BBMDTO)request.getAttribute("rDTO");

//공지글 정보를 못불러왔다면, 객체 생성
if (rDTO==null){
   rDTO = new BBMDTO();

}

int access = 1; //(작성자 : 2 / 다른 사용자: 1) 

if (CmmUtil.nvl((String)session.getAttribute("USER_ID")).equals(
      CmmUtil.nvl(rDTO.getUser_id()))){
   access = 2;
}
System.out.println("user_id : "+ CmmUtil.nvl(rDTO.getUser_id()));
System.out.println("ss_user_id : "+CmmUtil.nvl((String)session.getAttribute("USER_ID")));
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript">


function doOnload(){
   
   if ("<%=access%>" == "1") {
         alert("작성자만 수정할 수 있습니다.");
         location.href="/bbm/bbmInfo.do?bbm_seq=<%=CmmUtil.nvl(request.getParameter("bbm_seq"))%>";
      }
   }

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

   function doInfo(seq){
	    location.href="/bbm/bbmInfo.do?bbm_seq="+ seq;
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
<form name="f" method="post" action="/bbm/bbmUpdate.do" onsubmit="return doSubmit(this);">
      <input type="hidden" name="bbm_seq"
         value="<%=CmmUtil.nvl(request.getParameter("bbm_seq"))%>" />
      <br>
      <div class="infot">
      <table border="0" width="100%">
         <tr>
            <td align="center" width="120px">
            <br>
            <img src="../img/total/tit.png"/></td>
            <td>
            <br>
            <input type="text" name="title" maxlength="35"
               value="<%=CmmUtil.nvl(rDTO.getTitle()) %>" style="width: 425px" /></td>
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
            <textarea name="contents" style="width: 1120px; height: 600px"><%=CmmUtil.nvl(rDTO.getContents())%></textarea>
            </td>
         </tr>
                  <tr>
            <td align="right" colspan="2"><hr>
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" "/>
            &nbsp;&nbsp;</td>
         </tr>
         <tr>
            <td align="center" colspan="2"><input type="submit" class="img-button" value=" " />
               <input type="button" class="img-button2" onclick="javascript:doInfo('<%=CmmUtil.nvl(rDTO.getbbm_seq())%>');" value=" "/></td>
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