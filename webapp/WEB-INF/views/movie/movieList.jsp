<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container" align="center">
		<div class="page-util">
			<div class="location">
				<span>Home</span> <a href="/movie" title="영화 페이지로 이동">영화</a> <a
					href="/movie" title="전체영화 페이지로 이동">전체영화</a>
			</div>
		</div>
		<h1>전체 영화</h1>
		<div class="movie-list">
			<ol class="clearfix">
				<c:if test="${not empty movieAll }">
					<c:forEach items="${movieAll }" var="movie" varStatus="varstatus">
						<li class="poster" style="background-image: url('${movie.moviePoster}'); background-repeat: no-repeat; background-position: center; width: 350px; height: 400px; background-size: auto 100%; float: left;">
						<input type="hidden" name="movieNo" value="${movie.movieNo }" />
							<p>${movie.movieAge }</p>
							<p>${movie.movieTitle }</p> <fmt:formatDate
								value="${movie.movieDate }" pattern="yyyy.MM.dd" var="regdate" />
							<p>${regdate }</p>
						</li>
					</c:forEach>
				</c:if>

			</ol>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>