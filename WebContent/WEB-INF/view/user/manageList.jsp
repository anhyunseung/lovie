<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page import="poly.dto.UserDTO" %>
<%
session.setAttribute("url", "/user/manageList.do");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);

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
<%if(SESSION_USER_ID.equals("admin")){
}else{%>
alert("잘못된 접근입니다.");
top.location.href="/top.do";
<%}%>
function doDetail(no){
   location.href="/user/manageInfo.do?user_no="+ no;
}
</script>
<style>
div.framebgt
{
background-image:url('../img/bg/framebgt.png');
}
div.framebgm
{
background-image:url('../img/bg/framebgm.png');
}
div.framebgm1
{
background-image:url('../img/bg/framebgm1.png');
}
div.framebgm2
{
background-image:url('../img/bg/framebgm3.png');
}
div.framebgd
{
background-image:url('../img/bg/framebgd.png');
}
</style>
</head>
<body background="../img/top/bg.png">
<div>
	<table border="0" height="3000px" width="1500px" >
		<tr>
			<td width="48px" height="167px"><br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br></td>
			<td colspan="4" align="right" width="1500px">
			<img src="../img/bg/top.png" />
			<br>
			<a href="/top.do">
				<img src="../img/common/Logo.png"/>
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/notice/NoticeList.do"
				target="ifrMain">
				<img src="../img/top/notice.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/inquiry/inquiryList.do" target="ifrMain"> 
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
				<a href="/user/manageList.do" target="ifrMain"> 
				<span style=" font: italic 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" target="ifrMain"> 
				<span style=" font: italic 1.5em Georgia, serif ;">
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
			<input type="submit" class="img-button" value=" "/>
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
				<a href="/user/user_join2.do" target="ifrMain">
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
<div class="framebgt">
   <table border="0" width="100%">
      <tr>
         <td align="center"><br>
         <a href="/user/manageList.do">
               <img src="../img/user/userlit.png" />
               </a>
            </td>
      </tr>
   </table>
   </div>
   <div class="framebgm1">
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
      </table>
   </div>
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
      <div class="framebgm2">
      <table border="0" width="100%">
      <tr>
         <td align="center" width="100" >
               <%=CmmUtil.nvl(rDTO.getUser_name())%>
               </td>
         <td align="center"width="150" ><a
            href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getUser_no())%>');">
            <%=CmmUtil.nvl(rDTO.getUser_id())%>
            </a></td>
         <td align="center"width="200" ><%=CmmUtil.nvl(rDTO.getTel_1())%>&nbsp;-&nbsp;
            <%=CmmUtil.nvl(rDTO.getTel_2())%>&nbsp;-&nbsp; 
            <%=CmmUtil.nvl(rDTO.getTel_3())%></td>
      </tr>
      <tr>
      <td colspan="3">
      <hr>
      </td>
      </tr>
      </table>
</div>
      <%
         }
      %>
<div class="framebgm">
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
   </td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</body>
</html>