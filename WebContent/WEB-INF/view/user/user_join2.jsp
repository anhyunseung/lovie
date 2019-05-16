<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="poly.util.CmmUtil"%>
        <%
        session.setAttribute("url", "/user/user_join2.do");
	request.setCharacterEncoding("UTF-8");
        String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
        String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
        System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
        System.out.println("ss_user_id : " + SESSION_USER_ID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/user/user_join2.do/../../img/common/icon.ico" type="image/x-icon" />
<title>회원가입 : Lovie</title>
<script type="text/javascript">
<%if(SESSION_USER_ID.isEmpty()){%>
<%}else{%>
alert("잘못된 접근입니다.");
top.location.href="/top.do";
<%}%>
function doSubmit2(f) {
	   if(f.user_id.value == ""){
	      alert("아이디 또는 비밀번호를 입력해주세요.");
	      f.user_id.focus();
	      return false;
	   }
	   if(f.pwd1.value == ""){
	      alert("아이디 또는 비밀번호를 입력해주세요.");
	      f.pwd1.focus();
	      return false;
	   }
	}
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
}
function doSubmit2(f) {
	   if(f.user_id.value == ""){
	      alert("아이디 또는 비밀번호를 입력해주세요.");
	      f.user_id.focus();
	      return false;
	   }
	   if(f.pwd1.value == ""){
	      alert("아이디 또는 비밀번호를 입력해주세요.");
	      f.pwd1.focus();
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
a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover { text-decoration: none;}
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
      input.login {
        background: url( "../img/button/login.png" ) no-repeat;
        border: none;
        height: 45px;
        width: 58px;
        cursor: pointer;
      }
      div.infot
	{
	background-image:url('../img/bg/infot.png');
	}
	div.framebgm
	{
	background-image:url('../img/bg/framebgm.png');
	}
	div.framebgm
	{
	background-image:url('../img/bg/framebgm.png');
	}
	div.framebgd
	{
	background-image:url('../img/bg/framebgd.png');
}
</style>
</head>
<body background="../img/top/bg.png">
<font face='Segoe UI' style=' line-height:1.4'>
<div>
	<table border="0" height="500px" width="1800px" >
	<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit2(this);">
		<tr>
			<td width="48px" height="167px"></td>
			<td colspan="4" align="left" width="1500px">
			
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
				href="/newmovie/newmovieList.do" target="ifrMain"> 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/upmovie/upmovieList.do" target="ifrMain"> 
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
				<span style=" font: 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" target="ifrMain"> 
				<span style=" font: 1.5em Georgia, serif ;">
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
			</form>
		<tr>
			<td></td>
			<td></td>
			<td>
				<h1>
					<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
				</h1>
			</td>
			<td valign="top" width="1184px">
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
<form action="/user/user_join3.do" method="post" name="f" onsubmit="return doSubmit(this);">
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
</td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</font>
</body>
</html>