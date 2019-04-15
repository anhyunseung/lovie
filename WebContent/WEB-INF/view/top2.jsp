<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%
   request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String)session.getAttribute("USER_NO")));
System.out.println("ss_user_id : "+SESSION_USER_ID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요리 레시피</title>

</head>
<body background="../img/book.jpg">
   <table border="1">
      <tr>
         <td colspan="3"></td>
         <td colspan="2" align="right" width="575px">
         <%if(SESSION_USER_ID.equals("")){%>
            <a href="top.do">HOME</a>| 
            <a href="/user/user_login.do" target="ifrMain">로그인</a> | 
            <a href="/user/user_join.do" target="ifrMain">회원가입</a> | 
            <a href="/user/user_id_search.do" target="ifrMain">아이디 찾기</a> | 
            <a href="/user/user_pw_search.do" target="ifrMain">비밀번호 찾기</a>
         <%}else{ %>
            <a href="/user/userInfo.do" target="ifrMain">
         <% out.print(SESSION_USER_ID);%>
               <input type="hidden" name="user_no"
         value="<%= 1002%>"/>
            </a>
            님 어서오세요 &nbsp;
            <a href="top.do">HOME</a> |
            <a href="/user/user_logout.do">로그아웃</a>
         <%} %>
            <br>
         <img src="../img/bg/topbg.png" /></td>
      </tr>
      <tr>
         <td>
            <h1>
               <b>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </b>
            </h1>
         </td>
         <% if(SESSION_USER_ID.equals("Admin")) {%>
         <td align="center"><a href="/user/manageList.do" target="ifrMain"> 
         <img src="../img/User.png"/>
         </a> <br>
         <br> <br>
         <br> <br>
         <br> <a href="/notice/NoticeList.do" target="ifrMain"> 
         <img src="../img/top/notice.png"/>
         </a> <br>
         <br> <br>
         <br> <br>
         <br> <a href="/bbm/bbmList.do" target="ifrMain">
         <img src="../img/top/bbm.png"/>
         </a> <br>
         <br> <br>
         <br> <br>
         <br> <a href="/inquiry/inquiryList.do" target="ifrMain"> 
         <img src="../img/Inquiry.png"/>
         </a></td>
         <% } else { %>
         <td align="center">
         <a href="/notice/NoticeList.do" target="ifrMain"> 
         <img src="../img/top/notice.png"/>
         </a> <br>
         <br> <br>
         <br> <br>
         <br> <a href="/bbm/bbmList.do" target="ifrMain">
         <img src="../img/BBM2.png"/>
         </a> <br>
         <br> <br>
         <br> <br>
         <br> <a href="/inquiry/inquiryList.do" target="ifrMain"> 
         <img src="../img/Inquiry2.png"/>
         </a></td>
         <%} %>
         <td>
            <h1>
               <b> &nbsp;&nbsp;&nbsp; </b>
            </h1>
         </td>
         <td><iframe name="ifrMain" src="" frameborder="1" width="100%"
               height="885" scrolling="auto"></iframe></td>
         <td>&nbsp;&nbsp;</td>
      </tr>
   </table>
</body>