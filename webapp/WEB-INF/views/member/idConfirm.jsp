<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	${findMember.memberName }님!
	찾으시는 아이디는 <h2>${findMember.memberId }</h2>입니다.
	<jsp:include page="../footer.jsp"></jsp:include>
