<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div align="center">
		<p>${idByNewPw }님의 새로운 비밀번호를 입력해주세요 !</p>
		<form id="frm" action="/newPwUpdate" method="post">
			<input type="hidden" name="memberId" value="${idByNewPw }">
			<table>
				<tr>
					<th>비밀번호</th>
					<td>
						<input id="newPw" name="memberPw" type="password" placeholder="비밀번호 입력">
						<label id="pwError"></label>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input id="newPwCheck" type="password" placeholder="비밀번호 확인">
						<label id="pwCheckError"></label>
					</td>
				</tr>
			</table>
			<button id="btnPwSend" type="button" disabled>비밀번호 변경</button>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var validPw = "N";
			var validPwCheck = "N";
			
			// 비밀번호 입력시
			$("#newPw").on("keyup", function(e) {
				var inputPw = $("#newPw").val();
				if(fn_pwCheck(inputPw)) {
					validPw = "Y";
					$("#pwError").text("");
				} else {
					validPw = "N";
					$("#pwError").text("영문, 숫자, 특수문자 조합(8~16자)");
				}
				
				if(fn_btnPwSend()) {
					if(e.keyCode == 13) {
						$("#btnPwSend").click();
					}
				} else {
					if(e.keyCode == 13) {
						$("#newPwCheck").focus();
					}
				}
			}); // end newPw keyup()
			
			// 비밀번호와 비밀번호 확인
			$("#newPwCheck").on("keyup", function(e) {
				// 입력한 비밀번호와 비밀번호 확인이 같은지
				var inputPw = $("#newPw").val();
				var inputPwCheck = $("#newPwCheck").val();
				
				if(inputPw == inputPwCheck) {
					validPwCheck = "Y";
					$("#pwCheckError").text("");
				} else {
					validPwCheck = "N";
					$("#pwCheckError").text("비밀번호가 일치하지 않습니다.");
				}
				
				if(fn_btnPwSend()) {
					if(e.keyCode == 13) {
						$("#btnPwSend").click();
					}
				}
			}); // end newPwCheck keyup()
			
			// 비밀번호 변경 클릭시 데이터 제출
			$("#btnPwSend").click(function() {
				$("#frm").submit();
			}); // end btnPwSend click()
			
			// 비밀번호 형식이 맞는지 확인
			function fn_pwCheck(inputPw) {
				var regPw = /^[A-Za-z0-9`\-=\\\[\];",\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
				return regPw.test(inputPw);
			} // end fn_pWCheck()
			
			// 비밀번호와 비밀번호 확인의 값이 같으면 비밀번호 변경 활성화
			function fn_btnPwSend() {
				if(validPw == "Y" && validPwCheck == "Y") {
					$("#btnPwSend").attr("disabled", false);
				} else {
					$("#btnPwSend").attr("disabled", true);
				}
			} // end fn_btnPwSend()
		}); // end document()
	</script>