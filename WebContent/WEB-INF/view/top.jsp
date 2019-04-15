<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("euc-kr");
 
	String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
	System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	System.out.println("ss_user_id : " + SESSION_USER_ID);
	
	String targetDt = request.getParameter("targetDt")==null?"20120101":request.getParameter("targetDt");
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
	String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
	String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Let's see the movie! : Lovie</title>
<script type="text/javascript">
function doSubmit(f) {
   if(f.user_id.value == ""){
      alert("비밀번호 또는 아이디를 입력해주세요.");
      f.user_id.focus();
      return false;
   }
   if(f.pwd1.value == ""){
      alert("비밀번호 또는 아이디를 입력해주세요.");
      f.pwd1.focus();
      return false;
   }
}
function doId(){
    location.href="/user/user_login_proc.do";
}
function doKeyIdPw(event) {
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.KeyCode;
	   
	   if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || (keyID >= 65 && keyID <= 90) || keyID==8 || keyID==37 || keyID==39 || keyID==9){
	      return true;
	   }else{
	      return false;
	   }
	}

</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/button/login.png" ) no-repeat;
        border: none;
        height: 45px;
        width: 58px;
        cursor: pointer;
      }
</style>

</head>
<body background="../img/top/bg.png">
<div>
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
	<table border="0" height="3000px" width="1500px" >
		<tr>
			<td width="48px" height="167px"><br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br></td>
			<td colspan="4" align="right" width="1500px">
			<img src="../img/bg/top.png" />
			<br>
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
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
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
			<img src="../img/top/id.png"/> &nbsp;
			
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
			 <td width="100px">
			<%if (SESSION_USER_ID.equals("")) {%>	 
			<input type="submit" class="img-button" value=" "/>
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
					<b> &nbsp;&nbsp;&nbsp; </b>
				</h1>
			</td>
			<td><iframe name="ifrMain" src="" frameborder="0" width="1200px"
					height="100%" scrolling="auto">
					
					
					</iframe></td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>
