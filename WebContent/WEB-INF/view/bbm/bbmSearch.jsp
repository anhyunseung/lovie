<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.BBMDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
request.setCharacterEncoding("UTF-8");
session.setAttribute("url", "/bbm/bbmList.do");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);
String find=CmmUtil.nvl((String) request.getAttribute("find"));

List<BBMDTO> rList = (List<BBMDTO>)request.getAttribute("rList");
int count2 = (int)request.getAttribute("count");
System.out.print(count2);

if (rList==null){
   rList = new ArrayList<BBMDTO>();
   
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/bbm/bbmList.do/../../img/common/icon.ico" type="image/x-icon" />
<title>자유게시판 : Lovie</title>
<script type="text/javascript">
	function doDetail(seq) {
		location.href = "/bbm/bbmInfo.do?bbm_seq=" + seq;
	}
</script>
<style>
html, body {
	margin: 0;
	height: 100%;
	min-height: 1500px;
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
	float: left;
	min-width: 337px;
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
div.writemenu>div>div{
	display:inline-block;
}

div.paging>div {
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
	<div style="height: 100%;">
		<div align="right" class="leftmenu">
			<div class="leftmenu2">
				<div class="loginmenu">
					<div align="center" style="position: relative; top:25px;">
						<%if(SESSION_USER_ID.equals("")){ %>
						<a
								href="/user/user_login.do"> <img
									src="../img/total/leftlogin.png"
									onmouseover="this.src='../img/total/leftlogin2.png'"
									onmouseout="this.src='../img/total/leftlogin.png'">
							</a><div style="width:260px;height: 1px; background-color: #888888;
						position: relative; top:25px;"></div>
							<div style="position: relative; top:35px;">
									<span style="padding: 10px 7px;"> <a class="tag"
										href="/user/user_join.do"> <font face='Malgun Gothic'
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
						<%}else if(SESSION_USER_ID.equals("admin")){ %>
						<font face='Malgun Gothic' size="10px">
							<a
								href="/user/manageList.do" class="user">
								<%=SESSION_USER_ID %>
							</a>
							</font>
							<div style="width:260px;height: 1px; background-color: #888888;
						position: relative; top:25px;"></div>
							<div style="position: relative; top:35px;">
									<span style="padding: 10px 7px;"> <a class="tag"
										href="/user/manageList.do"> <font face='Malgun Gothic'
											size="2px"> 회원관리 </font>
									</a>
									</span> <span style="padding: 10px 0px;"> <font
										face='Malgun Gothic' size="2px" style="color: #6b7177;">
											| </font>
									</span> <span style="padding: 10px 7px;"> <a class="tag"
										href="/user/userInfo.do">
											<font face='Malgun Gothic' size="2px"> 내 정보 </font>
									</a>
									</span> <span style="padding: 10px 0px;"> <font
										face='Malgun Gothic' size="2px" style="color: #6b7177;">
											| </font>
									</span> <span style="padding: 10px 7px;"> <a class="tag"
										href="/user/user_logout.do">
											<font face='Malgun Gothic' size="2px"> 로그아웃 </font>
									</a>
									</span>
								</div>
						<%}else{ %>
						<font face='Malgun Gothic' size="10px">
							<a
								href="/user/userInfo.do" class="user">
								<%=SESSION_USER_ID %>
							</a>
							</font>
							<div style="width:260px;height: 1px; background-color: #888888;
						position: relative; top:25px;"></div>
							<div style="position: relative; top:35px;">
									<span style="padding: 10px 7px;"> <a class="tag"
										href="/user/userInfo.do">
											<font face='Malgun Gothic' size="2px"> 내 정보</font>
									</a>
									</span> <span style="padding: 10px 0px;"> <font
										face='Malgun Gothic' size="2px" style="color: #6b7177;">
											| </font>
									</span> <span style="padding: 10px 7px;"> <a class="tag"
										href="/user/user_logout.do">
											<font face='Malgun Gothic' size="2px"> 로그아웃 </font>
									</a>
									</span>
								</div>
						<%} %>
					</div>
				</div>
				<div class="listmenu">
					<font face='Malgun Gothic' size="6px"
						style="color: rgb(85,85,85,0.7); margin: 0 10px 0 0;"> <b>게시판</b></font> <a
						href="/notice/NoticeList.do"> <img
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
				<div><font face='Malgun Gothic' size="6px"
						style="color: #555555;"> <b>자유게시판</b>
					</font></div>
					<div style=" height: 25px;"></div>
					<div>
						<div align="center" style="width:80px;height:23px;background-color: #dddddd;
						padding: 3px 0 0 0;"><font face='Malgun Gothic'
							size="2px" style="color: #555555;"> <b>글
									번호</b>
						</font></div>
						<div align="center" style="width:323px;height:23px;background-color: #dddddd;
						padding: 3px 0 0 0;"><font face='Malgun Gothic' size="2px"
							style="color: #555555; "> <b>제목</b>
						</font></div>
						<div align="center" style="width:120px;height:23px;background-color: #dddddd;
						padding: 3px 0 0 0;"><font face='Malgun Gothic' size="2px"
							style="color: #555555; "> <b>작성자</b>
						</font ></div>
						<div align="center" style="width:160px;height:23px;background-color: #dddddd;
						padding: 3px 0 0 0;"><font face='Malgun Gothic' size="2px"
							style="color: #555555; "> <b>작성일</b>
						</font></div>
					</div>
					<%
						int a = rList.size();
						int b = 9;
						int c = a / 20;
						int d = a - c * 20;
						int e = (rList.size() - 1) / 20;

						if (rList.size() > 20) {
							a = 20;
						}
						if (count2 == c) {
							a = d;
						}
						for (int i = 0; i < a; i++) {
							b--;
							BBMDTO rDTO = rList.get(count2 * 20 + i);
							if (rDTO == null) {
								rDTO = new BBMDTO();
							}
					%>
					<div style="padding: 12px 0 0 0;">
						<div align="center"style="width:80px;height:34px;">
							<%
								out.print(CmmUtil.nvl(rDTO.getbbm_seq()));
							%> <input type="hidden" name="seq"
							value="<%=CmmUtil.nvl(rDTO.getbbm_seq())%>">
							</div>
							<div style="width:323px;height:30px;">&nbsp; <a
							href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getbbm_seq())%>');"
							class="line"> <span style="color: black; font-weight: bold">
									<%
										if (CmmUtil.nvl(rDTO.getTitle()).length() > 20) {
									%> <%=CmmUtil.nvl(rDTO.getTitle()).substring(0, 20) + "..."%>
									<%
										} else {
									%> <%=CmmUtil.nvl(rDTO.getTitle())%> <%
 	}
 %>
							</span>
						</a> <%
 	if (CmmUtil.nvl(rDTO.getCom_count()).equals("0")) {
 		} else {
 %> <span
							style="color: rgb(2, 151, 128); font-weight: bold; font-size: small;">
								[<%=CmmUtil.nvl(rDTO.getCom_count())%>]
						</span> <%
 	}
 %>
						</div>
						<div align="center" style="width:120px;height:30px;">
						<%if(CmmUtil.nvl(rDTO.getUser_id()).equals("admin")){%>
						<font color="#27c1f3">운영자</font>
						<%}else if(CmmUtil.nvl(rDTO.getUser_id()).length()>7){ %>
								<%=CmmUtil.nvl(rDTO.getUser_id()).substring(0,7)+"..."%>
							<%}else{ %>
								<%=CmmUtil.nvl(rDTO.getUser_id())%>
							<%} %>
						</div>
						<div align="center" style="width:160px;height:30px;">
							<%
								String date = CmmUtil.nvl(rDTO.getReg_dt());
							%> <%=date.substring(0, 4)%>.<%=date.substring(5, 7)%>.<%=date.substring(8, 10)%>.
							<%=date.substring(11, 16)%>
						</div>
					</div>
					<div style="height:2px;background-color: #dddddd;"></div>
					<%
						}if(a==0){
					%>
					<div style="height: 20px;"></div>
					<%} %>
					<div style="background-color: #dddddd; height: 2px;"></div>
					<div align="right" style="padding: 10px 0 0 0;">
					<input type="text" name="find" style="width:100px"/>
					<button  type="button" onclick="Search(this);" style="background-color: rgba(0,0,0,0); 
					border: 0; outline:0; width:64px; height: 29px; margin: 0 6px 0 0;">
					<img style="cursor: pointer;" src="../img/button/search.png"
							onmouseover="this.src='../img/button/search2.png'"
							onmouseout="this.src='../img/button/search.png'" />
				</button>
					<a href="bbmReg.do"> <img
								src="../img/button/write.png"
								onmouseover="this.src='../img/button/write2.png'"
								onmouseout="this.src='../img/button/write.png'" />
						</a>
					</div>
								<div class="paging" align="center" style="height:30px; margin: 10px 0 0 0">
							<%
								int line = 0;
								c = rList.size() / 200;
								if (count2 / 10 == 0) {
									int q = 1;
									if (rList.size() > 200) {
										q = 10;
									} else {
										q = (rList.size() - 1) / 20 + 1;
									}
									count2 = count2 + 1;
									for (line = 1; line <= q; line++) {
							%> <%
 	if (count2 == line) {
 %>
							<div class="linebox" align="center">
								<a href="bbmSearch.do?count=<%=line%>&find=<%=find %>" class="linetag"> <span
									style="color: white;"> <b> <%=line%>
									</b>
								</span>
								</a>
							</div>
							<%
								} else {
							%>
							<div class="linebox2" align="center">
								<a href="bbmSearch.do?count=<%=line%>&find=<%=find %>" class="linetag2"> <span
									style="color: #555555;"> <b> <%=line%>
									</b>
								</span>
								</a>
							</div>
							<%
								}
							%> <%
 	}
 		if (rList.size() > 200) {
 %><div class="linebox3" align="center">
								<a href="bbmSearch.do?count=<%=11%>&find=<%=find %>" class="linetag3"> <span
									style="color: #555555;"> <b> > </b>
								</span>
								</a>
							</div>
							<%
								}
								} else if (count2 / 10 == c) {
									int color = count2 + 1;
							%>
							<div class="linebox3" align="center">
								<a href="bbmSearch.do?count=<%=count2 / 10 * 10 - 9%>&find=<%=find %>"
									class="linetag3"> <span style="color: #999999;"> <b>
											< </b>
								</span>
								</a>
							</div>
							<%
								for (line = count2 / 10 * 10 + 1; line <= e + 1; line++) {
							%> <%
 	if (color == line) {
 %>
							<div class="linebox" align="center">
								<a href="bbmSearch.do?count=<%=line%>&find=<%=find %>" class="linetag"> <span
									style="color: white;"> <b> <%=line%>
									</b>
								</span>
								</a>
							</div>
							<%
								} else {
							%><div class="linebox2" align="center">
								<a href="bbmSearch.do?count=<%=line%>&find=<%=find %>" class="linetag2"> <span
									style="color: #555555;"> <b> <%=line%>
									</b>
								</span>
								</a>
							</div>
							<%
								}
							%> <%
 	}
 %> <%
 	} else {
 		int color = count2 + 1;
 %>
							<div class="linebox3" align="center">
								<a href="bbmSearch.do?count=<%=count2 / 10 * 10 - 9%>&find=<%=find %>"
									class="linetag3"> <span style="color: #999999;"> <b>
											< </b>
								</span>
								</a>
							</div>
							<%
								for (line = count2 / 10 * 10 + 1; line <= count2 / 10 * 10 + 10; line++) {
							%> <%
 	if (color == line) {
 %><div class="linebox" align="center">
								<a href="bbmSearch.do?count=<%=line%>&find=<%=find %>" class="linetag"> <span
									style="color: white;"> <b> <%=line%>
									</b>
								</span>
								</a>
							</div>
							<%
								} else {
							%><div class="linebox2" align="center">
								<a href="bbmSearch.do?count=<%=line%>&find=<%=find %>" class="linetag2"> <span
									style="color: #555555;"> <b> <%=line%>
									</b>
								</span>
								</a>
							</div>
							<%
								}
							%> <%
 	}
 %>
							<div class="linebox3" align="center">
								<a href="bbmSearch.do?count=<%=count2 / 10 * 10 + 11%>&find=<%=find %>"
									class="linetag3"> <span style="color: #999999;"> <b>
											> </b>
								</span>
								</a>
							</div>
							<%
								}
							%>
						</div>
					</div>
			</div>
		</div>
</body>
</html>