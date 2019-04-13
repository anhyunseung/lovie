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
	//������ ������ ���ҷ��Դٸ�, ��ü ����
	String ss_user_id = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String seq = CmmUtil.nvl((String) session.getAttribute("com_bbm_seq"));
	String com_seq=CmmUtil.nvl((String) session.getAttribute("com_seq"));
	
	//������ �ۼ��� �۸� ���� �����ϵ��� �ϱ�(1:�ۼ��� �ƴ� / 2: ������ �ۼ��� �� / 3: �α��ξ���)
	int edit = 1;

	//�α��� ���ߴٸ�....
	if (ss_user_id.equals("")) {
		edit = 3;

		//������ �ۼ��� ���̸� 2�� �ǵ��� ����
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
<title>�Խ��� �ۺ���</title>
<script type="text/javascript">

function doEdit(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="Admin"){
      
      location.href="/bbm/bbmEditInfo.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
   
   }else if ("<%=edit%>"==3){
      alert("�α��� �Ͻñ� �ٶ��ϴ�.");
      top.location.href="/top.do";
      
      
   }else{
      alert("������ �ۼ��� �۸� ���� �����մϴ�.")
   }
}

function doDelete(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="Admin"){
      if(confirm("������ �����Ͻðڽ��ϱ�?")){
         location.href="/bbm/bbmDelete.do?bbm_seq=<%=CmmUtil.nvl(rDTO.getbbm_seq())%>";
   }else if ("<%=edit%>" == 3) {
				alert("�α��� �Ͻñ� �ٶ��ϴ�.");
				location.href = "/user/user_login.do";
			}
		} else {
			alert("������ �ۼ��� �۸� ���� �����մϴ�.");
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
	alert("����� �������� �ʾҽ��ϴ�.");
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
        background: url( "../img/rewri.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/del.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button3 {
        background: url( "../img/list.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button4 {
        background: url( "../img/comup.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button5 {
        background: url( "../img/done.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button6 {
        background: url( "../img/cc.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
                  div.infot{
      background-image: url('../img/infot.png');
      }
</style>
</head>
<body>
	<form action="/bbm/commentupdate.do" method="post">
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
 	if (edit == 2 || ss_user_id.equals("Admin")) {
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
				<td align="left"><img src="../img/read.png"/></td>

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
				<td colspan="3" ><img src="../img/com.png"/></td>
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
				<td colspan="3" valign="middle">
				<%String b= CmmUtil.nvl(a.getcom_seq()); %>
				<input type="hidden" name="com_seq" value="<%=b%>">
				<textarea name="comment2"
						style="width: 440px"><%=CmmUtil.nvl(a.getContents())%></textarea>
				<%}else{%>
				<td colspan="3"><%=CmmUtil.nvl(a.getContents())%></td>
				<%} %>
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
						style="width: 440px"></textarea> <input type="button" class="img-button4" onclick="javascript:doBack();" value=" " />
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