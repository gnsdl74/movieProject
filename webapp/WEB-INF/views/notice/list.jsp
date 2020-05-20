<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- fmt : formatter, 출력형식을 바꿔줌 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
table, th, td {
	border-style: solid;
	border-width: 1px;
	text-align: center;
}

ul {
	list-style-type: none;
}

li {
	display: inline-block;
}
</style>
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div align="center">
		<h1>공지 사항</h1>
	</div>
	<div class="notice_box" align="center">
		<a href="register"><input type="button" value="글작성" /></a> <br>
		<br>
		<div class="notice_list">
			<table>
				<thead>
					<tr>
						<th style="width: 60px;">번호</th>
						<th style="width: 700px;">제목</th>
						<th style="width: 100px;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" varStatus="vs" items="${noticeList }">
						<tr>
							<td>${vs.count }</td>
							<td><a class="goToDetail" href="${vo.noticeNo }">${vo.noticeTitle }</a></td>
							<!-- vo.regdate를 pattern 형식으로 바꾸어 var에 저장 -->
							<fmt:formatDate value="${vo.noticeDate }" pattern="yyyy.MM.dd"
								var="regdate" />
							<td>${regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<hr>
		<div>
			<ul class="pager">
				<c:if test="${pageMaker.hasPrev }">
					<li><a href="${pageMaker.startPageNo - 1 }">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPageNo }"
					end="${pageMaker.endPageNo }" var="num">
					<li><a href="${num }">${num }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.hasNext }">
					<li><a href="${pageMaker.endPageNo + 1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<div>
		<form id="pagingForm" style="display: none;">
			<input type="text" name="page" value="${pageMaker.criteria.page }" />
			<input type="text" name="noticeNo" />
		</form>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(document).ready(function() {
			// 클릭한 a태그의 정보를 가져오는 코드
			$(".pager li a").click(function() {
				// .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
				event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
				var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
				console.log(targetPage);

				var frm = $('#pagingForm'); // form의 정보를 frm에 저장
				frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
				frm.attr('action', 'list'); // form에 action 속성 추가
				frm.attr('method', 'get'); // form에 method 속성 추가
				frm.submit(); // form 데이터 전송
			}); // end click()

			$('.goToDetail').click(function() {
				event.preventDefault();
				var noticeNo = $(this).attr('href'); // 클릭한 게시물의 글번호 저장
				var frm = $('#pagingForm'); // id가 pagingForm인 객체 정보 저장
				frm.attr('action', 'detail'); // detail로 이동
				frm.attr('method', 'get'); // 이동시 method는 get방식
				frm.find('[name="noticeNo"]').val(noticeNo); // pagingForm 객체에서 name이 noticeNo인 객체를 찾고 value를 noticeNo로 저장
				frm.submit(); // 제출
			}) // end click()

			// register에서 넘어온 insert_result 데이터를 바탕으로 alert 처리
			if ('${insert_result}' === 'success') {
				alert('새 글 작성 성공');
			} else if ('${insert_result}' === 'fail') {
				alert('새 글 작성 실패');
			}
		}); // end document
	</script>
