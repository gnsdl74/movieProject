<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/booking.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
li { list-style: none
 }

.area {
	padding: 0 20px;
}

.sub-location {
	padding: 15px;
	background: #f8f8fa;
	font-size: 16px;
	color: #444;
	line-height: 16px;
}

.sub-location-inner {
	max-width: 1100px;
	margin: 0 auto;
}

.sub-location p {
	display: inline-block;
	vertical-align: middle;
}

.sub-location i {
	display: inline-block;
	vertical-align: middle;
	font-size: 18px;
	line-height: 16px;
}

.sub-reservation-tit p {
	font-size: 22px;
	line-height: 27px;
	padding: 40px 0 25px;
	text-align: left;
	color: #333;
	max-width: 1100px;
	margin: 0 auto;
}

.reservation-date {
	position: relative;
	height: 40px;
	border-bottom: 1px solid #d8d9db;
}
.reservation-date-inner {position: relative; margin-right: 40px;}

.date-btn.date-prev-btn {
	left: 20px;
}

.date-btn.date-next-btn {
	right: 20px;
}

.date-btn-list {
	display: block;
	padding: 0 40px;
}

.date-btn-list button {
	display: inline-block;
	vertical-align: middle;
	margin: 0 10px;
	font-size: 16px;
	line-height: 40px;
}

.frame-main {
	margin-bottom: 100px;
	width: 1100px;
	border: 1px solid #d8d9db;
	border-top: 1px solid #555;
}

.frame-main-body {
	border-top: 0;
}

.frame-main-body, .movie-frame, .schedule-frame {
	position: static;
}






  .seat {
            width: 35px;
            height: 35px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
</style>




</head>
<body>
	<!-- Header -->

	<jsp:include page="../header.jsp"></jsp:include>

	<!-- // Header -->
	<!-- frame(여백포함) div -->
	<div>

		<!-- 예매 > 빠른예매 div  -->
		<div class="sub-location">
			<div class="sub-location-inner">
				<i class="material-icons">&#xe88a;</i>
				<p>> 예매 > 빠른예매</p>
			</div>
		</div>
		<!-- // 예매 > 빠른예매 div  -->

		<!-- frame -->
		<div class="frame" align="center">

			<div class="area">

				<!-- 빠른예매 div -->
				<div class="sub-reservation-tit">
					<p>빠른예매</p>
				</div>
				<!-- // 빠른예매 div -->

				<!-- frame-main -->
				<div class="frame-main">
				<div>관람인원선택(최대4매가능)</div>
					<!-- 날짜 선택 -->
					<div class="reservation-date">성인 <input type="number" readonly="readonly"> 청소년 <input type="number" readonly="readonly"></div>
					<!-- // 날짜 선택 -->
					<!-- 영화,시간 -->
					<div class="frame-main-body clearfix">
						 <div class="seat-wrapper"></div>
						
					</div>
					<!-- // 영화,시간 -->

				</div>
				<!-- // frame-main -->

			</div>

		</div>
		<!-- // frame -->

	</div>
	<!-- // frame(여백포함) div -->
	<!-- Footer -->

	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- // Footer -->
	
	<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let i = 0; i < 10; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 1; j <= 10; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }

    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        } else if (i === 7) {
            input.value = "H" + j;
        } else if (i === 8) {
            input.value = "I" + j;
        } else if (i === 9) {
            input.value = "J" + j;
        } 
    }
</script>