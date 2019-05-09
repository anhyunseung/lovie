<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URL" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
session.setAttribute("url", "/top.do");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);

String targetDt =	request.getParameter("targetDt")==null?"20190101":"20190508";
String itemPerPage =request.getParameter("itemPerPage")==null?"70":request.getParameter("itemPerPage"); 
String key = "257a360ca175e71f65d605e4238a4d90";
KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); 
String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, "","", ""); 
ObjectMapper mapper = new ObjectMapper(); 
HashMap<String, Object> map = mapper.readValue(dailyResponse, HashMap.class);

Iterator<String> mapIter = map.keySet().iterator();
String movie="";
String key2="";
Object value="";
while(mapIter.hasNext()){
key2 = mapIter.next(); 
value = map.get( key2 );
}
request.setAttribute("map",map);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Let's see the movie! : Lovie</title>
</head>
<div>
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
	<table border="1" >
		<tr>
			<td>순위</td>
			<td>영화명</td>
		</tr>
		<c:if test="${not empty map.boxOfficeResult.dailyBoxOfficeList}">
			<c:forEach items="${map.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
				<tr>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.movieNm }" /></td>
				</tr>
			</c:forEach>
			
		</c:if>
	</table>
	</form>
</div>
</body>
</html>
