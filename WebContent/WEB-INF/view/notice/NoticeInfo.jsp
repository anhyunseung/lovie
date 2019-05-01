<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

function doEdit2(seq){
	    location.href="/notice/NoticeInfo2.do?com_seq="+seq;
}
	
function doDelete2(seq){
	    location.href="/notice/commentdelete.do?com_seq="+seq;
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
	<form action="/notice/commentreg.do" method="post">
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
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"width="85%"><b><%=CmmUtil.nvl(rDTO.getTitle())%></b></td>
				<td align="right"width="5%">|</td>
				<td align="left"width="10%"><img src="../img/notice/nots.png"/></td>

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
				<%
				if(ss_user_id.equals(CmmUtil.nvl(a.getUser_id()))){
				%>
				<input type="hidden" name="notice_seq" value="<%=notice_seq%>">
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
				<td colspan="3">&nbsp;<%=CmmUtil.nvl(a.getContents())%></td>
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
						style="width: 440px"></textarea> <input type="submit" class="img-button4" value=" " />
				</td>
			</tr>
			</table>
			</div>
			<div class="framebgd">
			<table>
						<tr>
				<td colspan="3"></br></td>
			</tr>
		</table>
		</div>
		<input type="hidden" name="notice_seq" value="<%=notice_seq%>">
	</form>
</body>
</html>