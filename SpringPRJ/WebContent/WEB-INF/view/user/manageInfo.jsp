<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO" %>
<%
UserDTO rDTO = (UserDTO)request.getAttribute("rDTO");

//������ ������ ���ҷ��Դٸ�, ��ü ����
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
    if(confirm("������ �����Ͻðڽ��ϱ�?")){
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
        background: url( "../img/del.png" ) no-repeat;
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
         <td align="center"><br><img src="../img/pw.png"/></td>
         <td><br><%=CmmUtil.nvl(rDTO.getPassword())%></td>
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
            <input type="button" class="img-button" onclick="javascript:doDelete();" value=" " />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="img-button2" onclick="javascript:doEdit();" value=" " />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="img-button3" onclick="javascript:doList();" value=" "/>
         </td>
      </tr>
   </table>
</body>
</html>