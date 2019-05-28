<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%
   request.setCharacterEncoding("UTF-8");
session.setAttribute("url", "/notice/NoticeReg.do");
   String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID")); //아이디
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="shortcut icon" href="http://localhost:8080/notice/NoticeReg.do/../../img/common/icon.ico" type="image/x-icon" />
<title>공지사항 : Lovie</title>
<script type="text/javascript">
function doOnload(){
   var user_id = "<%=SESSION_USER_ID%>";
   
   if (user_id!="admin"){
      alert("관리자만 글을 쓸 수 있습니다.");
      location.href="/notice/NoticeList.do";
      
   }
   
}

//로그인 여부 체크

   function doList(){
	    location.href="/notice/NoticeList.do";
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
      
      input.login {
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
   <form name="f" method="post" action="/notice/NoticeInsert.do">
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
               style="width: 425px" /></td>
               <td width="10px"></td>
         </tr>
            <tr>
            <td></td>
               <td colspan="2">
               <hr>
               </td>
               <td width="10px"></td>
               </tr>
               <tr>
               <td></td>
               <td>
               &nbsp;<img src="../img/total/writes.png"/>
               </td>
               <td></td>
               </tr>
         <tr>
         <td width="10px"></td>
            <td colspan="2">
            <!-- <input type="file" name="file"><br><br> -->
            <textarea name="contents" id="contents" rows="10" cols="100" onKeyUp="checkByte(this.form);" 
                  style="width:100%; height:600px; display:none;"></textarea></td>
                  <td width="10px"></td>
         </tr>
                  <tr>
                  <td></td>
            <td align="right" colspan="2"><hr>
            <a href="/notice/NoticeList.do">
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" " />
            </a>&nbsp;&nbsp;</td>
            <td></td>
         </tr>
         <tr>
            <td align="center" colspan="4">
            <input  type="button" onclick="submitContents(this);" class="img-button" value=" " />
               <input type="button" class="img-button2" onclick="javascript:doList();" value=" " /></td>
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