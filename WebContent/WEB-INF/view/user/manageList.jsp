<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page import="poly.dto.UserDTO" %>
<%
	List<UserDTO> rList = (List<UserDTO>)request.getAttribute("rList");
int count2 = (int)request.getAttribute("count");

   if (rList == null) {
      rList = new ArrayList<UserDTO>();

   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function doDetail(no){
   location.href="/user/manageInfo.do?user_no="+ no;
}
</script>
</head>
<body>
   <table border="0" width="100%">
      <tr>
         <td align="center"><br>
         <a href="/user/manageList.do">
               <img src="../img/user/userlit.png" />
               </a>
            </td>
      </tr>
   </table>
   <table border="0" width="100%">
      <tr>
         <td width="100" align="center"><img src="../img/user/userpw/names.png"/></td>
         <td width="150" align="center"><img src="../img/user/userjoin/ids.png"/></td>
         <td width="200" align="center"><img src="../img/user/userpw/phs.png"/></td>
      </tr>
         <tr>
   <td colspan="4">
   <hr>
   </td>
   </tr>
      <%
      int a=rList.size();
      int b=9;
      int c=a/20;
      int d=a-c*20;
      int e=rList.size()/20;
      if(rList.size()>20){
    		a=20;
    	}
    	if(count2==c){
    		a=d;
    	}
    	for (int i=0;i<a;i++){
    		b--;
    	   UserDTO rDTO = rList.get(i);

    	   if (rDTO==null){
    	      rDTO = new UserDTO();
    	   }
      %>
      <tr>
         <td align="center">
               <%=CmmUtil.nvl(rDTO.getUser_name())%>
               </td>
         <td align="center"><a
            href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getUser_no())%>');">
            <%=CmmUtil.nvl(rDTO.getUser_id())%>
            </a></td>
         <td align="center"><%=CmmUtil.nvl(rDTO.getTel_1())%>&nbsp;-&nbsp;
            <%=CmmUtil.nvl(rDTO.getTel_2())%>&nbsp;-&nbsp; 
            <%=CmmUtil.nvl(rDTO.getTel_3())%></td>
      </tr>
      <tr>
      <td colspan="3">
      <hr>
      </td>
      </tr>
      <%
         }
      %>
   </table>
   
   <table border="0" width="100%">
      <tr>
   <td align="center">
   <%int line=0; 
   if(rList.size()>=200 && rList.size()<=1999){
		c=rList.size()/200;
	}else if(rList.size()>=2000 && rList.size()<=19999){
		c=rList.size()/2000;
	}else if(rList.size()>=20000 && rList.size()<=199999){
		c=rList.size()/20000;
	}else{
		c=rList.size()/20;
	}
   if(count2/10==0){ 
	   int q=1;
	   if(rList.size()>200){
		  q=10;
	   }else{
		   q=rList.size()/20+1;
	   }
	   count2=count2+1;
   for(line=1;line<=q;line++){
   %>
   <%if(count2==line){%>
   &nbsp;
   <a href="manageList.do?count=<%=line%>">
   <span style=" color: white; background-color:red ">
   <b>
   <%=line%>
   </b>
   </span>
   </a>
   <%}else{ %>
   &nbsp;
   <a href="manageList.do?count=<%=line%>">
   <span style=" color: black">
   <b>
   <%=line%>
   </b>
   </span>
   </a>
   <%} %>
   <%} 
   if(rList.size()>200){
   %>
   &nbsp;
   <a href="manageList.do?count=<%=11%>">
   <span style=" color: black; background-color:gray">
   <b>></b>
   </span>
</a>
   <%}}else if(count2/10==c){
   int color=count2+1;
   %>
   &nbsp;
	<a href="manageList.do?count=<%=count2/10*10-9%>">
	<span style=" color: black; background-color:gray">
   <b><</b>
   </span>
	</a>
	<%
   for(line=count2/10*10+1;line<=e+1;line++){
	%>
	<%if(color==line){%>
	&nbsp;
   <a href="manageList.do?count=<%=line%>">
   <span style=" color: white; background-color:red">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%}else{ %>
   &nbsp;
   <a href="manageList.do?count=<%=line%>">
   <span style=" color: black">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%} %>
	<%}%>
   <%}else{
	   int color=count2+1;
   %>
   &nbsp;
   <a href="manageList.do?count=<%=count2/10*10-9%>">
   <span style=" color: black; background-color:gray">
   <b><</b>
   </span>
	</a>
   <% 
	   for(line=count2/10*10+1;line<=count2/10*10+10;line++){
   %>
   
   <%if(color==line){%>
   &nbsp;
   <a href="manageList.do?count=<%=line%>">
   <span style=" color: white; background-color:red">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%}else{ %>
   &nbsp;
   <a href="manageList.do?count=<%=line%>">
   <span style=" color: black">
   <b>
   <%=line %>
   </b>
   </span>
   </a>
   <%} %>
   <%} %>
   &nbsp;
   <a href="manageList.do?count=<%=count2/10*10+11%>">
   <span style=" color: black; background-color:gray">
   <b>></b>
   </span>
	</a>
<%} %>
   </td>
   </tr>
</table>
</body>
</html>