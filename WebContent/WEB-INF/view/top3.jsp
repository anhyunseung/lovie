<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Let's see the movie! : Lovie</title>
</head>
<div>
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
	<table border="1" >
		<tr>
			<td>����</td>
			<td>��ȭ��</td>
			<td>������</td>
			<td>�����</td>
			<td>�����������</td>
			<td>���������(���ϴ��)</td>
			<td>���������</td>
			<td>������</td>
			<td>����������(���ϴ��)</td>
			<td>����������</td>
			<td>��ũ����</td>
			<td>��Ƚ��</td>
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