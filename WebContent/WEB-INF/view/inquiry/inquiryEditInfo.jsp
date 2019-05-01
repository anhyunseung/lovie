<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO"%>
<%
	InquiryDTO rDTO = (InquiryDTO) request.getAttribute("rDTO");

	//공지글 정보를 못불러왔다면, 객체 생성
	if (rDTO == null) {
		rDTO = new InquiryDTO();

	}

	int access = 1; //(작성자 : 2 / 다른 사용자: 1) 

	if (CmmUtil.nvl((String) session.getAttribute("USER_ID")).equals(CmmUtil.nvl(rDTO.getUser_id()))) {
		access = 2;
	}
	System.out.println("user_id : " + CmmUtil.nvl(rDTO.getUser_id()));
	System.out.println("ss_user_id : " + CmmUtil.nvl((String) session.getAttribute("USER_ID")));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript">


function doOnload(){
   
   if ("<%=access%>" == "1") {
			alert("작성자만 수정할 수 있습니다.");
			location.href = "/inquiry/inquiryInfo.do?notice_seq=<%=CmmUtil.nvl(request.getParameter("inq_seq"))%>";
		}
	}

function doSubmit(f) {
    if (f.title.value == "") {
       alert("제목을 입력하시기 바랍니다.");
       f.title.focus();
       return false;
    }
    if(f.title.value.length > 50){
       alert("최대 50자까지 입력 가능합니다.");
       f.title.focus();
       return false;
    }
    if (f.contents.value == "") {
       alert("내용을 입력하시기 바랍니다.");
       f.contents.focus();
       return false;
    }
    if (f.contents.value.length > 2000) {
       alert("최대 2000자까지 입력 가능합니다.");
       f.contents.focus();
       return false;
    }
    if (f.email1.value == "") {
		alert("이메일 입력을 해주세요.");
		f.email1.focus();
		return false;
	}

	if (f.email2.value == "bd") {
		alert("이메일 선택을 해주세요.");
		f.email2.focus();
		return false;
	}

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
        background: url( "../img/button/sign.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/button/cc.png" ) no-repeat;
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
      div.infot{
      background-image: url('../img/bg/infot.png');
      }
      div.framebgd
	{
	background-image:url('../img/bg/framebgd.png');
	}
</style>
</head>
<body onload="doOnload();">
	<form name="f" method="post" action="/inquiry/inquiryUpdate.do"
		onsubmit="return doSubmit(this);">
		<input type="hidden" name="inq_seq"
			value="<%=CmmUtil.nvl(request.getParameter("inq_seq"))%>" />
		<br>
      <div class="infot">
      <table border="0" width="100%">
			<tr>
				<td align="center" width="120px">
				<br>
				<img src="../img/total/tit.png"/></td>
				<td>
				<br>
				<input type="text" name="title" maxlength="35"
					value="<%=CmmUtil.nvl(rDTO.getTitle())%>" style="width: 425px" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center"><img src="../img/total/emails.png"/></td>
				<td><input type="text" name="email1" maxlength="16"
					value="<%=CmmUtil.nvl(rDTO.getEmail1())%>" width="100%"
					onkeydown="return doKeyIdPw(event)" />&nbsp;<b>@</b> <select
					name="email2">
						<option value="bd">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="gmail.com">gmail.com</option>
				</select></td>
			</tr>
			<tr>
				<td>
				<br>
				&nbsp;<img src="../img/total/writes.png"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;&nbsp;&nbsp;
				<textarea name="contents"
						style="width: 1120px; height: 600px"><%=CmmUtil.nvl(rDTO.getContents())%></textarea>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2"><hr> <a
					href="/inquiry/inquiryList.do"> <input type="button"
					class="img-button3"
						onclick="javascript:doList();" value=" " />
				</a>&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" class="img-button" value=" " />
					<a href="/inquiry/inquiryList.do"> <input type="button"
					class="img-button2"	onclick="javascript:doInfo('<%=CmmUtil.nvl(rDTO.getinq_seq())%>');"
						value=" " />
				</a></td>
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
	</form>
</body>
</html>