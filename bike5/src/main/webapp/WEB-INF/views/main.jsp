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
<script src="original/20220429092515936.mp4"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 서버와 통신을 한다(게시판 리스트를 요청) : boardAjaxList.do
	
	});
	
	function () {
		$.ajax({
			url : "${cpath}/bike",
			type : "get",
			dataType : "json",
			success : callBack,
			error : function() {
				allert("error");
			}
		});
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
			<button class="active">NOW</button>
			<button class="active">MY BOX</button>
			<button class="active">ACCUSE</button>
			<button class="active">MANUAL</button>
		</div>
	</div>

		<!-- 로그인 -->
		<c:if test="${empty uvo}">
				<ul class="links">
					<li><h5>로그인</h5></li>
					<form class="main" action="${cpath}/login.do" method="post">
						<div class="form-group">
							<label for="id">아이디:</label> <input type="text"
								class="form-control" id="id" name="id">
						</div>
						<div class="form-group">
							<label for="pw">비밀번호:</label> <input type="password"
								class="form-control" id="pw" name="pw">
						</div>
						<button type="submit" class="btn btn-default">Login</button>
					</form>
				</ul>

				<!-- 회원가입 -->
				<ul class="actions vertical">
					<li><h5>회원가입</h5></li>
					<form class="" action="${cpath}/join.do" method="post">
						<li>아이디:<input type="text" class="form-control" id="id"
							name="id"></li>
						<p id="result">
							<button type="button" onclick="idCheck()">중복 확인</button>
						</p>
						<li>비밀번호:<input type="password" id="pw" name="pw"></li>
						<li>블랙박스번호:<input type="text" id="bb_num" name="bb_num"></li>
						<li>이름:<input type="text" id="name" name="name"></li>
						<li>주민번호:<input type="text" id="rrn" name="rrn"></li>
						<li>휴대폰번호:<input type="text" id="phone" name="phone"></li>
						<li>주소:<input type="text" id="address" name="address"></li>

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
			<source src="${cpath}/original/20220429092515936.mp4" type="video/mp4">
			</video>
		</form>

	</c:if>

	<div class="panel-footer">빅데이터 순간포착</div>

</body>
</html>