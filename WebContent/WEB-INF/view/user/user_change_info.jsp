<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   @SuppressWarnings("unchecked")
   HashMap<String,String> rMap = (HashMap<String,String>)request.getAttribute("rMap");

   
   if(rMap==null){
      rMap = new HashMap<String,String>();
   }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function doSubmit(f) {
   if(f.user_id.value == ""){
      alert("���̵� �Է����ּ���");
      f.user_id.focus();
      return false;
   }
   
   if(f.user_name.value == ""){
      alert("�̸��� �Է����ּ���");
      f.user_name.focus();
      return false;
   }
   
   if(f.pwd1.value == ""){
      alert("�н����带 �Է����ּ���");
      f.user_id.focus();
      return false;
   }
   
   if(f.pwd2.value == ""){
      alert("�н����� Ȯ���� �Է����ּ���");
      f.pwd2.focus();
      return false;
   }
   
   if(f.pwd1.value != f.pwd2.value){
      alert("�н������ �н����� Ȯ���� �Էµ� ���� ��ġ���� �ʽ��ϴ�.");
      f.pwd1.focus();
      return false;
   }
   
   if(f.age.value == ""){
      alert("���̸� �Է����ּ���");
      f.age.focus();
      return false;
   }
   
   if(f.age.value > 120){
      alert("120���� �۰� ���̸� �Է��Ͻñ� �ٶ��ϴ�.");
      f.age.focus();
      return false;
   }
   
   var genderCheck = false;
   for(var i=0;i<f.gender.length;i++){
      if(f.gender[i].checked){
         genderCheck=true;
      }
   }
   
   if(genderCheck == false){
      alert("������ �����Ͻñ� �ٶ��ϴ�.");
      f.gender[0].focus();
      return false;
   }
   
   if(f.email1.value == ""){
      alert("�̸����� �Է����ּ���");
      f.email1.focus();
      return false;
   }
   
   var joinPathCheck = false;
   for(var i=0;i<f.join_path.length;i++){
      if(f.join_path[i].checked){
         joinPathCheck = true;
      }
   }
}

function doKeyOnlyNumber(event) {
   event = event || window.event;
   var keyID = (event.which) ? event.which : event.KeyCode;
   
   if((keyID >= 48 && keyID <= 57) || (keyID >=96 && keyID <=105)){
      return true;
   }else{
      return false;
   }
   
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
</style>
</head>
<body>
<h2>ȸ������ ����</h2>
<hr>
<form action="user_change_info_proc.jsp" method="post" name="f" onsubmit="return doSubmit(this);">
   <table border="1" width="600px">
   <col width="150"/>
   <col width="150"/>
   <col width="150"/>
   <col width="150"/>
      <tr>
         <td align="center"><b>* ���̵�</b></td>
         <td align="center"><input type="text" name="user_id" maxlength="8" value="<%=CmmUtil.nvl(rMap.get("USER_ID"))%>" readonly disabled /></td>
         <td align="center"><b>* �̸�</b></td>
         <td align="center"><input type="text" name="user_name" maxlength="10" value="<%=CmmUtil.nvl(rMap.get("USER_NAME"))%>" readonly disabled/></td>
      </tr>
      
      <tr>
         <td align="center"><b>* �н�����</b></td>
         <td align="center"><input type="password" name="pwd1" maxlength="16"/></td>
         <td align="center"><b>* �н�����Ȯ��</b></td>
         <td align="center"><input type="password" name="pwd2" maxlength="16"/></td>
      </tr>
      
      <tr>
         <td align="center"><b>* ����</b></td>
         <td align="center"><input type="text" name="age" maxlength="3" onkeydown="return doKeyOnlyNumber(event);" value="<%=CmmUtil.nvl(rMap.get("AGE")) %>"></td>
         <td align="center"><b>* ����</b></td>
         <td align="center">
            ��<input type="radio" name="gender" value="1"
               <%=CmmUtil.checked(CmmUtil.nvl(rMap.get("GENDER")),"1") %>/>&nbsp;
            ��<input type="radio" name="gender" value="2"
               <%=CmmUtil.checked(CmmUtil.nvl(rMap.get("GENDER")),"2") %>/>
         </td>
      </tr>
      
      <tr>
         <td align="center"><b>* �̸���</b></td>
         <td colspan="3">
            <input type="text" name="email1" maxlength="16" value="<%=CmmUtil.nvl(rMap.get("EMAIL1")) %>"/>@
            <select name="email2">
               <option value="naver.com" 
                  <%=CmmUtil.checked(CmmUtil.nvl(rMap.get("EMAIL2")),"naver.com") %>>naver.com</option>
               <option value="nate.com" 
                  <%=CmmUtil.checked(CmmUtil.nvl(rMap.get("EMAIL2")),"nate.com") %>>nate.com</option>
               <option value="hanmail.com" 
                  <%=CmmUtil.checked(CmmUtil.nvl(rMap.get("EMAIL2")),"hanmail.com") %>>hanmail.com</option>
               <option value="gmail.com" 
                  <%=CmmUtil.checked(CmmUtil.nvl(rMap.get("EMAIL2")),"gmail.com") %>>gmail.com</option>
            </select>
         </td>
      </tr>
      
      <tr>
         <td align="center"><b>�ּ�</b></td>
         <td colspan="3">
            <input type="text" name="addr" maxlength="100" style="width:400px" value="<%=CmmUtil.nvl(rMap.get("ADDR")) %>"/>
         </td>
      </tr>
      <tr>
         <td colspan="4" align="center">
            <input type="submit" class="img-button" value=" " />
         </td>
      </tr>
   </table>
</form>
<b><font color="red">* �� ��.��. �Է��Դϴ�.</font></b><br>
<b><font color="red">���̵�� �̸��� ���� �Ұ����մϴ�.</font></b><br>
</body>
</html>