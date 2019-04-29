<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.Comment_noticeDTO"%>
<%@page import="java.util.List"%>
<%
	NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");

	if (rDTO==null){
		rDTO = new NoticeDTO();

	}


	String notice_seq = rDTO.getnotice_seq();
	
	List<Comment_noticeDTO> clist = rDTO.getClist();
	if (clist == null) {

		clist = new ArrayList<Comment_noticeDTO>();
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글보기</title>
<script type="text/javascript">

function doEdit(){
 if ("<%=edit%>"==2 ){
    
    location.href="/notice/NoticeEditInfo.do?notice_seq=<%=CmmUtil.nvl(rDTO.getnotice_seq())%>";
 
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
       location.href="/notice/NoticeDelete.do?notice_seq=<%=CmmUtil.nvl(rDTO.getnotice_seq())%>";
 		}else if ("<%=edit%>" == 3) {
				alert("로그인 하시길 바랍니다.");
				location.href = "/user/user_login.do";
			}
	} else {
		alert("본인이 작성한 글만 삭제 가능합니다.")
	}
}
function doInfo(seq){
    location.href="/notice/NoticeInfo.do?bbm_seq="+seq;
}

function doDelete2(seq){
    location.href="/notice/commentdelete.do?com_seq="+seq;
}

function doEdit2(seq){
	    location.href="/notice/NoticeInfo2.do?com_seq="+seq;
}
	
function doDelete2(seq){
	    location.href="/notice/commentdelete.do?com_seq="+seq;
}	

function doBack(){
	alert("댓글이 수정되지 않았습니다.");
}

	function doList() {
		location.href = "/notice/NoticeList.do";
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
        background: url( "../img/total/cc.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
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
<body>
	<form action="/notice/commentupdate.do" method="post">
	<div class="infot">
		<table border="0" width="100%">
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
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
				<td align="center"><b><%=CmmUtil.nvl(rDTO.getTitle())%></b></td>
				<td align="right">|</td>
				<td align="left"><img src="../img/notice/nots.png"/></td>

			</tr>
			<tr>
				<td colspan="3">
					&nbsp;---------------------------------------------------------------</td>
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
					&nbsp;---------------------------------------------------------------</td>
			</tr>
			</table>
			</div>
			<%
				for (int i=clist.size()-1;i>-1;i--){
					  Comment_noticeDTO a = clist.get(i);
			%>
			<div class="framebgm">
			<table>
			<tr>
				<td colspan="2">&nbsp;<b><%=CmmUtil.nvl(a.getUser_id()).replaceAll("\r\n", "<br/>")%>&nbsp;&nbsp;</b><%=CmmUtil.nvl(a.getReg_dt())%></td>
				
				<td align="left">
				<%if(CmmUtil.nvl(a.getcom_seq()).equals(com_seq)){%>
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
				</td>
			</tr>
			<tr>
			<%if(CmmUtil.nvl(a.getcom_seq()).equals(com_seq)){%>
				<td colspan="3" valign="middle">&nbsp;
				<%String b= CmmUtil.nvl(a.getcom_seq()); %>
				<input type="hidden" name="com_seq" value="<%=b%>">
				<textarea name="comment2"
						style="width: 440px"><%=CmmUtil.nvl(a.getContents())%></textarea>
				<%}else{%>
				<td colspan="3">&nbsp;<%=CmmUtil.nvl(a.getContents())%></td>
				<%} %>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;---------------------------------------------------------------</td>
			</tr>
			</table>
			</div>
			<%
				}
			%>
			<div class="framebgm">
			<table>
			<tr>
				<td colspan="3" valign="middle">&nbsp;<textarea name="comment"
						style="width: 440px"></textarea> <input type="button" class="img-button4" onclick="javascript:doBack();" value=" " />
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
		<input type="hidden" name="notice_seq" value="<%=notice_seq%>">
	</form>
</body>
</html>