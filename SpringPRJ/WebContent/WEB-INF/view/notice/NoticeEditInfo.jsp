<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.NoticeDTO" %>
<%
NoticeDTO rDTO = (NoticeDTO)request.getAttribute("rDTO");

//공지글 정보를 못불러왔다면, 객체 생성
if (rDTO==null){
   rDTO = new NoticeDTO();

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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글쓰기</title>
<script type="text/javascript">


function doOnload(){
   
   if ("<%=access%>" == "1") {
         alert("본인이 작성한 글만 수정 가능합니다.");
         location.href="/notice/NoticeInfo.do?notice_seq=<%=CmmUtil.nvl(request.getParameter("notice_seq"))%>";
      }
   }

   function doSubmit(f) {
      if (f.title.value == "") {
         alert("제목을 입력하시기 바랍니다.");
         f.title.focus();
         return false;
      }

      if (calBytes(f.title.value) > 35) {
          alert("최대 35자까지 입력 가능합니다.");
          f.title.focus();
          return false;
       }

      var noticeCheck = false;
      for (var i = 0; i < f.noticeYn.length; i++) {
         if (f.noticeYn[i].checked) {
            noticeCheck = true;
         }
      }
      if (f.contents.value == "") {
         alert("제목을 입력하시기 바랍니다.");
         f.title.focus();
         return false;
      }
      if (f.calBytes(f.contents.value) > 4000) {
         alert("최대 4000Bytes까지 입력 가능합니다.");
         f.contents.focus();
         return false;
      }
   }

   function calBytes(str) {

      var tcount = 0;
      var tmpStr = new String(str);
      var strCnt = tmpStr.length;

      var onechar;
      for (i = 0; i < strCnt; i++) {
         onechar = tmpStr.charAt(i);

         if (escape(onechar).lengt > 4) {
            tcount += 2;

         } else {
            tcount += 1;
         }
      }
      return tcount;
   }
   function doInfo(seq){
	    location.href="/notice/NoticeInfo.do?notice_seq="+ seq;
	}
   function doList(){
	    location.href="/notice/NoticeList.do";
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
<form name="f" method="post" action="/notice/NoticeUpdate.do" onsubmit="return doSubmit(this);">
      <input type="hidden" name="notice_seq"
         value="<%=CmmUtil.nvl(request.getParameter("notice_seq"))%>" />
      <table border="0" width="100%">
         <tr>
            <td align="center" width="120px"><img src="../img/tit.png"/></td>
            <td><input type="text" name="title" maxlength="35"
               value="<%=CmmUtil.nvl(rDTO.getTitle()) %>" style="width: 425px" /></td>
         </tr>
            <tr>
               <td colspan="2">
               <hr>
               </td>
               </tr>
               <tr>
               <td>
               <br>
               <img src="../img/writes.png"/>
               </td>
               </tr>
               <tr>
               <td colspan="2">
               <hr>
               </td>
               </tr>
         <tr>
            <td colspan="2">
            <textarea name="contents" style="width: 515px; height: 600px"><%=CmmUtil.nvl(rDTO.getContents())%></textarea>
            </td>
         </tr>
                  <tr>
            <td align="right" colspan="2"><hr>
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" "/>
            </td>
         </tr>
         <tr>
            <td align="center" colspan="2">
            <input type="submit" class="img-button" value=" " />
            <input type="button" class="img-button2" onclick="javascript:doInfo('<%=CmmUtil.nvl(rDTO.getnotice_seq())%>');" value=" "/></td>
         </tr>
      </table>
   </form>
</body>
</html>