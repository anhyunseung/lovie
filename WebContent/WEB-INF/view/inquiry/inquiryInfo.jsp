<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO" %>
<%
InquiryDTO rDTO = (InquiryDTO)request.getAttribute("rDTO");

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
<title>문의 글보기</title>
<script type="text/javascript">

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
      div.framebgd
	{
	background-image:url('../img/bg/framebgd.png');
	}
</style>
</head>
<body>
<div class="infot">
      <table border="0" width="100%">
      <tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
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
            <td align="center"><b><%=CmmUtil.nvl(rDTO.getTitle())%></b></td>
            <td align="right">|</td>
            <td align="left"><img src="../img/inquiry/inqs.png"/></td>
            
         </tr>
         <tr>
            <td colspan="3">
               -----------------------------------------------------------------
            </td>
         </tr>
         <tr>
            <td colspan="3">&nbsp;&nbsp;<b><%=CmmUtil.nvl(rDTO.getUser_id()) %></b></td>
            </tr>
            <tr>
            <td colspan="3"><img src="../img/total/emails.png"/>&nbsp; <%=CmmUtil.nvl(rDTO.getEmail1()) %>@<%=CmmUtil.nvl(rDTO.getEmail2()) %><br/><br/></td>
         </tr>
         <tr>
          <td colspan="3" height="600px" valign="top">&nbsp;<%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %></td>
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
</body>
</html>