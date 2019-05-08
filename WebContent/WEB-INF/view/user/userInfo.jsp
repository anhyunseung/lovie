<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
session.setAttribute("url", "/user/userInfo.do");
UserDTO rDTO = (UserDTO)request.getAttribute("rDTO");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);

//공지글 정보를 못불러왔다면, 객체 생성
if (rDTO==null){
 rDTO = new UserDTO();

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보 : Lovie</title>
<script type="text/javascript">
<%if(SESSION_USER_ID.isEmpty()){%>
alert("잘못된 접근입니다.");
top.location.href="/top.do";
<%}%>
<%if(CmmUtil.nvl(rDTO.getUser_id()).equals(SESSION_USER_ID)){
}else{%>
alert("잘못된 접근입니다.");
top.location.href="/top.do";
<%}%>
function doSubmit(f) {
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
function doEdit(){
    location.href="/user/userEditInfo.do?user_no=<%=CmmUtil.nvl(rDTO.getUser_no())%>";
}
function doTop(){
    top.location.href="/top.do";
}

function doDelete(){
    if(confirm("정말로 탈퇴하시겠습니까?")){
       location.href="/user/userDelete.do?user_no=<%=CmmUtil.nvl(rDTO.getUser_no())%>";
 }
}

function doDetail(no){
	   location.href="/user/userInfo.do?user_no="+ no;
	}
</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/button/out.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/button/rewri.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button3 {
        background: url( "../img/button/sign.png" ) no-repeat;
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
      div.framebgt
	{
	background-image:url('../img/bg/framebgt.png');
	}
	div.framebgm
	{
	background-image:url('../img/bg/framebgm.png');
	}
	div.framebgm1
	{
	background-image:url('../img/bg/framebgm1.png');
	}
	div.framebgd
	{
	background-image:url('../img/bg/framebgd.png');
}
</style>
</head>
<body background="../img/top/bg.png">
<div>
	<table border="0" height="1510px" width="1800px" >
	<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
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
<div class="framebgt">
<table border="0" width="100%">
<tr>
<td align="center">
<br>
<img src="../img/user/usert.png" />
</td>
</tr>
</table>
</div>
<div class=framebgm1>
<table>
<tr>
<td>
<br><br>
</td>
</tr>
</table>
</div>
<div class=framebgm>
   <table width="100%">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="right" width="45%"><br><img src="../img/user/userjoin/name.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td><br><%=CmmUtil.nvl(rDTO.getUser_name())%></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="right" width="45%"><br><img src="../img/top/Id.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td><br><%=CmmUtil.nvl(rDTO.getUser_id())%>
         </td>
      </tr>
      <tr>
      <td colspan="2"> <br>
      </td>
      </tr>    
      <tr>
         <td align="right" width="45%"><br><img src="../img/user/userjoin/email.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td colspan="2">
         <br>
            <%=CmmUtil.nvl(rDTO.getEmail1())%>&nbsp;<b>@</b>
            <%=CmmUtil.nvl(rDTO.getEmail2())%>
         </td>
      </tr>
      <tr>
      <td align="right" width="45%"><br><br><img src="../img/user/userjoin/phone.png"/>&nbsp;&nbsp;&nbsp;</td>
      <td><br><br>
         <%=CmmUtil.nvl(rDTO.getTel_1())%>&nbsp;<b>-</b>
         <%=CmmUtil.nvl(rDTO.getTel_2())%>&nbsp;<b>-</b>
         <%=CmmUtil.nvl(rDTO.getTel_3())%>
      </td>
   </tr>   
   <tr>
         <td align="right" width="45%"><br><br><img src="../img/user/userjoin/birth.png"/>&nbsp;&nbsp;&nbsp;</td>
         <td><br><br>
         <%=CmmUtil.nvl(rDTO.getBirthday())%>
         </td>
      </tr>       
      </table>
      </div>
      <div class="framebgm">
      <table width=100%>  
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
            <a href="javascript:doDelete();">
            <input type="button" class="img-button" value=" " /></a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="javascript:doEdit();">
            <input type="button" class="img-button2" value=" " /></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:doTop();">
            <input type="button" class="img-button3" value=" "/>
            </a>
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
   </td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</body>
</html>