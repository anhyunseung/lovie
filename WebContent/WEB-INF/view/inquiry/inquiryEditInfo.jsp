<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO"%>
<%
session.setAttribute("url", "/inquiry/inquiryEditInfo.do");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);
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
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="shortcut icon" href="http://localhost:8080/inquiry/inquiryEditInfo.do/../../img/common/icon.ico" type="image/x-icon" />
<title>문의 : Lovie</title>
<script type="text/javascript">


function doOnload(){
   
   if ("<%=access%>" == "1") {
			alert("작성자만 수정할 수 있습니다.");
			location.href = "/inquiry/inquiryInfo.do?notice_seq=<%=CmmUtil.nvl(request.getParameter("inq_seq"))%>";
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
a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover { text-decoration: none;}
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
      input {
        vertical-align: middle;
      }input.login {
        background: url( "../img/button/login.png" ) no-repeat;
        border: none;
        height: 45px;
        width: 58px;
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
<body background="../img/top/bg.png" onload="doOnload();">
<font face='Segoe UI' style=' line-height:1.4'>
<div>
	<table border="0" height="500px" width="1800px" >
		<tr>
			<td width="48px" height="167px"></td>
			<td colspan="4" align="left" width="1500px">
			
			<a href="/top.do">
				<img src="../img/common/Logo.png"/>
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/notice/NoticeList.do"
				>
				<img src="../img/top/notice.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			
			<a
				href="/newmovie/newmovieList.do" > 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/upmovie/upmovieList.do" > 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" > 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/inquiry/inquiryList.do" > 
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
				<a href="/user/manageList.do" > 
				<span style=" font: 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" > 
				<span style=" font: 1.5em Georgia, serif ;">
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
			<input type="submit" class="login" value=" "/>
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
				<a href="/user/user_join2.do" >
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
	<form name="f" method="post" action="/inquiry/inquiryUpdate.do"
		onsubmit="return doSubmit(this);">
		<input type="hidden" name="inq_seq"
			value="<%=CmmUtil.nvl(request.getParameter("inq_seq"))%>" />
		<br>
      <div class="infot">
     <table border="0" width="100%">
         <tr>
         <td></td>
            <td align="center" width="120px">
            <br>
            <img src="../img/total/tit.png"/></td>
            <td>
            <br>
            <input type="text" name="title" maxlength="35"
               style="width: 425px" value="<%=CmmUtil.nvl(rDTO.getTitle())%>" /></td>
               <td width="10px"></td>
         </tr>
            <tr>
            <td></td>
               <td colspan="2">
               <hr>
               </td>
               <td width="10px"></td>
               </tr>
			<tr><td width="10px"></td>
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
				<td width="10px"></td>
			</tr>
			<tr>
			<td width="10px"></td>
				<td>
				<br>
				&nbsp;<img src="../img/total/writes.png"/>
				</td>
				<td width="10px"></td>
			</tr>
			<tr>
			<td width="10px"></td>
				<td colspan="2">
				<textarea name="contents" id="contents" rows="10" cols="100" onKeyUp="checkByte(this.form);" 
                  style="width:100%; height:600px; display:none;">
				<%
				String contenttest1 = CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>");
				String contenttest2 = contenttest1.replaceAll("& lt;", "<");
				String contenttest3 = contenttest2.replaceAll("& gt;", ">");
				String contenttest4 = contenttest3.replaceAll("& #40;", "(");
				String contenttest5 = contenttest4.replaceAll("& #41;", ")");
				String content=contenttest5;
				%>
					<%=content%>
				</textarea>
				</td>
				<td width="10px"></td>
			</tr>
			<tr>
			<td width="10px"></td>
				<td align="right" colspan="2"><hr> <a
					href="/inquiry/inquiryList.do"> <input type="button"
					class="img-button3"
						onclick="javascript:doList();" value=" " />
				</a>&nbsp;&nbsp;</td>
				<td width="10px"></td>
			</tr>
			<tr>
			<td width="10px"></td>
				<td align="center" colspan="2">
<input  type="button" onclick="submitContents(this);" class="img-button" value=" " />
					<input type="button"
					class="img-button2"	onclick="javascript:doInfo('<%=CmmUtil.nvl(rDTO.getinq_seq())%>');"
						value=" " />
						</td>
						<td width="10px"></td>
			</tr>
		</table>
			</div>
			<div class="framebgd">
   			<table height="27px">
   <tr>
   <td>
   </td>
   </tr>
   </table>
   </div>
	</form>
	   <script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contents",
	sSkinURI: "../se2/SmartEditor2Skin_ko_KR.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["contents"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
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
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	 if(document.getElementById("contents").value=="<p><br></p>"||document.getElementById("contents").value==""){
		 alert("내용을 입력하시기 바랍니다.");
	      return false;
	 }
	 if (document.getElementById("contents").value.length > 2000) {
	      alert("최대 2000자까지 입력 가능합니다.");
	      return false;
	   }
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
	</td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</font>
</body>
</html>