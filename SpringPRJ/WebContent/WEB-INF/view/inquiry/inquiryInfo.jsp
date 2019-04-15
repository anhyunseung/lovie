<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO" %>
<%
InquiryDTO rDTO = (InquiryDTO)request.getAttribute("rDTO");

//������ ������ ���ҷ��Դٸ�, ��ü ����
if (rDTO==null){
   rDTO = new InquiryDTO();

}

String ss_user_id = CmmUtil.nvl((String)session.getAttribute("USER_ID"));

//������ �ۼ��� �۸� ���� �����ϵ��� �ϱ�(1:�ۼ��� �ƴ� / 2: ������ �ۼ��� �� / 3: �α��ξ���)
int edit = 1;

//�α��� ���ߴٸ�....
if (ss_user_id.equals("")){
   edit = 3;
   
//������ �ۼ��� ���̸� 2�� �ǵ��� ����
}else if (ss_user_id.equals(CmmUtil.nvl(rDTO.getUser_id()))){
   edit = 2;
   
}

System.out.println("user_id : "+ CmmUtil.nvl(rDTO.getUser_id()));
System.out.println("ss_user_id : "+ss_user_id);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �ۺ���</title>
<script type="text/javascript">

function doEdit(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="admin"){
      
      location.href="/inquiry/inquiryEditInfo.do?inq_seq=<%=CmmUtil.nvl(rDTO.getinq_seq())%>";
   
   }else if ("<%=edit%>"==3){
      alert("�α��� �Ͻñ� �ٶ��ϴ�.");
      top.location.href="/top.do";
      
      
   }else{
      alert("������ �ۼ��� �۸� ���� �����մϴ�.")
   }
}

function doDelete(){
   if ("<%=edit%>"==2 || "<%=ss_user_id%>"=="admin"){
      if(confirm("������ �����Ͻðڽ��ϱ�?")){
         location.href="/inquiry/inquiryDelete.do?inq_seq=<%=CmmUtil.nvl(rDTO.getinq_seq())%>";
   }else if ("<%=edit%>"==3){
      alert("�α��� �Ͻñ� �ٶ��ϴ�.");
      location.href="/user/user_login.do";
   }
}else {
   alert("������ �ۼ��� �۸� ���� �����մϴ�.")
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
                  div.infot{
      background-image: url('../img/infot.png');
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
            <td align="left"><img src="../img/inqs.png"/></td>
            
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
            <td colspan="3"><img src="../img/emails.png"/>&nbsp; <%=CmmUtil.nvl(rDTO.getEmail1()) %>@<%=CmmUtil.nvl(rDTO.getEmail2()) %><br/><br/></td>
         </tr>
         <tr>
          <td colspan="3" height="600px" valign="top">&nbsp;<%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %></td>
       </tr>
       <tr>
          <td colspan="3"><br/>
             -----------------------------------------------------------------
          </td>
       </tr>
       </table>
			</div>
			<table>
      </table>
</body>
</html>