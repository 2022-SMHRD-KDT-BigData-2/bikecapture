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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		boardList();
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

	<div class="container">
		<h2>Bike Capture</h2>
		<div class="panel panel-default">
			<div class="panel-heading">
				<c:if test="${empty mvo}">
					<form class="form-inline" action="${cpath}/login.do" method="post">
						<div class="form-group">
							<label for="memId">아이디:</label> <input type="text"
								class="form-control" id="memId" name="memId">
						</div>
						<div class="form-group">
							<label for="memPwd">비밀번호:</label> <input type="password"
								class="form-control" id="memPwd" name="memPwd">
						</div>
						<button type="submit" class="btn btn-default">Login</button>
					</form>
				</c:if>
				<c:if test="${!empty mvo}">
					<form action="${cpath}/logout.do" method="post">
						<div class="form-group">
							<label>${mvo.memName}님 방문을 환영합니다</label> <input type="submit"
								class="btn btn-default" value="Logout">
						</div>
					</form>
				</c:if>
			</div>
			<div class="panel-body"></div>
			<div class="panel-footer">빅데이터 순간포착</div>
		</div>
	</div>

</body>
</html>