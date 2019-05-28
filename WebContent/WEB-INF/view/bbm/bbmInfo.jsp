<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.BBMDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.Comment_bbmDTO"%>
<%@page import="java.util.List"%>
<%
	String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
	System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	System.out.println("ss_user_id : " + SESSION_USER_ID);
	BBMDTO rDTO = (BBMDTO) request.getAttribute("rDTO");
	int count2 = (int) request.getAttribute("count2");

	if (rDTO == null) {
		rDTO = new BBMDTO();

	}

	session.setAttribute("url", "/bbm/bbmInfo.do?bbm_seq=" + CmmUtil.nvl(rDTO.getbbm_seq()));
	String bbm_seq = rDTO.getbbm_seq();

	List<Comment_bbmDTO> clist = rDTO.getClist();
	if (clist == null) {

		clist = new ArrayList<Comment_bbmDTO>();
	}
	String ss_user_id = CmmUtil.nvl((String) session.getAttribute("USER_ID"));

	//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
	int edit = 1;

	//로그인 안했다면....
	if (ss_user_id.equals("")) {
		edit = 3;

		//본인이 작성한 글이면 2가 되도록 변경
	} else if (ss_user_id.equals(CmmUtil.nvl(rDTO.getUser_id()))) {
		edit = 2;

	}

	System.out.println("user_id : " + CmmUtil.nvl(rDTO.getUser_id()));
	System.out.println("ss_user_id : " + ss_user_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="http://localhost:8080/bbm/bbmInfo.do/../../img/common/icon.ico"
	type="image/x-icon" />
<title><%=CmmUtil.nvl(rDTO.getTitle())%> - 자유게시판 : Lovie</title>
<script type="text/javascript">

function doEdit(){
 if ("<%=edit%>"==2 ){
    
    location.href="/bbm/bbmEditInfo.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
 
 }else if ("<%=edit%>"==3){
    alert("로그인 하시길 바랍니다.");
    top.location.href="/user/user_login.do";
    
    
 }else{
    alert("본인이 작성한 글만 수정 가능합니다.")
 }
}

function doDelete(){
 if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="admin"){
    if(confirm("정말로 삭제하시겠습니까?")){
       location.href="/bbm/bbmDelete.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
 			}
 		}else if ("<%=edit%>" == 3) {
				alert("로그인 하시길 바랍니다.");
				location.href = "/user/user_login.do";
		} else {
			alert("본인이 작성한 글만 삭제 가능합니다.")
		}
	}

	function doSubmit2(f) {
		if (f.comment.value == "") {
			alert("댓글내용을 입력해주세요.");
			f.comment.focus();
			return false;
		}
	}
	function doEdit2(seq) {
		location.href = "/bbm/bbmInfo2.do?com_seq=" + seq;
	}

	function doDelete2(seq) {
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href = "/bbm/commentdelete.do?com_seq=" + seq;
		 		}
	}

	function doList() {
		location.href = "/bbm/bbmList.do";
	}
</script>
<style>
html, body {
	margin: 0;
	height: 100%;min-height: 1450px;
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
div.leftmenu {
	background-color: rgba(184, 184, 184, 0.9);
	width: 27%;
	height: 100%;
	box-shadow: 2px 2px 3px 0 rgba(100, 100, 100, 0.6);
	min-width: 337px;
	float: left;
}

div.leftmenu2 {
	margin: 0;
	padding: 100px 0 162px 0;
	width: 300px;
	background-image: url("../img/total/listbg.jpg");
	height: 600px;
	background-repeat: no-repeat;
}

div.loginmenu {
	margin: 0 30px 100px 0px;
	padding: 0 0;
	width: 270px;
	height: 160px;
	background-color: rgba(255, 255, 255);
	box-shadow: 2px 0 3px 0 rgba(100, 100, 100, 0.6);
}

a.user {
	color: gray;
}

a.user:hover {
	color: #494949;
	text-decoration: none;
}

div.listmenu {
	margin: 0 0;
	padding: 0 0;
	width: 270px;
	height: 285px;
}
/* 여기까지 왼쪽 정렬  */
div.rightmenu {
	position: relative;
	top: 0px;
	margin: 0px 0px 0px 0px;
	background-color: #f3f3f3;
	width: 72.3%;
	height: 100%;
	float: right;
}

div.writemenu {
	margin: 162px 0 162px 160px;
	padding: 10px 10px;
	background-color: rgba(255, 255, 255);
	width: 700px;
	box-shadow: 1px 1px 2px 0 rgba(100, 100, 100, 0.6);
}

div.tableborder {
	border: 1px solid #dddddd;
}

div.tableup {
	background-color: #eeeeee;
	padding: 8px 8px;
	border-bottom: 1px solid #dddddd;
}

div.tableup>div {
	display: inline-block;
}

div.tableleft {
	width: 49.5%;
}

div.tableright {
	width: 49.5%;
}

div.tablemiddle {
	padding: 50px 10px;
}

div.tabledown {
	margin: 0 20px 20px 20px;
	padding: 10px 10px;
	box-shadow: 0 0 3px 0 rgba(100, 100, 100, 0.4);
}

@import url("https://fonts.googleapis.com/css?family=Lato:100,300,400");

@import url("https://fonts.googleapis.com/css?family=Roboto:100");

.button-container-2 {
	position: relative;
	width: 100px;
	height: 50px;
	overflow: hidden;
	border: 1px solid #777;
	font-family: 'Lato', sans-serif;
	font-weight: 300;
	transition: 0.5s;
	letter-spacing: 1px;
}

.button-container-2 button {
	width: 101%;
	height: 100%;
	font-family: 'Lato', sans-serif;
	font-weight: 300;
	font-size: 20px;
	letter-spacing: 1px;
	background: #777;
	-webkit-mask:
		url("https://raw.githubusercontent.com/robin-dela/css-mask-animation/master/img/urban-sprite.png");
	mask:
		url("https://raw.githubusercontent.com/robin-dela/css-mask-animation/master/img/urban-sprite.png");
	-webkit-mask-size: 3000% 100%;
	mask-size: 3000% 100%;
	border: none;
	color: #fff;
	cursor: pointer;
	-webkit-animation: ani2 0.7s steps(29) forwards;
	animation: ani2 0.7s steps(29) forwards;
}

.button-container-2 button:hover {
	-webkit-animation: ani 0.7s steps(29) forwards;
	animation: ani 0.7s steps(29) forwards;
}

.mas {
 position: absolute;
 color: #777;
 text-align: center;
 width: 101%;
 font-family: 'Lato', sans-serif;
 font-weight: 300;
 position: absolute;
 font-size: 20px;
 margin-top: 12px;
 overflow: hidden;
}

@-webkit-keyframes ani {
 from {
  -webkit-mask-position: 0 0;
  mask-position: 0 0;
 }

 to {
  -webkit-mask-position: 100% 0;
  mask-position: 100% 0;
 }
}

@keyframes ani {
 from {
  -webkit-mask-position: 0 0;
  mask-position: 0 0;
 }

 to {
  -webkit-mask-position: 100% 0;
  mask-position: 100% 0;
 }
}

@-webkit-keyframes ani2 {
 from {
  -webkit-mask-position: 100% 0;
  mask-position: 100% 0;
 }

 to {
  -webkit-mask-position: 0 0;
  mask-position: 0 0;
 }
}

@keyframes ani2 {
 from {
  -webkit-mask-position: 100% 0;
  mask-position: 100% 0;
 }

 to {
  -webkit-mask-position: 0 0;
  mask-position: 0 0;
 }
}
td.paging1>div>div {
	display: inline-block;
}

div.comaliggn>div {
	display: inline-block;
}

td.paging>div {
	display: inline-block;
}

div.linebox {
	width: 25px;
	height: 25px;
	background-color: #dddddd;
	vertical-align: bottom;
}

div.linebox2 {
	width: 25px;
	height: 25px;
	background-color: #white;
	vertical-align: bottom;
}

div.linebox3 {
	width: 25px;
	height: 25px;
	background-color: #111111;
	vertical-align: bottom;
}

a.linetag:hover {
	text-decoration: underline;
	color: white;
}

a.linetag2:hover {
	text-decoration: underline;
	color: #555555;
}
/* 여기까지 오른쪽 정렬  */
</style>
</head>
<body 
	style="min-width: 1250px; background-color: #f3f3f3;">
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
	<div class="blank"></div>
	<div style="height: 100%">
	<div align="right" class="leftmenu">
		<div class="leftmenu2">
			<div class="loginmenu">
				<table width="100%" height="100%">
					<%
						if (SESSION_USER_ID.equals("")) {
					%>
					<tr>
						<td colspan="3" valign="bottom" align="center" height="80px">
							<a href="/user/user_login.do"> <img
								src="../img/total/leftlogin.png"
								onmouseover="this.src='../img/total/leftlogin2.png'"
								onmouseout="this.src='../img/total/leftlogin.png'">
						</a>
						</td>
					</tr>
					<tr>
						<td width="3px"></td>
						<td valign="bottom"><hr /></td>
						<td width="3px"></td>
					</tr>
					<tr>
						<td colspan="3" height="40px" align="center">
							<div>
								<span style="padding: 10px 7px;"> <a class="tag"
									href="/user/user_join2.do"> <font face='Malgun Gothic'
										size="2px"> 회원가입 </font>
								</a>
								</span> <span style="padding: 10px 0px;"> <font
									face='Malgun Gothic' size="2px" style="color: #6b7177;">
										| </font>
								</span> <span style="padding: 10px 7px;"> <a class="tag"
									href="/user/user_id_search.do"
									onClick="window.open('/user/user_id_search.do','아이디 찾기','width=470, height=226, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
										<font face='Malgun Gothic' size="2px"> 아이디찾기 </font>
								</a>
								</span> <span style="padding: 10px 0px;"> <font
									face='Malgun Gothic' size="2px" style="color: #6b7177;">
										| </font>
								</span> <span style="padding: 10px 7px;"> <a class="tag"
									href="/user/user_pw_search.do"
									onClick="window.open('/user/user_pw_search.do','비밀번호 찾기','width=470, height=366, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
										<font face='Malgun Gothic' size="2px"> 비밀번호 찾기 </font>
								</a>
								</span>
							</div>
						</td>
					</tr>
					<%
						} else if (SESSION_USER_ID.equals("admin")) {
					%>
					<tr>
						<td colspan="3" valign="bottom" align="center" height="80px">
							<font face='Malgun Gothic' size="10px"> <a
								href="/user/manageList.do" class="user"> <%=SESSION_USER_ID%>
							</a>
						</font>
						</td>
					</tr>
					<tr>
						<td width="3px"></td>
						<td valign="bottom"><hr /></td>
						<td width="3px"></td>
					</tr>
					<tr>
						<td colspan="3" height="40px" align="center">
							<div>
								<span style="padding: 10px 7px;"> <a class="tag"
									href="/user/manageList.do"> <font face='Malgun Gothic'
										size="2px"> 회원관리 </font>
								</a>
								</span> <span style="padding: 10px 0px;"> <font
									face='Malgun Gothic' size="2px" style="color: #6b7177;">
										| </font>
								</span> <span style="padding: 10px 7px;"> <a class="tag"
									href="/user/userInfo"> <font face='Malgun Gothic'
										size="2px"> 내 정보 </font>
								</a>
								</span> <span style="padding: 10px 0px;"> <font
									face='Malgun Gothic' size="2px" style="color: #6b7177;">
										| </font>
								</span> <span style="padding: 10px 7px;"> <a class="tag"
									href="/user/user_logout.do"> <font face='Malgun Gothic'
										size="2px"> 로그아웃 </font>
								</a>
								</span>
							</div>
						</td>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td colspan="3" valign="bottom" align="center" height="80px">
							<font face='Malgun Gothic' size="10px"> <a
								href="/user/userInfo.do" class="user"> <%=SESSION_USER_ID%>
							</a>
						</font>
						</td>
					</tr>
					<tr>
						<td width="3px"></td>
						<td valign="bottom"><hr /></td>
						<td width="3px"></td>
					</tr>
					<tr>
						<td colspan="3" height="40px" align="center">
							<div>
								<span style="padding: 10px 7px;"> <a class="tag"
									href="/user/userInfo.do"> <font face='Malgun Gothic'
										size="2px"> 내 정보</font>
								</a>
								</span> <span style="padding: 10px 0px;"> <font
									face='Malgun Gothic' size="2px" style="color: #6b7177;">
										| </font>
								</span> <span style="padding: 10px 7px;"> <a class="tag"
									href="/user/user_logout.do"> <font face='Malgun Gothic'
										size="2px"> 로그아웃 </font>
								</a>
								</span>
							</div>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div class="listmenu">
				<font face='Malgun Gothic' size="6px"
					style="color: rgb(85, 85, 85, 0.7); margin: 0 10px 0 0;"> <b>게시판</b></font>
				<a href="/notice/NoticeList.do"> <img
					src="../img/total/listnotice.jpg"
					onmouseover="this.src='../img/total/listnotice2.jpg'"
					onmouseout="this.src='../img/total/listnotice.jpg'">
				</a> <a href="/newmovie/newmovieList.do"> <img
					src="../img/total/listnewmo.jpg"
					onmouseover="this.src='../img/total/listnewmo2.jpg'"
					onmouseout="this.src='../img/total/listnewmo.jpg'">
				</a> <a href="/upmovie/upmovieList.do"> <img
					src="../img/total/listupmo.jpg"
					onmouseover="this.src='../img/total/listupmo2.jpg'"
					onmouseout="this.src='../img/total/listupmo.jpg'">
				</a> <a href="/bbm/bbmList.do"> <img src="../img/total/listbbm2.jpg">
				</a> <a href="/inquiry/inquiryList.do"> <img
					src="../img/total/listinq.jpg"
					onmouseover="this.src='../img/total/listinq2.jpg'"
					onmouseout="this.src='../img/total/listinq.jpg'">
				</a>
			</div>
		</div>
	</div>
	<div class="rightmenu" align="left">
		<div class="writemenu">
			<table width="100%">
				<tr>
					<td><font face='Malgun Gothic' size="6px"
						style="color: #555555;"> <b>자유게시판</b>
					</font><br /> <br /></td>
					<td align="right" valign="bottom">
					<%
						if (edit == 2) {
					%> 
					<a
						style="cursor: pointer;"
						onclick="doEdit();"> <img
							src="../img/button/rewri.png"
							onmouseover="this.src='../img/button/rewri2.png'"
							onmouseout="this.src='../img/button/rewri.png'" />
					</a> 
					<%} if (edit == 2 || ss_user_id.equals("admin")) { %>
					<a style="cursor: pointer;"
						onclick="doDelete();"> <img
							src="../img/button/del.png"
							onmouseover="this.src='../img/button/del2.png'"
							onmouseout="this.src='../img/button/del.png'" />
					</a>
					<%} %>
					 <a href="bbmList.do"> <img src="../img/button/list.png"
							onmouseover="this.src='../img/button/list2.png'"
							onmouseout="this.src='../img/button/list.png'" />
					</a></td>
				</tr>
				<tr>
				</tr>
				<tr style="background-color: #dddddd;">
					<td colspan="2" height="1px"></td>
				</tr>
				<tr>
					<td height="5px" colspan="2"></td>
				</tr>
			</table>
			<div class="tableborder">
				<div class="tableup">
					<font size="4px"> <b><%=CmmUtil.nvl(rDTO.getTitle())%></b>
					</font> <br />
					<div class="tableleft">
						<font size="3px" color="#777777"> <%=CmmUtil.nvl(rDTO.getUser_id())%>
						</font>
					</div>
					<div class="tableright" align="right">
						<font size="2px" color="#777777"> <b>자유게시판</b> | <%
 	String date = CmmUtil.nvl(rDTO.getReg_dt());
						if(date.equals("")){}else{
							 %> <%=date.substring(0, 4)%>.<%=date.substring(5, 7)%>.<%=date.substring(8, 10)%>.
														<%=date.substring(11, 16)%>
														<%} %>
						</font>
					</div>
				</div>
				<div class="tablemiddle">
					<%
						String contenttest1 = CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>");
						String contenttest2 = contenttest1.replaceAll("& lt;", "<");
						String contenttest3 = contenttest2.replaceAll("& gt;", ">");
						String contenttest4 = contenttest3.replaceAll("& #40;", "(");
						String contenttest5 = contenttest4.replaceAll("& #41;", ")");
						String content = contenttest5;
						System.out.println(content);
					%>
					<%=content%>
				</div>
				<form action="/bbm/commentreg.do"
					onsubmit="return doSubmit2(this);" method="post">
					<div class="tabledown">
						<table width="100%">
							<tr>
								<td colspan="2"><font face='Malgun Gothic' size="4px"
									style="color: #555555;"> <b>댓글</b>
								</font> <%
 	int l = clist.size();
 	if (l != 0) {
 %> <span style="color: rgb(2, 151, 128); font-weight: bold;"> [<%=l%>]
								</span> <%
 	}
 %></td>
							</tr>
							<tr style="background-color: #dddddd;">
								<td colspan="2" height="1px"></td>
							</tr>
							<tr>
								<td valign="middle" height="100%" class="paging1">
									<div style="margin: 5px 0 0 0;">
										<div>
											<textarea name="comment"
												style="height: 46px; width: 516px; resize: none;"></textarea>
										</div>
										<input type="hidden" name="bbm_seq" value="<%=bbm_seq%>">
										<div class="button-container-2">
											<span class="mas"><b>등록</b></span>
											<button type="submit" name="Hover">
												<b>등록</b>
											</button>
										</div>
									</div>
								</td>
							</tr>
							<%
								int b = 9;
								int c = l / 10;
								int d = l - c * 10;
								int e = (clist.size() - 1) / 10;

								if (clist.size() > 10) {
									l = 10;
								}
								if (count2 == c) {
									l = d;
								}
								for (int i = 0; i < l; i++) {
									b--;
									Comment_bbmDTO a = clist.get(count2 * 10 + i);
							%>
							<tr style="background-color: #dddddd;">
								<td colspan="2"></td>
							</tr>
							<tr>
								<td colspan="2">

									<div style="margin: 7px 7px;">
										<div class="comaliggn" style="vertical-align: middle;">
											<div style="width: 65%; height: 27px">
												<b><%=CmmUtil.nvl(a.getUser_id()).replaceAll("\r\n", "<br/>")%>&nbsp;&nbsp;</b>
												<font size="2px" color="#777777"> <%
 	String comdate = CmmUtil.nvl(a.getReg_dt());
 %> <%=comdate.substring(0, 4)%>.<%=comdate.substring(5, 7)%>.<%=comdate.substring(8, 10)%>.
													<%=comdate.substring(11, 16)%>
												</font>
											</div>
											<div align="right"
												style="width: 34%; position: relative; top: 7px">
												<div>
												<%
												if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))){
												%>
													<a style="cursor: pointer;"
														onclick="doEdit2(<%=CmmUtil.nvl(a.getcom_seq())%>);">
														<img src="../img/button/rewri.png"
														onmouseover="this.src='../img/button/rewri2.png'"
														onmouseout="this.src='../img/button/rewri.png'" />
													</a>
													<%} 
												if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))||ss_user_id.equals("admin")){
													%>
													 <a style="cursor: pointer;"
														onclick="doDelete2(<%=CmmUtil.nvl(a.getcom_seq())%>);">
														<img src="../img/button/del.png"
														onmouseover="this.src='../img/button/del2.png'"
														onmouseout="this.src='../img/button/del.png'" />
													</a>
													<%} %>
												</div>
											</div>
										</div>
										<div style="margin: 4px 0;"></div>
										<%
											String commenttest1 = CmmUtil.nvl(a.getContents()).replaceAll("\r\n", "<br/>");
												String commenttest2 = commenttest1.replaceAll("& lt;", "<");
												String commenttest3 = commenttest1.replaceAll("& gt;", ">");
												String commenttest4 = commenttest3.replaceAll("& #40;", "(");
												String commenttest5 = commenttest4.replaceAll("& #41;", ")");
												String comment = commenttest5;
										%>
										<%=comment%>

									</div>
								</td>
							</tr>
							<%
								}
							%>
							<tr style="background-color: #dddddd;">
								<td colspan="2" height="1px"></td>
							</tr>
							<tr>
								<td class="paging" align="center" colspan="2" valign="bottom"
									height="30px">
									<%
										int line = 0;
										if (clist.size() >= 100 && clist.size() <= 999) {
											c = clist.size() / 100;
										} else if (clist.size() >= 1000 && clist.size() <= 9999) {
											c = clist.size() / 1000;
										} else if (clist.size() >= 10000 && clist.size() <= 99999) {
											c = clist.size() / 10000;
										} else {
											c = clist.size() / 10;
										}
										if (count2 / 10 == 0) {
											int q = 1;
											if (clist.size() > 100) {
												q = 10;
											} else {
												q = (clist.size() - 1) / 10 + 1;
											}
											count2 = count2 + 1;
											for (line = 1; line <= q; line++) {
									%> <%
 	if (count2 == line) {
 %>
									<div class="linebox" align="center">
										<a href="bbmInfo.do?count2=<%=line%>" class="linetag"> <span
											style="color: white;"> <b> <%=line%>
											</b>
										</span>
										</a>
									</div> <%
 	} else {
 %>
									<div class="linebox2" align="center">
										<a href="bbmInfo.do?count2=<%=line%>" class="linetag2">
											<span style="color: #555555;"> <b> <%=line%>
											</b>
										</span>
										</a>
									</div> <%
 	}
 %> <%
 	}
 		if (clist.size() > 100) {
 %><div class="linebox3" align="center">
										<a href="bbmInfo.do?count2=<%=11%>" class="linetag3"> <span
											style="color: #555555;"> <b> > </b>
										</span>
										</a>
									</div> <%
 	}
 	} else if (count2 / 10 == c) {
 		int color = count2 + 1;
 %>
									<div class="linebox3" align="center">
										<a href="bbmInfo.do?count2=<%=count2 / 10 * 10 - 9%>"
											class="linetag3"> <span style="color: #999999;"> <b>
													< </b>
										</span>
										</a>
									</div> <%
 	for (line = count2 / 10 * 10 + 1; line <= e + 1; line++) {
 %> <%
 	if (color == line) {
 %>
									<div class="linebox" align="center">
										<a href="bbmInfo.do?count2=<%=line%>" class="linetag"> <span
											style="color: white;"> <b> <%=line%>
											</b>
										</span>
										</a>
									</div> <%
 	} else {
 %><div class="linebox2" align="center">
										<a href="bbmInfo.do?count2=<%=line%>" class="linetag2">
											<span style="color: #555555;"> <b> <%=line%>
											</b>
										</span>
										</a>
									</div> <%
 	}
 %> <%
 	}
 %> <%
 	} else {
 		int color = count2 + 1;
 %>
									<div class="linebox3" align="center">
										<a href="bbmInfo.do?count2=<%=count2 / 10 * 10 - 9%>"
											class="linetag3"> <span style="color: #999999;"> <b>
													< </b>
										</span>
										</a>
									</div> <%
 	for (line = count2 / 10 * 10 + 1; line <= count2 / 10 * 10 + 10; line++) {
 %> <%
 	if (color == line) {
 %><div class="linebox" align="center">
										<a href="bbmInfo.do?count2=<%=line%>" class="linetag"> <span
											style="color: white;"> <b> <%=line%>
											</b>
										</span>
										</a>
									</div> <%
 	} else {
 %><div class="linebox2" align="center">
										<a href="bbmInfo.do?count2=<%=line%>" class="linetag2">
											<span style="color: #555555;"> <b> <%=line%>
											</b>
										</span>
										</a>
									</div> <%
 	}
 %> <%
 	}
 %>
									<div class="linebox3" align="center">
										<a href="bbmInfo.do?count2=<%=count2 / 10 * 10 + 11%>"
											class="linetag3"> <span style="color: #999999;"> <b>
													> </b>
										</span>
										</a>
									</div> <%
 	}
 %>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
