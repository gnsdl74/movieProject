<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="UTf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- member-wrap -->
	<div class="member-wrap" align="center">
		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">
				<!-- step-member -->
				<div class="step-member"
					title="step1 약관동의, step2 정보입력, step3 가입완료 단계 중 step2 정보입력 단계">
					<ol>
						<li>
							<p class="step">
								<em>STEP1.</em> <span>약관동의</span>
							</p>
						</li>
						<li>
							<p class="step on">
								<em>STEP2.</em> <span>정보입력</span>
							</p>
						</li>
						<li>
							<p class="step">
								<em>STEP3.</em> <span>가입완료</span>
							</p>
						</li>
					</ol>
				</div>
				<!--// step-member -->

				<!-- info-wrap -->
				<div class="info-wrap">
						<div>
							<label for="name">이름</label>
							<input id="name" type="text" placeholder="이름 입력" required autofocus />
							<br>
							<input id="nameResult" type="hidden" readonly >
						<br>
							<label for="birth">생년월일</label>
							<input id="birth" type="date" min="1920-01-01" max="2020-12-31" required/>
							<br>
							<input id="birthResult" type="hidden" readonly >
						<br>
							<label for="phone">휴대폰 번호</label>
							<input id="phone" type="text" placeholder="전화번호 입력" required />
							<br>
							<input id="phoneResult" type="hidden" readonly >
						<br>
							<label for="id">아이디</label>
							<input id="id" type="text" placeholder="아이디 입력" required />
							<br>
							<input id="idResult" type="hidden" readonly >
						<br>
							<label for="pswd1">비밀번호</label>
							<input id="pswd1" type="password" placeholder="비밀번호 입력" required />
							<br>
							<input id="pswd1Result" type="hidden" readonly >
						<br>
							<label for="pswd2">비밀번호 확인</label>
							<input id="pswd2" type="password" placeholder="비밀번호 확인" required />
							<br>
							<input id="pswd2Result" type="hidden" readonly >
						<br>
							<label for="email">이메일</label><span>(선택)</span>
							<input id="email" type="text" placeholder="선택입력" />
							<br>
							<input id="emailResult" type="hidden" readonly >
						</div>
				</div>
				<!-- // info-wrap -->
				<form id="step-form" action="/welcome" method="post">		
					<input id="w-name" type="hidden" name="welcomeName" />
					<input id="w-id" type="hidden" name="welcomeId" />
					<input id="step2" type="hidden" name="step2" />
				</form>
				<div class="btn-join-member">
					<button id="btn-join" type="button" disabled="disabled">회원가입</button>
				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	// 각 항목을 입력받았을 때, 기준에 맞는지 체크
	// 기준 모두 체크되어 true값을 반환하면 버튼 활성화
	// 버튼 활성화되면 클릭시 submit
	// 에러 메시지 박스를 하나로 만들어야함.
		$(document).ready(function() {
			var flags = {
				nameflag : false,
				birthflag : false,
				idflag : false,
				pswd1flag : false,
				pswd2flag : false,
				emailflag : true
			};
			// 이름에서 blur됐을때
			$("#name").blur(function() {
				var name = $("#name").val();
				if(name == "") {
					$("#nameResult").attr("type", "text");
					$("#nameResult").val("필수 사항입니다.");
					flags.nameflag = false;
				} else {
					$("#nameResult").attr("type", "hidden");
					$("#nameResult").removeAttr("value");
					flags.nameflag = true;
				}
				//user.memberName = name;
				btnJoinCheck(flags);
			}); // end #name.blur()
			
			$("#birth").blur(function() {
				var birth = $("#birth").val();
				if(birth == "") {
					$("#birthResult").attr("type", "text");
					$("#birthResult").val("필수 사항입니다.");
					flags.birthflag = false;
				} else {
					$("#birthResult").attr("type", "hidden");
					$("#birthResult").removeAttr("value");
					flags.birthflag = true;
				}
				//user.memberBirth = birth;
				btnJoinCheck(flags);
			}); // end #birth.blur()
			
			$("#phone").blur(function() {
				var phone = $("#phone").val();
				if(phone == "") {
					$("#phoneResult").attr("type", "text");
					$("#phoneResult").val("필수 사항입니다.");
					flags.phoneflag = false;
				} else {
					// - 를 포함하는지 판단
					if(phone.includes("-")) {
						$("#phoneResult").attr("type", "text");
						$("#phoneResult").val("- 를 제외하고 입력하세요. ");
						flags.phoneflag = false;
					} else {
						// 휴대전화 번호 형식에 맞게 입력했는지 판단
						if(!isCellPhone(phone)) {
							$("#phoneResult").attr("type", "text");
							$("#phoneResult").val("형식에 맞지 않는 번호입니다.");
							flags.phoneflag = false;
						} else {
							$("#phoneResult").attr("type", "hidden");
							$("#phoneResult").removeAttr("value");
							flags.phoneflag = true;
						}
					}
				}
				//user.memberPhone = phone;
				btnJoinCheck(flags);
			}); // end #phone.blur()
			
			$("#id").blur(function() {
				var id = $("#id").val();
				if(id == "") {
					$("#idResult").attr("type", "text");
					$("#idResult").val("필수 사항입니다.");
					flags.idflag = false;
				} else {
					if(!isId(id)) {
						$("#idResult").attr("type", "text");
						$("#idResult").val("영문, 숫자 조합(6~12자)");
						flags.idflag = false;
					} else {
						checkId(id); // 중복확인 함수
					}
				}
				//user.memberId = id;
				btnJoinCheck(flags);
			}); // end #id.blur()
			
			$("#pswd1").blur(function() {
				var pw = $("#pswd1").val();  
				
				if(pw == "") {
					$("#pswd1Result").attr("type", "text");
					$("#pswd1Result").val("필수 사항입니다.");
					flags.pswd1flag = false;
				} else {
					if(!isPw(pw)) {
						$("#pswd1Result").attr("type", "text");
						$("#pswd1Result").val("영문, 숫자, 특수문자 조합(8~16자)");
						flags.pswd1flag = false;
					} else {
						$("#pswd1Result").attr("type", "hidden");
						$("#pswd1Result").removeAttr("value");
						flags.pswd1flag = true;
					}
				}
				btnJoinCheck(flags);
			}); // end #pwsd1.blur()
			
			$("#pswd2").blur(function() {
				var pswd1 = $("#pswd1").val();
				var pswd2 = $("#pswd2").val();
				
				if(pswd2 == "") {
					$("#pswd2Result").attr("type", "text");
					$("#pswd2Result").val("필수 사항입니다.");
					flags.pswd2flag = false;
				} else {
					if(pswd1 != pswd2) {
						$("#pswd2Result").attr("type", "text");
						$("#pswd2Result").val("비밀번호가 일치하지 않습니다.");
						flags.pswd2flag = false;
					} else {
						$("#pswd2Result").attr("type", "hidden");
						$("#pswd2Result").removeAttr("value");
						flags.pswd2flag = true;
					}
				}
				//user.memberPw = pswd2;
				btnJoinCheck(flags);
			}); // end #pswd2.blur()
			
			$("#email").blur(function() {
				var email = $("#email").val();
				if(email != "") {
					if(!isEmail(email)) {
						$("#emailResult").attr("type", "text");
						$("#emailResult").val("이메일 주소를 다시 확인해주세요.");
						flags.emailflag = false;
					} else {
						$("#emailResult").attr("type", "hidden");
						$("#emailResult").removeAttr("value");
						flags.emailflag = true;
					}
				} else {
					$("#emailResult").attr("type", "hidden");
					$("#emailResult").removeAttr("value");
					flags.emailflag = true;
				}
				//user.memberEmail = email;
				btnJoinCheck(flags);
			}); // end #email.blur()
			
			// 회원가입 버튼 클릭했을때
			$("#btn-join").click(function() {
				var name = $("#name").val();
				var birth = $("#birth").val();
				var phone = $("#phone").val();
				var id = $("#id").val();
				var pw = $("#pswd1").val();
				var email = $("#email").val();
				var formData = {
					memberName : name,
					memberBirth : birth,
					memberPhone : phone,
					memberId : id,
					memberPw : pw,
					memberEmail : email
				};
				
				$("#step2").attr("value", "Y");
				var step2 = $("#step2").val();
				// 해당 JSON데이터로 회원 가입
				$.ajax({
					type : "POST",
					url : "/join",
					contentType : "application/json",
					data : JSON.stringify(formData),
					success : function(result) {
						console.log(result);
						if(result == "success") {
							// 회원 가입 성공
							$("#w-name").attr("value", name);
							$("#w-id").attr("value", id);
							$("#step-form").submit();
						} else if (result == "fail") {
							// 회원 가입 실패
							location.href="error.jsp";
						}
					}
				}); // end ajax
				
			}); // end #btn-join.click()
			
			function isCellPhone(phone) {
				// 01?-(3~4)자리-4자리 또는 010-4자리-4자리 형식
				var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
				return regPhone.test(phone);
			} // end isCellPhone()
			
			function isId(id) {
				// 영문과 숫자 조합 6~12자리
				var regId = /^[a-zA-Z0-9][a-zA-Z0-9]{5,11}$/;
				return regId.test(id);
			} // end isId()
			
			function checkId(id) {
				$.ajax({
					type : "GET",
					url : "/checkId",
					data : {"id" : id},
					success : function(result) {
						if(result == "success") {
							$("#idResult").attr("type", "text");
							$("#idResult").val("사용 가능한 아이디입니다.");
							flags.idflag = true;
						} else if(result == "fail") {
							$("#idResult").attr("type", "text");
							$("#idResult").val("이미 사용 중인 아이디입니다.");
							flags.idflag = false;
						}
					}
				}); // end ajax
			} // end checkId()
			
			function isPw(pw) {
				// 영문, 숫자, 특수문자 조합 8~16자리
				var regPw = /^[A-Za-z0-9`\-=\\\[\];",\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
				return regPw.test(pw);
			}
			
			function isEmail(email) {
				// 영문숫자 조합(중간에 -_. 가능) @ 영문숫자(중간에 -_. 가능) . 영문(2~3자)
				var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				return regEmail.test(email);
			}
			
			function btnJoinCheck(flags) {
				// flag가 모두 true면 버튼 활성화
				if(flags.nameflag == true && flags.birthflag == true && flags.idflag == true
						&& flags.pswd1flag == true && flags.pswd2flag == true && flags.emailflag == true) {
					$("#btn-join").attr("disabled", false);
					//console.log(user);
				} else {
					$("#btn-join").attr("disabled", true);
				}
			} // end btnJoinCheck()
			
		}); // end document
	</script>
