<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="shortcut icon" href="resources/img/tiger.jpg">
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
					title="step1 약관동의, step2 정보입력, step3 가입완료 단계 중 step1 약관동의 단계">
					<ol>
						<li>
							<p class="step on">
								<em>STEP1.</em> <span>약관동의</span>
							</p>
						</li>
						<li>
							<p class="step">
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

				<p class="page-info-txt">
					<strong>약관동의 및 정보활용동의</strong><br>
					<span>Cannes 서비스 이용을 위한 약관에 동의해주세요.</span>
				</p>

				<!-- member-rule-agree -->
				<div class="member-rule-agree">
					<div class="all-chk">
						<input type="checkbox" id="chkAll" /> <label for="chkAll">전체동의</label>
					</div>

					<div class="block">
						<div class="chk">
							<input type="checkbox" id="chkUtilClau" /> <label
								for="chkUtilClau" class="must">서비스 이용약관(필수)</label>
						</div>

						<div id="utilClau" class="scroll" tabindex="0"></div>
					</div>

					<div class="block">
						<div class="chk">
							<input type="checkbox" id="chkPersonInfo" /> <label
								for="chkPersonInfo" class="must">개인정보 취급방침(필수)</label>
						</div>

						<div id="personInfo" class="scroll" tabindex="0"></div>
					</div>

					<div class="block">
						<div class="chk">
							<input type="checkbox" id="chkInfoOfr" /> <label
								for="chkInfoOfr">제휴 모바일 멤버십 서비스 이용을 위한 제 3자 제공에 관한
								안내(선택)</label>
						</div>

						<div id="infoOfr" class="scroll" tabindex="0"></div>
					</div>

					<div class="block">
						<div class="chk">
							<input type="checkbox" id="chkMarketInfo" /> <label
								for="chkMarketInfo">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</label>
						</div>

						<div id="marketInfo" class="scroll x-scroll" tabindex="0"></div>
					</div>
				</div>
				<!--// member-rule-agree -->
				
				<div class="btn-member-bottom">
					<button id="btnClauAgree" type="button" class="button purple large"	disabled="disabled">확인</button>
					<form id="step-form" action="/joinInfo" method="post">
						<input id="step1" type="hidden" name="step1">
					</form>
				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->
	
	<jsp:include page="../footer.jsp"></jsp:include>

	<script type="text/javascript">
	$(document).ready(function() {
		
		// 전체 동의 체크
		$("#chkAll").change(function(){
			if($("#chkAll").is(":checked")) {
				$("#chkUtilClau").prop('checked', true);
				$("#chkPersonInfo").prop('checked', true);
				$("#chkInfoOfr").prop('checked', true);
				$("#chkMarketInfo").prop('checked', true);
				$("#btnClauAgree").attr("disabled", false);
				$("#step1").attr("value", "Y");
			}
			// 전체 동의 미체크
			else {
				$("#chkUtilClau").prop('checked', false);
				$("#chkPersonInfo").prop('checked', false);
				$("#chkInfoOfr").prop('checked', false);
				$("#chkMarketInfo").prop('checked', false);
				$("#btnClauAgree").attr("disabled", true);
				$("#step1").attr("value", "");
			}
		});
		
		//이용약관
		$("#chkUtilClau").change(function(){
			if(!$("#chkUtilClau").is(":checked")){
				if($("#chkAll").is(":checked")) {
					$("#chkAll").prop('checked', false);
				}
			}

			btnClauAgreeCheck();

			btnClauAgreeAll();
		});


		//개인정보수집
		$("#chkPersonInfo").change(function(){
			if(!$("#chkPersonInfo").is(":checked")){
				if($("#chkAll").is(":checked")) {
					$("#chkAll").prop('checked', false);
				}
			}

			btnClauAgreeCheck();

			btnClauAgreeAll();
		});

		//제3자정보제공
		$("#chkInfoOfr").change(function(){
			if(!$("#chkInfoOfr").is(":checked")){
				if($("#chkAll").is(":checked")) {
					$("#chkAll").prop('checked', false);
				}
			}

			btnClauAgreeCheck();

			btnClauAgreeAll();
		});

		//마케팅활용정보수집
		$("#chkMarketInfo").change(function(){
			if(!$("#chkMarketInfo").is(":checked")){
				if($("#chkAll").is(":checked")) {
					$("#chkAll").prop('checked', false);
				}
			}

			btnClauAgreeCheck();

			btnClauAgreeAll();
		});

		//확인
		$("#btnClauAgree").click(function(){
			$("#step-form").submit();
		});
		
		function btnClauAgreeCheck() {
			if($("#chkUtilClau").is(":checked")
					&& $("#chkPersonInfo").is(":checked")) {
				$("#btnClauAgree").attr("disabled", false);
				$("#step1").attr("value", "Y");
			}
			else {
				$("#btnClauAgree").attr("disabled", true);
				$("#step1").attr("value", "");
			}
		} // end btnClauAgreeCheck()
		
		function btnClauAgreeAll() {
			if($("#chkUtilClau").is(":checked")
					&& $("#chkPersonInfo").is(":checked")
					&& $("#chkInfoOfr").is(":checked")
					&& $("#chkMarketInfo").is(":checked")) {
				$("#chkAll").prop('checked', true);
			}
		} // end btnVlauAgreeAll()
		
	}); // end document
	</script>
</body>
</html>