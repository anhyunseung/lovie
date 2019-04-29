<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
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
			<td>개봉일</td>
			<td>매출액</td>
			<td>매출액점유율</td>
			<td>매출액증감(전일대비)</td>
			<td>누적매출액</td>
			<td>관객수</td>
			<td>관객수증감(전일대비)</td>
			<td>누적관객수</td>
			<td>스크린수</td>
			<td>상영횟수</td>
		</tr>
		<c:if test="${not empty map.boxOfficeResult.dailyBoxOfficeList}">
			<c:forEach items="${map.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
				<tr>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.movieNm }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.rank }" /></td>
				</tr>
			</c:forEach>
			
		</c:if>
	</table>
	</form>
</div>
</body>
</html>
