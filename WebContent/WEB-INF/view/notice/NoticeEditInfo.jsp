<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.NoticeDTO" %>
<%
session.setAttribute("url", "/notice/NoticeEditInfo.do");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 : Lovie</title>
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
      input {
        vertical-align: middle;
      }input.login {
        background: url( "../img/button/login.png" ) no-repeat;
        border: none;
        height: 45px;
        width: 58px;
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
<body background="../img/top/bg.png" onload="doOnload();">
<div>
	<table border="0" height="500px" width="1800px" >
		<tr>
			<td width="48px" height="167px"></td>
			<td colspan="4" align="right" width="1500px">
			
			<a href="/top.do">
				<img src="../img/common/Logo.png"/>
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/notice/NoticeList.do"
				target="ifrMain">
				<img src="../img/top/notice.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/inquiry/inquiryList.do" target="ifrMain"> 
				<img src="../img/top/inq.png"/>
			</a>
			<br>
			</td>
		</tr>
		<tr>
			<td height="50px">
				<img src="../img/bg/rp.png"/>
			</td>
			<td align="right" valign="top" width="180">
				<%if (SESSION_USER_ID.equals("")) {%>		
			<img src="../img/top/Id.png"/> &nbsp;
			
			 <input type="text" name="user_id" maxlength="20"
				style="width: 110px;" onkeydown="return doKeyIdPw(event)"/>
				
				<br>
				
				<img src="../img/top/pw.png"/>&nbsp;
			<input type="password" name="pwd1" maxlength="20" style="width:110px;" onkeydown="return doKeyIdPw(event)"/>	
				<br>
				<% } else if(SESSION_USER_ID.equals("admin")) { %> 
				<a href="/user/manageList.do" target="ifrMain"> 
				<span style=" font: italic 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" target="ifrMain"> 
				<span style=" font: italic 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
			 			 <%}%>
			 			 </td>
			 <td width="120px">
			<%if (SESSION_USER_ID.equals("")) {%>	 
			<input type="submit" class="login" value=" "/>
			<%}else{ %>
			<img src="../img/top/loginss.png"/>
			<%} %>
			</td>
			<td>
			</td>
			</tr>
			<tr>
			<td height="25px">
			</td>
			<%if (SESSION_USER_ID.equals("")) {%>
			<td colspan="2" align="left" width="245px" >
						&nbsp;
				<a href="/user/user_join2.do" target="ifrMain">
				<img src="../img/top/join.png"/>
				</a>
				<a href="/user/user_id_search.do" onClick="window.open('/user/user_id_search.do','아이디 찾기','width=470, height=226, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
				<img src="../img/user/userjoin/idf.png"/>
				</a>
				<a href="/user/user_pw_search.do" onClick="window.open('/user/user_pw_search.do','비밀번호 찾기','width=470, height=366, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
				<img src="../img/top/pwf.png"/>
				</a> 
				<% } else { %> 
				<td colspan="2" align="center" width="245px" >
				<a href="/user/user_logout.do" >
			 <img src="../img/top/logout.png"/>
			 </a>
			 			 &nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;
			 <%}%>
				</td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>
				<h1>
					<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
				</h1>
			</td>
			<td valign="top" width="1184px">
			
			
<form name="f" method="post" action="/notice/NoticeUpdate.do" onsubmit="return doSubmit(this);">
      <input type="hidden" name="notice_seq"
         value="<%=CmmUtil.nvl(request.getParameter("notice_seq"))%>" />
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
            <textarea name="contents" style="width:1120px; height: 600px"><%=CmmUtil.nvl(rDTO.getContents())%></textarea>
            </td>
         </tr>
                  <tr>
            <td align="right" colspan="2"><hr>
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" "/>
            &nbsp;&nbsp;</td>
         </tr>
         <tr>
            <td align="center" colspan="2">
            <input type="submit" class="img-button" value=" " />
            <input type="button" class="img-button2" onclick="javascript:doInfo('<%=CmmUtil.nvl(rDTO.getnotice_seq())%>');" value=" "/></td>
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
   </td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</body>
</html>