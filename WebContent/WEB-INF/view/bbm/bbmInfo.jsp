<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.BBMDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.Comment_bbmDTO"%>
<%@page import="java.util.List"%>
<%
	BBMDTO rDTO = (BBMDTO) request.getAttribute("rDTO");

	String bbm_seq = rDTO.getbbm_seq();
	List<Comment_bbmDTO> clist = rDTO.getClist();
	if (clist == null) {

		clist = new ArrayList<Comment_bbmDTO>();
	}
	//공지글 정보를 못불러왔다면, 객체 생성
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글보기</title>
<script type="text/javascript">

function doEdit(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="Admin"){
      
      location.href="/bbm/bbmEditInfo.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
   
   }else if ("<%=edit%>"==3){
      alert("로그인 하시길 바랍니다.");
      top.location.href="/top.do";
      
       
   }else{
      alert("본인이 작성한 글만 수정 가능합니다.")
   }
}

function doDelete(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="Admin"){
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
	
function doEdit2(seq){
    location.href="/bbm/bbmInfo2.do?com_seq="+seq;
}

function doDelete2(seq){
    location.href="/bbm/commentdelete.do?com_seq="+seq;
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
                  div.infot{
      background-image: url('../img/bg/infot.png');
      }
</style>
</head>
<body>
	<form action="/bbm/commentreg.do" method="post">
	<div class="infot">
		<table border="0" width="100%">
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
			<tr>
				<td align="right" colspan="3">
					<%
						if (edit == 2) {
					%> <input type="button" class="img-button"
					onclick="javascript:doEdit();" value=" " /> <%
 	}
 %> <%
 	if (edit == 2 || ss_user_id.equals("admin")) {
 %>
					<input type="button" class="img-button2" onclick="javascript:doDelete();" value=" " />
					<%
						}
					%> <input type="button" class="img-button3" onclick="javascript:doList();" value=" " />
				&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"><b><%=CmmUtil.nvl(rDTO.getTitle())%></b></td>
				<td align="right">|</td>
				<td align="left"><img src="../img/total/read.png"/></td>

			</tr>
			<tr>
				<td colspan="3">
					---------------------------------------------------------------</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;<b><%=CmmUtil.nvl(rDTO.getUser_id())%><br />
					<br /></b></td>
			</tr>
			<tr>
				<td colspan="3" height="600px" valign="top">
				&nbsp;
				<%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>")%></td>
			</tr>
			<tr>
				<td colspan="3" ><img src="../img/common/com.png"/></td>
			</tr>
			<tr>
				<td colspan="3">
					---------------------------------------------------------------</td>
			</tr>
			</table>
			</div>
			<table>
			<%
				for (int i=clist.size()-1;i>-1;i--){
					  Comment_bbmDTO a = clist.get(i);
			%>
			<tr>
				<td colspan="2"><b><%=CmmUtil.nvl(a.getUser_id()).replaceAll("\r\n", "<br/>")%>&nbsp;&nbsp;</b><%=CmmUtil.nvl(a.getReg_dt())%></td>
				
				<td align="left">
				<%
				if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))){
				%>
				<input type="hidden" name="bbm_seq" value="<%=bbm_seq%>">
				<input type="button" class="img-button" onclick="javascript:doEdit2('<%=CmmUtil.nvl(a.getcom_seq())%>');" value=" " />
								<%} %>
				<%
				if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))||ss_user_id.equals("admin")){
				%>
				 	<input type="button" class="img-button2" onclick="javascript:doDelete2('<%=CmmUtil.nvl(a.getcom_seq())%>');" value=" " />
				<%} %>
				</td>
			</tr>
			<tr>
				<td colspan="3"><%=CmmUtil.nvl(a.getContents())%></td>
			</tr>
			<tr>
				<td colspan="3">
					---------------------------------------------------------------</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="3" valign="middle"><textarea name="comment"
						style="width: 440px"></textarea> <input type="submit" class="img-button4"value=" " />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					---------------------------------------------------------------</td>
			</tr>
		</table>
		<input type="hidden" name="bbm_seq" value="<%=bbm_seq%>">
	</form>
</body>
</html>