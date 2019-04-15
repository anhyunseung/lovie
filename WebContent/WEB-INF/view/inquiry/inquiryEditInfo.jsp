<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO"%>
<%
	InquiryDTO rDTO = (InquiryDTO) request.getAttribute("rDTO");

	//������ ������ ���ҷ��Դٸ�, ��ü ����
	if (rDTO == null) {
		rDTO = new InquiryDTO();

	}

	int access = 1; //(�ۼ��� : 2 / �ٸ� �����: 1) 

	if (CmmUtil.nvl((String) session.getAttribute("USER_ID")).equals(CmmUtil.nvl(rDTO.getUser_id()))) {
		access = 2;
	}
	System.out.println("user_id : " + CmmUtil.nvl(rDTO.getUser_id()));
	System.out.println("ss_user_id : " + CmmUtil.nvl((String) session.getAttribute("USER_ID")));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>
<script type="text/javascript">


function doOnload(){
   
   if ("<%=access%>" == "1") {
			alert("�ۼ��ڸ� ������ �� �ֽ��ϴ�.");
			location.href = "/inquiry/inquiryInfo.do?notice_seq=<%=CmmUtil.nvl(request.getParameter("inq_seq"))%>";
		}
	}

	function doSubmit(f) {
		if (f.title.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.title.focus();
			return false;
		}

		if (calBytes(f.title.value) > 35) {
			alert("�ִ� 35�ڱ��� �Է� �����մϴ�.");
			f.title.focus();
			return false;
		}

		var noticeCheck = false;
		for (var i = 0; i < f.noticeYn.length; i++) {
			if (f.noticeYn[i].checked) {
				noticeCheck = true;
			}
		}
		if (f.contents.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.title.focus();
			return false;
		}
		if (f.calBytes(f.contents.value) > 4000) {
			alert("�ִ� 4000Bytes���� �Է� �����մϴ�.");
			f.contents.focus();
			return false;
		}
	if (f.email1.value == "") {
		alert("�̸��� �Է��� ���ּ���.");
		f.email1.focus();
		return false;
	}

	if (f.email2.value == "bd") {
		alert("�̸��� ������ ���ּ���.");
		f.email2.focus();
		return false;
	}
	}

	function calBytes(str) {

		var tcount = 0;
		var tmpStr = new String(str);
		var strCnt = tmpStr.length;

		var onechar;
		for (i = 0; i < strCnt; i++) {
			onechar = tmpStr.charAt(i);

			if (escape(onechar).lengt > 4) {
				tcount += 2;

			} else {
				tcount += 1;
			}
		}
		return tcount;
	}
	function doKeyIdPw(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.KeyCode;

		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| (keyID >= 65 && keyID <= 90) || keyID == 8 || keyID == 37
				|| keyID == 39 || keyID == 9) {
			return true;
		} else {
			return false;
		}
	}
	function doInfo(seq) {
		location.href = "/inquiry/inquiryInfo.do?inq_seq=" + seq;
	}
	function doList() {
		location.href = "/inquiry/inquiryList.do";
	}
</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/sign.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/cc.png" ) no-repeat;
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
</style>
</head>
<body onload="doOnload();">
	<form name="f" method="post" action="/inquiry/inquiryUpdate.do"
		onsubmit="return doSubmit(this);">
		<input type="hidden" name="inq_seq"
			value="<%=CmmUtil.nvl(request.getParameter("inq_seq"))%>" />
		<table border="0" width="100%">
			<tr>
				<td align="center" width="120px"><img src="../img/tit.png"/></td>
				<td><input type="text" name="title" maxlength="35"
					value="<%=CmmUtil.nvl(rDTO.getTitle())%>" style="width: 425px" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"><b>�̸���</b></td>
				<td><input type="text" name="email1" maxlength="16"
					value="<%=CmmUtil.nvl(rDTO.getEmail1())%>" width="100%"
					onkeydown="return doKeyIdPw(event)" />&nbsp;<b>@</b> <select
					name="email2">
						<option value="bd">�����ϼ���</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="gmail.com">gmail.com</option>
				</select></td>
			</tr>
			<tr>
				<td><br>
				<img src="../img/writes.png"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="contents"
						style="width: 515px; height: 600px"><%=CmmUtil.nvl(rDTO.getContents())%></textarea>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2"><hr> <a
					href="/inquiry/inquiryList.do"> <input type="button"
					class="img-button3"
						onclick="javascript:doList();" value=" " />
				</a></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" class="img-button" value=" " />
					<a href="/inquiry/inquiryList.do"> <input type="button"
					class="img-button2"	onclick="javascript:doInfo('<%=CmmUtil.nvl(rDTO.getinq_seq())%>');"
						value=" " />
				</a></td>
			</tr>
		</table>
	</form>
</body>
</html>