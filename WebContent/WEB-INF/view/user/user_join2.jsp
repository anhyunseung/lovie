<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="poly.util.CmmUtil"%>
        <%
        session.setAttribute("url", "/user/user_join2.do");
        String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
        System.out.println("ss_user_id : " + SESSION_USER_ID);
        String url=CmmUtil.nvl((String)session.getAttribute("url"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/user/user_join2.do/../../img/common/icon.ico" type="image/x-icon" />
<title>회원가입 : Lovie</title>
<script type="text/javascript">
function doOnload(){
	   var user_id = "<%=SESSION_USER_ID%>";
	   
	   if (user_id!=""){
		      alert("잘못된 접근입니다.");
	      location.href="<%=url%>";
	      
	   }
	   
	}
	
function doTop(){
    top.location.href="/top.do";
}

function doSubmit(f) {
   if(f.user_id.value.length >= 10){
      alert("아이디가 10자를 초과했습니다.");
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
function doTop(){
    top.location.href="/top.do";
}
</script>
<style>
html, body {
	margin: 0;
	height: 100%;min-height: 1500px;
	word-break:break-all;
}

a.line:hover {
	color: black;
	text-decoration: underline;
}

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a.tag {
	color: #6b7177;
}

a.tag:hover {
	color: black;
	text-decoration: underline;
}

body {
	margin: 0;
}

.navbar {
	background-image: url("../img/common/headerbg.png");
	margin: 0;
	padding: 0;
	position: fixed;
	width: 30000px;
	z-index: 2;
}

.navbar>li {
	display: inline-block;
}

img.logo {
	position: relative;
	top: 10px
}

.navbar>li>a {
	display: block;
	text-decoration: none;
	padding: 0px 20px;
}

.navbar>li>a#nologo {
	display: block;
	text-decoration: none;
	padding: 20px 40px;
	color: gray;
}

.navbar>li>a#nologo:hover {
	color: #ffffff;
}

div.login {
	position: fixed;
	right: 0%;
	z-index: 3;
}

div.blank {
	width: 100%;
	height: 64px;
	border-color: black;
}
/* 여기까지 상단  */

</style>
</head>
<body onload="doOnload();" style="min-width: 500px; background-color: #f3f3f3;">
<form action="/user/user_join3.do" method="post" name="f" onsubmit="return doSubmit(this);">
		<font face='Malgun Gothic' style='line-height: 1.4' />
		<ul class="navbar">
		<li><a href="/top.do"> <img class="logo"
				src="../img/common/Logo.png" />
		</a></li>
		<li><a id="nologo" href="/notice/NoticeList.do">공지사항</a></li>
		<li><a id="nologo" href="/newmovie/newmovieList.do">최신영화</a></li>
		<li><a id="nologo" href="/upmovie/upmovieList.do">추천영화</a></li>
		<li><a id="nologo" href="/bbm/bbmList.do">자유게시판</a></li>
		<li><a id="nologo" href="/inquiry/inquiryList.do">문의</a></li>
	</ul>
	<div class="login">
		<%
			if (SESSION_USER_ID.equals("")) {
		%>
		<a href="/user/user_login.do"><img src="../img/top/uplogin.png"
			onmouseover="this.src='../img/top/uplogin2.png'"
			onmouseout="this.src='../img/top/uplogin.png'"></a>
		<%
			} else {
		%>
		<a href="/user/user_logout.do"><img src="../img/top/uplogout.png"
			onmouseover="this.src='../img/top/uplogout2.png'"
			onmouseout="this.src='../img/top/uplogout.png'"></a>
		<%
			}
		%>
	</div>
<div class="infot">
<table border="0" width="100%">
<tr>
<td align="center">
<h1>&nbsp;&nbsp;&nbsp;  
  회원가입
   </h1>
   </td>
</tr>
</table>
</div>
<div class=framebgm>
   <table width="100%" border="0">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="right" width="45%"><br><img src="../img/user/userjoin/name.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td><br><input type="text" name="user_name" disabled="disabled" maxlength="10" style="width:200px;"/></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="right" width="45%"><br><img src="../img/top/Id.png"/>&nbsp;&nbsp;&nbsp;</td>
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
         <td align="right" width="45%"><br><img src="../img/top/pw.png"/>&nbsp;&nbsp;&nbsp;</td>
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
      <td align="right" width="45%"><br><img src="../img/user/userjoin/pwc.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td><br><input type="password" name="pwd2"  disabled="disabled" maxlength="20" style="width:200px;"/></td>
      </tr>      
      <tr>
         <td align="right" width="45%"><br><br><img src="../img/user/userjoin/email.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td colspan="2">
         <br><br>
            <input type="text" name="email1" maxlength="16" style="width:100px;" disabled="disabled"/>&nbsp;<b>@</b>
             <input type="text" name="email2" maxlength="16" style="width:100px;" value="선택하세요" disabled="disabled"/>
         </td>
      </tr>
      <tr>
      <td align="right" width="45%"><br><br><img src="../img/user/userjoin/phone.png"/>&nbsp;&nbsp;&nbsp;</td>
      <td><br><br>
         <input type="text" name="tel_1" maxlength="4" disabled="disabled" style="width:50px" />&nbsp;<b>-</b>
         <input type="text" name="tel_2" maxlength="4" disabled="disabled" style="width:80px" />&nbsp;<b>-</b>
         <input type="text" name="tel_3" maxlength="4"  disabled="disabled" style="width:80px" />
      </td>
   </tr>   
   <tr>
         <td align="right" width="45%"><br><br><img src="../img/user/userjoin/birth.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td><br><br>
         <input type="text" name="birthday" disabled="disabled" maxlength="6" style="width:200px;"/>
         </td>
      </tr>         
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
            <input type="button" class="img-button2" onclick="javascript:doTop();" value=" "/>
         </td>
      </tr>
   </table>
   </div>
      <div class="framebgd">
   			<table height="27px">
   <tr>
   <td>
   </td>
   </tr>
   </table>
   </div>
</form>
</body>
</html>