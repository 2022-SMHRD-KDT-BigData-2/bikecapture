<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Spring Test</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico">
<script src="js/jquery-1.4.2.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.jcarousel.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/functions.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function idCheck() {
		// 1. id 가져오기
		let id = $('#check').val()
		// 2. ajax
		$.ajax({
			url : "${cpath}",
			type : "post",
			data : {
				'id' : id
			},
			success : function(res) {
				if (res == "true") {
					//사용가능한 아이디
					$("#result").html("사용가능한 아이디입니다.");
					$('#result').css("color", "blue");
				} else {
					//중복된 아이디
					$("#result").html("중복된 아이디입니다.");
					$("#result").css("color", "red");
				}
			},
			error : function() {
				alert("error");
			}
		})
	}
<!--
	function fileLoad() {
		// 1. filename 가져오기
		let vr_title = $('#vr_title').val()
		// 2. ajax
		$.ajax({
			url : "${cpath}",
			type : "post",
			data : {
				'vr_title' : vr_title
			},
			success : function() {
				alert("OKAY");
			},
			error : function() {
				alert("error");
			}
		})
	}
-->
	function main() {
		$("#main").css("display", "block");
		$("#mybox").css("display", "none");
		$("#accuse").css("display", "none");
		$("#manual").css("display", "none");
	}

	function myBox() {
		var folder = "<p>2022-05-01<p>"
		$("#mybox").html(folder);
		$("#main").css("display", "none");
		$("#mybox").css("display", "block");
		$("#accuse").css("display", "none");
		$("#manual").css("display", "none");
	}

	function accuse() {
		var bList = "<table class='table table-bordered table-hover'>";
		bList += "<tr>";
		bList += "<td>번호</td>";
		bList += "<td>제목</td>";
		bList += "<td>작성자</td>";
		bList += "<td>작성일</td>";
		bList += "<td>조회수</td>";
		bList += "<td>수정</td>";
		bList += "</tr>";
		$("#accuse").html(bList);
		$("#main").css("display", "none");
		$("#mybox").css("display", "none");
		$("#accuse").css("display", "block");
		$("#manual").css("display", "none");
	}

	function manual() {
		var manual = "<div><p>헬멧 미착용</p><p>신호위반</p></div>"
		$("#manual").html(manual);
		$("#main").css("display", "none");
		$("#mybox").css("display", "none");
		$("#accuse").css("display", "none");
		$("#manual").css("display", "block");
	}
</script>
</head>
<body>

	<div class="header">
		<div class="shell"></div>
		<h1 id="logo">
			<a href="#">Bike Capture</a>
		</h1>
		<a href="#"><span>Black box site</span></a>
		<div id="navigation">
			<button type="button" onclick="main()">NOW</button>
			<button type="button" onclick="myBox()">MY BOX</button>
			<button type="button" onclick="accuse()">ACCUSE</button>
			<button type="button" onclick="manual()">MANUAL</button>
		</div>
	</div>

	<!-- 메인페이지 -->
	<div id="main">
		<c:if test="${empty uvo}">
			<ul class="links">
				<li><h5>로그인</h5></li>
				<form class="main" action="${cpath}/login.do" method="post">
					<div class="form-group">
						<label for="id">아이디:</label> <input type="text"
							class="form-control" name="id">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호:</label> <input type="password"
							class="form-control" name="pw">
					</div>
					<button type="submit" class="btn btn-default">Login</button>
				</form>
			</ul>

			<ul class="actions vertical">
				<li><h5>회원가입</h5></li>
				<form class="" action="${cpath}/join.do" method="post">
					<li>아이디:<input type="text" class="form-control" name="id"></li>
					<p id="result">
						<button type="button" onclick="idCheck()">중복 확인</button>
					</p>
					<li>비밀번호:<input type="password" name="pw"></li>
					<li>블랙박스번호:<input type="text" name="bb_num"></li>
					<li>이름:<input type="text" name="name"></li>
					<li>주민번호:<input type="text" name="rrn"></li>
					<li>휴대폰번호:<input type="text" name="phone"></li>
					<li>주소:<input type="text" name="address"></li>

					<li><button type="submit" class="btn btn-default">회원가입</button></li>
				</form>
			</ul>
		</c:if>

		<c:if test="${!empty uvo}">
			<form action="${cpath}/logout.do" method="post">
				<div class="form-group">
					<label>${uvo.name}님 방문을 환영합니다</label> <input type="submit"
						class="btn btn-default" value="Logout">
				</div>
				<video width="640" height="344" controls autoplay="autoplay">
					<source src="original/20220429092515936.mp4" type="video/mp4">
				</video>
			</form>

		</c:if>
	</div>
	<div id="mybox">
		<button></button>
	</div>
	<div id="accuse">
	<input type="file" name="vr_title" id="vr_title">
	</div>
	<div id="manual"></div>

	<div class="footer">
		<div class="shell">빅데이터 순간포착</div>
	</div>

</body>
</html>