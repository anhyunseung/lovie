<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
   
UserDTO rDTO = (UserDTO)request.getAttribute("rDTO");

//공지글 정보를 못불러왔다면, 객체 생성
if (rDTO==null){
 rDTO = new UserDTO();

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
<%if(CmmUtil.nvl(rDTO.getUser_id())==null){%>
alert("잘못된 접근입니다.");
top.location.href="/top.do";
<%}%>
function doEdit(){
    location.href="/user/userEditInfo.do?user_no=<%=CmmUtil.nvl(rDTO.getUser_no())%>";
}
function doTop(){
    top.location.href="/top.do";
}

function doDelete(){
    if(confirm("정말로 탈퇴하시겠습니까?")){
       location.href="/user/userDelete.do?user_no=<%=CmmUtil.nvl(rDTO.getUser_no())%>";
 }
}

function doDetail(no){
	   location.href="/user/userInfo.do?user_no="+ no;
	}
</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/out.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/rewri.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button3 {
        background: url( "../img/sign.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
</style>
</head>
<body>
<table border="0" width="100%">
<tr>
<td align="center">
<br>
<h2><img src="../img/usert.png" /></h2>
</td>
</tr>
</table><br><br><br>
   <table width="500px">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="center"><br><img src="../img/name.png"/></td>
         <td><br><%=CmmUtil.nvl(rDTO.getUser_name())%></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="center"><br><img src="../img/Id.png"/></td>
         <td><br><%=CmmUtil.nvl(rDTO.getUser_id())%>
         </td>
      </tr>
      <tr>
      <td colspan="2"> <br>
      </td>
      </tr>    
      <tr>
         <td align="center"><br><img src="../img/email.png"/></td>
         <td colspan="2">
         <br>
            <%=CmmUtil.nvl(rDTO.getEmail1())%>&nbsp;<b>@</b>
            <%=CmmUtil.nvl(rDTO.getEmail2())%>
         </td>
      </tr>
      <tr>
      <td align="center"><br><br><img src="../img/phone.png"/></td>
      <td><br><br>
         <%=CmmUtil.nvl(rDTO.getTel_1())%>&nbsp;<b>-</b>
         <%=CmmUtil.nvl(rDTO.getTel_2())%>&nbsp;<b>-</b>
         <%=CmmUtil.nvl(rDTO.getTel_3())%>
      </td>
   </tr>   
   <tr>
         <td align="center"><br><br><img src="../img/birth.png"/></td>
         <td><br><br>
         <%=CmmUtil.nvl(rDTO.getBirthday())%>
         </td>
      </tr>         
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
            <a href="javascript:doDelete();">
            <input type="button" class="img-button" value=" " /></a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="javascript:doEdit();">
            <input type="button" class="img-button2" value=" " /></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:doTop();">
            <input type="button" class="img-button3" value=" "/>
            </a>
         </td>
      </tr>
   </table>
</body>
</html>