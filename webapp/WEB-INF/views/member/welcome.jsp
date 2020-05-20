<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div align="center">
		<h1>환영합니다 !</h1>
		<p>${name }님, 회원가입을 축하합니다.<br>
		Cannes에 등록하신 아이디는 <b style="color: red;">${id }</b>입니다.
		</p>
		<br>
		<a href="/main">시작하기</a>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
