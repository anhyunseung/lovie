<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO" %>
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

function doEdit(){
    location.href="/user/manageEditInfo.do?user_no=<%=CmmUtil.nvl(rDTO.getUser_no())%>";
}

function doDelete(){
    if(confirm("정말로 삭제하시겠습니까?")){
       location.href="/user/manageDelete.do?user_no=<%=CmmUtil.nvl(rDTO.getUser_no())%>";
 }
}
function doList(){
 location.href="/user/manageList.do";
}
function doId(){
	 location.href="/user/manageList.do";
	}

</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/button/del.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button2 {
        background: url( "../img/button/rewri.png" ) no-repeat;
        border: none;
        height: 40px;
        width: 52px;
        cursor: pointer;
      }
      input {
        vertical-align: middle;
      }
      input.img-button3 {
        background: url( "../img/button/sign.png" ) no-repeat;
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
<h2><img src="../img/user/usert.png" /></h2>
</td>
</tr>
</table><br><br><br>
   <table width="500px">
   <col width="100px"/>
   <col width="200px"/>
      <tr>
         <td align="center"><br><img src="../img/user/userjoin/name.png"/></td>
         <td><br><%=CmmUtil.nvl(rDTO.getUser_name())%></td>
      </tr>
         <tr>
<td>
<br>
</td>
   </tr>
      <tr>
      <td align="center"><br><img src="../img/top/id.png"/></td>
         <td><br><%=CmmUtil.nvl(rDTO.getUser_id())%>
         </td>
      </tr>
      <tr>
      <td colspan="2"> <br>
      </td>
      </tr>
      <tr>
         <td align="center"><br><img src="../img/top/pw.png"/></td>
         <td><br><%=CmmUtil.nvl(rDTO.getPassword())%></td>
      </tr>
      <tr>
      <td colspan="2"> <br>
      </td>
      </tr>    
      <tr>
         <td align="center"><br><img src="../img/user/userjoin/email.png"/></td>
         <td colspan="2">
         <br>
            <%=CmmUtil.nvl(rDTO.getEmail1())%>&nbsp;<b>@</b>
            <%=CmmUtil.nvl(rDTO.getEmail2())%>
         </td>
      </tr>
      <tr>
      <td align="center"><br><br><img src="../img/user/userjoin/phone.png"/></td>
      <td><br><br>
         <%=CmmUtil.nvl(rDTO.getTel_1())%>&nbsp;<b>-</b>
         <%=CmmUtil.nvl(rDTO.getTel_2())%>&nbsp;<b>-</b>
         <%=CmmUtil.nvl(rDTO.getTel_3())%>
      </td>
   </tr>   
   <tr>
         <td align="center"><br><br><img src="../img/user/userjoin/birth.png"/></td>
         <td><br><br>
         <%=CmmUtil.nvl(rDTO.getBirthday())%>
         </td>
      </tr>         
      <tr>
         <td colspan="5" align="center"><br><br>
         <br>
            <input type="button" class="img-button" onclick="javascript:doDelete();" value=" " />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="img-button2" onclick="javascript:doEdit();" value=" " />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" "/>
         </td>
      </tr>
   </table>
</body>
</html>