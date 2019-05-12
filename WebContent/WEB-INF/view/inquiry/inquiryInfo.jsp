<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO" %>
<%
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);

InquiryDTO rDTO = (InquiryDTO)request.getAttribute("rDTO");
session.setAttribute("url", "/inquiry/inquiryInfo.do?inq_seq="+CmmUtil.nvl(rDTO.getinq_seq()));
//공지글 정보를 못불러왔다면, 객체 생성
if (rDTO==null){
   rDTO = new InquiryDTO();

}

String ss_user_id = CmmUtil.nvl((String)session.getAttribute("USER_ID"));

//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
int edit = 1;

//로그인 안했다면....
if (ss_user_id.equals("")){
   edit = 3;
   
//본인이 작성한 글이면 2가 되도록 변경
}else if (ss_user_id.equals(CmmUtil.nvl(rDTO.getUser_id()))){
   edit = 2;
   
}

System.out.println("user_id : "+ CmmUtil.nvl(rDTO.getUser_id()));
System.out.println("ss_user_id : "+ss_user_id);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/inquiry/inquiryInfo.do/../../img/common/icon.ico" type="image/x-icon" />
<title><%=CmmUtil.nvl(rDTO.getTitle())%> - 문의 : Lovie</title>
<script type="text/javascript">
<%
if(CmmUtil.nvl(rDTO.getUser_id()).equals(SESSION_USER_ID) || SESSION_USER_ID.equals("admin")){
}else{
	%>
	alert("잘못된 접근입니다.");
	location.href = "/inquiry/inquiryList.do";
	<% 
	}
%>

function doEdit(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="admin"){
      
      location.href="/inquiry/inquiryEditInfo.do?inq_seq=<%=CmmUtil.nvl(rDTO.getinq_seq())%>";
   
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
         location.href="/inquiry/inquiryDelete.do?inq_seq=<%=CmmUtil.nvl(rDTO.getinq_seq())%>";
   }else if ("<%=edit%>"==3){
      alert("로그인 하시길 바랍니다.");
      location.href="/user/user_login.do";
   }
      
}else {
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
	   if(f.comment.value == ""){
	      alert("댓글내용을 입력해주세요.");
	      f.comment.focus();
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
function doList(){
   location.href="/inquiry/inquiryList.do";
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
     div.infot{
      background-image: url('../img/bg/infot.png');
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
      <table border="0" width="100%">
         <tr>
            <td align="right" colspan="3">
            <%if(edit == 2) {%>
            <a href="javascript:doEdit();">
            <input type="button" class="img-button" value=" "/>
            </a>
            <a href="javascript:doDelete();">
            <input type="button" class="img-button2" value=" "/>
            </a>
            <%} %> 
            <a href="javascript:doList();">
            <input type="button" class="img-button3" value=" "/>
            </a>
           &nbsp; </td>
         </tr>
         <tr>
            <td colspan="3">
               <hr>
            </td>
         </tr>
         <tr>
            <td align="center"width="85%"><b><%=CmmUtil.nvl(rDTO.getTitle())%></b></td>
            <td align="right"width="5%">|</td>
            <td align="left"width="10%"><img src="../img/inquiry/inqs.png"/></td>
            
         </tr>
         <tr>
            <td colspan="3">
            <hr/>
            </td>
         </tr>
         <tr>
            <td colspan="3">&nbsp;&nbsp;<b><%=CmmUtil.nvl(rDTO.getUser_id()) %></b></td>
            </tr>
            <tr>
            <td colspan="3"><img src="../img/total/emails.png"/>&nbsp; <%=CmmUtil.nvl(rDTO.getEmail1()) %>@<%=CmmUtil.nvl(rDTO.getEmail2()) %><br/><br/></td>
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
				<br>
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