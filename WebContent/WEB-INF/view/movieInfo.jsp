<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URL" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Random" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("url", "/movieInfo.do?moviecode="+CmmUtil.nvl((String) session.getAttribute("moviecodeI")));
	String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
	String imgsrc = (String)request.getAttribute("imgI");
	String moviename = (String)request.getAttribute("nameI");
	String story = (String)request.getAttribute("storyI");
	String genre = (String)request.getAttribute("genreI");
	String videoL1=(String)request.getAttribute("videoL1");
	String videoL2=(String)request.getAttribute("videoL2");
	String videoL3=(String)request.getAttribute("videoL3");
	System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	System.out.println("ss_user_id : " + SESSION_USER_ID);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/movieInfo.do/../img/common/icon.ico" type="image/x-icon" />
<title><%=moviename %> - 영화소개 : Lovie</title>
<script type="text/javascript">
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
 a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover { text-decoration: none;}
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
      img.poster{
      border:10px solid #663300;
      }
      div.infot{
      background-image: url('../img/bg/infot.png');
      }
      div.framebgm{
		background-image:url('../img/bg/framebgm.png');
		}
      div.framebgd{
		background-image:url('../img/bg/framebgd.png');
		}
</style>

</head>
<body background="../img/top/bg.png">
<div>
<font face='Segoe UI' style=' line-height:1.4'>
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
	<table border="0" height="500px" width="1800px">
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
				>
				<img src="../img/top/notice.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			
			<a
				href="/newmovie/newmovieList.do" > 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/upmovie/upmovieList.do" > 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" > 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/inquiry/inquiryList.do" > 
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
				<a href="/user/manageList.do" > 
				<span style=" font: 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" > 
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
				<a href="/user/user_join2.do" >
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
			
			<div class="infot">
				<table>
					<tr>
						<td>
						<br>
						</td>
					</tr>
				</table>
			</div>
			<div class="framebgm">
				<table  border="0" width="100%">
					<tr>
					<td width="10px"></td>
						<td width="40%" align="center" valign="middle" rowspan="3">
					<img src="<%=imgsrc %>" border="2px" class="poster">
						</td>
						<td>
					<h1>
						<b>
						<%=moviename %>
						</b>
					</h1>
					<hr/>
						</td>
						<td width="10px"></td>
					</tr>
					<tr>
					<td width="10px"></td>
						<td valign="top">
					<img src="../img/total/genre.png"/>
					<%=genre %>
						</td>
						<td width="10px"></td>
					</tr>
					<tr>
					<td width="10px"></td>
						<td>
					<br/>
					<img src="../img/total/story.png"/>
					<br/>
					<font face='Segoe UI' style='letter-spacing:2px; line-height:1.4'>
					<%=story.replaceAll("\\. ",".<br/>") %>
					</font>
						</td>
						<td width="10px"></td>
					</tr>
					<tr>
					<td width="10px"></td>
						<td colspan="2">
						<br/>
						<hr/>
						&nbsp;
						<img src="../img/total/video.png">
						</td>
						<td width="10px"></td>
					</tr>
					<tr>
					<td width="10px"></td>
						<td align="center" colspan="2">
							<iframe name="vedio1" width="300" height="200" src="https://www.youtube.com/embed/<%=videoL1 %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<iframe name="vedio2" width="300" height="200" src="https://www.youtube.com/embed/<%=videoL2 %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<iframe name="vedio3" width="300" height="200" src="https://www.youtube.com/embed/<%=videoL3 %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</td>
						<td width="10px"></td>
					</tr>
					<tr>
					<td width="10px"></td>
						<td>
							<br/>
							&nbsp;
							<a href="#" onClick="window.open('<%="https://www.youtube.com/results?search_query="+moviename %>');">
							<span style=" color: black;">
							<b>
							유튜브로 해당영화 검색
							</b>
							</span>
							</a>
						</td>
						<td width="10px"></td>
					</tr>
				</table>
			</div>
			<div class="framebgd">
				<table height="27px">
				<tr>
					<td colspan="3">
					</td>
				</tr>
				</table>
			</div>
			
			</td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
	</form>
	</font>
</div>
</body>
</html>
