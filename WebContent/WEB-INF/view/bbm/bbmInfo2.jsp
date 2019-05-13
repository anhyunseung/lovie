<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.BBMDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.Comment_bbmDTO"%>
<%@page import="java.util.List"%>
<%
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);
	BBMDTO rDTO = (BBMDTO) request.getAttribute("rDTO");
	int count2 = (int)request.getAttribute("count3");

	if (rDTO==null){
		rDTO = new BBMDTO();

	}

	session.setAttribute("url", "/bbm/bbmInfo.do?bbm_seq="+CmmUtil.nvl(rDTO.getbbm_seq()));

	String bbm_seq = rDTO.getbbm_seq();
	
	List<Comment_bbmDTO> clist = rDTO.getClist();
	if (clist == null) {

		clist = new ArrayList<Comment_bbmDTO>();
	}
	String ss_user_id = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String seq = CmmUtil.nvl((String) session.getAttribute("com_bbm_seq"));
	String com_seq=CmmUtil.nvl((String) session.getAttribute("com_seq"));

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
<link rel="shortcut icon" href="http://localhost:8080/bbm/bbmInfo2.do/../../img/common/icon.ico" type="image/x-icon" />
<title><%=CmmUtil.nvl(rDTO.getTitle())%> - 자유게시판 : Lovie</title>
<script type="text/javascript">

function doEdit(){
 if ("<%=edit%>"==2 ){
    
    location.href="/bbm/bbmEditInfo.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
 
 }else if ("<%=edit%>"==3){
    alert("로그인 하시길 바랍니다.");
    top.location.href="/top.do";
    
    
 }else{
    alert("본인이 작성한 글만 수정 가능합니다.")
 }
}

function doDelete(){
 if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="admin"){
    if(confirm("정말로 삭제하시겠습니까?")){
       location.href="/bbm/bbmDelete.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
 		}else if ("<%=edit%>" == 3) {
 			alert("로그인 하시길 바랍니다.");
			location.href = "/user/user_login.do";
			}
	} else {
		alert("본인이 작성한 글만 삭제 가능합니다.")
	}
}
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
function doSubmit2(f) {
	   if(f.comment2.value == ""){
	      alert("댓글내용을 입력해주세요.");
	      f.comment.focus();
	      return false;
	   }
	}
function doInfo(seq){
    location.href="/bbm/bbmInfo.do?bbm_seq="+seq;
}

function doDelete2(seq){
    location.href="/bbm/commentdelete.do?com_seq="+seq;
}

function doEdit2(seq){
	    location.href="/bbm/bbmInfo2.do?com_seq="+seq;
}
	
function doDelete2(seq){
	    location.href="/bbm/commentdelete.do?com_seq="+seq;
}	

function doBack(){
	alert("댓글이 수정되지 않았습니다.");
}

	function doList() {
		location.href = "/bbm/bbmList.do";
	}
</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/button/rewri.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/button/del.png" ) no-repeat;
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
      }
      input.img-button4 {
        background: url( "../img/button/comup.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button5 {
        background: url( "../img/button/done.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button6 {
        background: url( "../img/button/cc.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button7 {
        background: url( "../img/button/login.png" ) no-repeat;
        border: none;
        height: 45px;
        width: 58px;
        cursor: pointer;
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
	<table border="0" height="500px" width="1800px" >
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
			<input type="submit" class="img-button7" value=" "/>
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
			
	<form action="/bbm/commentupdate.do" method="post">
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
		<table border="0" width="100%">
			<tr>
				<td align="right" colspan="3">
					<%
						if (edit == 2 || ss_user_id.equals("Admin")) {
					%> 
					<input type="button" class="img-button" onclick="javascript:doEdit();" value=" " />
				 	<input type="button" class="img-button2" onclick="javascript:doDelete();" value=" " />
				 						<%
 	}
 %>
					<input type="button" class="img-button3" onclick="javascript:doList();" value=" " />
				&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"width="85%"><b><%=CmmUtil.nvl(rDTO.getTitle())%></b></td>
				<td align="right"width="5%">|</td>
				<td align="left"width="10%"><img src="../img/total/read.png"/></td>

			</tr>
			<tr>
				<td colspan="3">
					<hr/></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;<b><%=CmmUtil.nvl(rDTO.getUser_id())%><br />
					<br /></b></td>
			</tr>
			<tr>
				<td colspan="3" valign="top">
				<%String content=(CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>"));
				for(int i=0;i<=(content.length()-1)/70;i++){
					String content2="";
					if(i==(content.length()-1)/70){
						content2=content.substring(70*i,content.length());
					}else{
						content2=content.substring(70*i,70*(i+1));
					}
					%>
					&nbsp;<%=content2%><br>
					<%
				}
				%>
				<br><br><br>
				</td>
			</tr>
			<tr>
				<td colspan="3" ><img src="../img/common/com.png"/></td>
			</tr>
			<tr>
				<td colspan="3">
					<hr/></td>
			</tr>
			</table>
			</div>
			<%
			int l=clist.size();
			int b=9;
			int c=l/10;
			int d=l-c*10;
			int e=(clist.size()-1)/10;

			if(clist.size()>10){
				l=10;
			}
			if(count2==c){
				l=d;
			}
			for (int i=0;i<l;i++){
				b--;
				Comment_bbmDTO a = clist.get(count2*10+i);
			%>
			<div class="framebgm">
			<table width="100%">
			<tr>
				<td colspan="2">&nbsp;<b><%=CmmUtil.nvl(a.getUser_id()).replaceAll("\r\n", "<br/>")%>&nbsp;&nbsp;</b>
				<%String date=CmmUtil.nvl(a.getReg_dt());%>
   				<%=date.substring(0,4)%>.<%=date.substring(5,7)%>.<%=date.substring(8,10)%>.
   				<%=date.substring(11,16)%></td>
				<td align="right">
				<%if(CmmUtil.nvl(a.getcom_seq()).equals(com_seq)){%>
				<script>
				<%
				if(CmmUtil.nvl(a.getUser_id()).equals(SESSION_USER_ID)){
					}else{%>
					alert("잘못된 접근입니다.");
					location.href = "/bbm/bbmInfo.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
					<% 
					}
				%>
				</script>
				<input type="submit" class="img-button5" value=" " />
				<input type="button" class="img-button6" onclick="javascript:doInfo('<%=seq%>');" value=" " />
				<%}else{ %>
				<%
				if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))){
				%>
				<input type="button" class="img-button" onclick="javascript:doEdit2('<%=CmmUtil.nvl(a.getcom_seq())%>');" value=" " />
								<%} %>
				<%
				if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))||ss_user_id.equals("admin")){
				%>
				 	<input type="button" class="img-button2" onclick="javascript:doDelete2('<%=CmmUtil.nvl(a.getcom_seq())%>');" value=" " />
				<%}}%>
				&nbsp;
				</td>
			</tr>
			<tr>
			<%if(CmmUtil.nvl(a.getcom_seq()).equals(com_seq)){%>
				<td colspan="3" valign="middle">&nbsp;
				<%String q= CmmUtil.nvl(a.getcom_seq()); %>
				<input type="hidden" name="com_seq" value="<%=q%>">
				<textarea name="comment2"
						style="width: 700px"><%=CmmUtil.nvl(a.getContents())%></textarea>
				<%}else{%>
				<td colspan="3">&nbsp;<%=CmmUtil.nvl(a.getContents())%></td>
				<%} %>
			</tr>
			<tr>
				<td colspan="3">
					<hr/></td>
			</tr>
			</table>
			</div>
			<%
				}
			%>
			<div class="framebgm">
			<table width="100%">
			<tr>
				<td valign="middle">&nbsp;<textarea name="comment"
						style="width: 700px"></textarea> <input type="button" class="img-button4" onclick="javascript:doBack();" value=" " />
				&nbsp;
				</td>
			</tr>
						<tr>
			   <td colspan="2" align="center">
   <%int line=0;
   if(clist.size()>=100 && clist.size()<=999){
		c=clist.size()/100;
	}else if(clist.size()>=1000 && clist.size()<=9999){
		c=clist.size()/1000;
	}else if(clist.size()>=10000 && clist.size()<=99999){
		c=clist.size()/10000;
	}else{
		c=clist.size()/10;
	}
   if(count2/10==0){ 
	   int q=1;
	   if(clist.size()>100){
		  q=10;
	   }else{
		   q=(clist.size()-1)/10+1;
	   }
	   count2=count2+1;
   for(line=1;line<=q;line++){
   %>
   <%if(count2==line){%>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=line%>">
   <span style=" color: white; background-color:red ">
   <b>
   <%=line%>
   </b>
   </span>
   </a>
   <%}else{ %>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=line%>">
   <span style=" color: black">
   <b>
   <%=line%>
   </b>
   </span>
   </a>
   <%} %>
   <%} 
   if(clist.size()>100){
   %>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=11%>">
   <span style=" color: black; background-color:gray">
   <b>></b>
   </span>
</a>
   <%}}else if(count2/10==c){
   int color=count2+1;
   %>
   &nbsp;
	<a href="bbmInfo.do?count2=<%=count2/10*10-9%>">
	<span style=" color: black; background-color:gray">
   <b><</b>
   </span>
	</a>
	<%
   for(line=count2/10*10+1;line<=e+1;line++){
	%>
	<%if(color==line){%>
	&nbsp;
   <a href="bbmInfo.do?count2=<%=line%>">
   <span style=" color: white; background-color:red">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%}else{ %>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=line%>">
   <span style=" color: black">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%} %>
	<%}%>
   <%}else{
	   int color=count2+1;
   %>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=count2/10*10-9%>">
   <span style=" color: black; background-color:gray">
   <b><</b>
   </span>
	</a>
   <% 
	   for(line=count2/10*10+1;line<=count2/10*10+10;line++){
   %>
   
   <%if(color==line){%>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=line%>">
   <span style=" color: white; background-color:red">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%}else{ %>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=line%>">
   <span style=" color: black">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%} %>
   <%} %>
   &nbsp;
   <a href="bbmInfo.do?count2=<%=count2/10*10+11%>">
   <span style=" color: black; background-color:gray">
   <b>></b>
   </span>
	</a>
<%} %>
			</td>
			</tr>
			</table>
			</div>
			<div class="framebgd">
			<table>
			<tr>
				<td colspan="3">
					</br></td>
			</tr>
		</table>
		</div>
		<input type="hidden" name="bbm_seq" value="<%=bbm_seq%>">
	</form>
	</td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</body>
</html>