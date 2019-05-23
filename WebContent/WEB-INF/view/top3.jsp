<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> escape, encodeURI, encodeURIComponent </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<style type="text/css">
.field
{
	width:100%;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
function enc()
{
	var s_in = document.getElementById("in").value;
	var s_esc			= escape(s_in);
	var s_encUri		= encodeURI(s_in);
	var s_encUriComp	= encodeURIComponent(s_in);

	document.getElementById("esc").value = s_esc;
	document.getElementById("encUri").value = s_encUri
	document.getElementById("encUriComp").value = s_encUriComp;
}
</SCRIPT>
</HEAD>


<BODY>
<textarea id="in" class="field">ASCII 이외에 한글이나 특수문자 등이 섞이면?</textarea>
<button onclick="enc();">인코딩하기</button><br/>
escape
<textarea id="esc" class="field">ASCII 이외에 한글이나 특수문자 등이 섞이면?</textarea>
encodeURI
<textarea id="encUri" class="field">ASCII 이외에 한글이나 특수문자 등이 섞이면?</textarea>
encodeURIComponent
<textarea id="encUriComp" class="field">ASCII 이외에 한글이나 특수문자 등이 섞이면?</textarea>
</BODY>
</HTML>
