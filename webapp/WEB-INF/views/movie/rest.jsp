<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>순위</th>
			<th>영화번호</th>
			<th>관람등급</th>
			<th>영화명</th>
			<th>개봉일</th>
			<th>영화포스터</th>
		</tr>

		<c:if test="${not empty weeklyList }">
			<c:forEach items="${weeklyList }" var="boxoffice">
				<tr>
					<td><c:out value="${boxoffice.key }" /></td>
					<td><c:out value="${boxoffice.value.movieNo }" /></td>
					<td><c:out value="${boxoffice.value.movieAge }" /></td>
					<td><c:out value="${boxoffice.value.movieTitle }" /></td>
					<td><c:out value="${boxoffice.value.movieContent }" /></td>
					<fmt:formatDate value="${boxoffice.value.movieDate }"
						pattern="yyyy.MM.dd" var="regdate" />
					<td><c:out value="${regdate }" /></td>
					<td><c:out value="${boxoffice.value.moviePoster }" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>


</body>
</html>