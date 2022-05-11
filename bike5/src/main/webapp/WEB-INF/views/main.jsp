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
function boardList() {
	 $.ajax({
   	url : "${cpath}/boardList",
   	type : "get",
   	dataType : "json",
   	success : callBack,
   	error : function(){alert("error");}
   });
}
function callBack(data){
	 var bList = "<table class='table table-bordered table-hover'>";
	 bList+="<tr>";
	 bList+="<td>번호</td>";
	 bList+="<td>위반사항</td>";
	 bList+="<td>작성일</td>";
	 bList+="<td>작성자</td>";
	 bList+="</tr>";
	 // data에 저장된 JSON데이터를 핸들링 -> 반복문
	 // [{"idx":1},{"title":"게시판",,,,},{   }]
	 $.each(data,(index,obj)=>{

		 bList+="<tr>";
  	 bList+="<td>"+obj.bo_num+"</td>";
  	 bList+="<td id='t"+obj.bo_num+"'><a href='javascript:cview("+obj.bo_num+")'>"+obj.vr_ill+"</a></td>";
  	 bList+="<td>"+obj.bo_date+"</td>";
  	 bList+="<td id='w"+obj.bo_num+"'>"+obj.name+"</td>";
  	 bList+="</tr>";        	     	 
		 
	 });
	 
	 bList+="<tr>";
	 bList+="<td colspan='4'>";

	 bList+="<button class='btn btn-sm btn-info' onclick='accbtn()'>제보</button>";
	 
	 bList+="</td>";
	 bList+="</tr>";
	 bList+="</table>";
	 
	 $(".list").html(bList);
	 $(".accuse").css("display", "block");
	 $(".file").css("display", "none");
	 $(".list").css("display", "block");
	 $(".main").css("display", "none");
	 $(".now").css("display", "none");
}
	function accbtn() {
		$(".file").css("display", "block");
		$(".list").css("display", "none");
	}
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

	function fileLoad() {
		// 1. filename 가져오기
		let vr_title = $('#vr_title').val()
		// 2. ajax
		$.ajax({
			url : "${cpath}/fileload",
			type : "post",
			data : {
				'vr_title' : vr_title
			},
			success : vr_video,
			error : function() {
				alert("error");
			}
		})
	}
	function vr_video(data) { // { }
		   
	      $("#aa").html("<table><tr><td>번호판</td></tr><tr><td>"+data.vr_plate+"</td></tr></table>");

	}
	function login() {
		$(".loginform").css("display", "block");
	}
	function join() {
		$(".joinform").css("display", "block");
	}

	function main() {
		$(".main").css("display", "block");
		$(".mybox").css("display", "none");
		$(".accuse").css("display", "none");
		$(".manual").css("display", "none");
	}

	function myBox() {
		var folder = "<p>2022-05-01<p>"
		$(".mybox").html(folder);
		$(".main").css("display", "none");
		$(".mybox").css("display", "block");
		$(".accuse").css("display", "none");
		$(".manual").css("display", "none");
	}

	function accuse() {
		var bList = "<table class='table table-bordered table-hover'>";
		bList += "<tr>";
		bList += "<td>번호</td>";
		bList += "<td>위반사항</td>";
		bList += "<td>작성일</td>";
		bList += "<td>작성자</td>";
		bList += "</tr>";
		$(".list").html(bList);
		$(".main").css("display", "none");
		$(".mybox").css("display", "none");
		$(".accuse").css("display", "block");
		$(".manual").css("display", "none");
	}

	function manual() {
		var manual = "<div><p>헬멧 미착용</p><p>신호위반</p></div>"
		$(".manual").html(manual);
		$(".main").css("display", "none");
		$(".mybox").css("display", "none");
		$(".accuse").css("display", "none");
		$(".manual").css("display", "block");
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
			<button type="button" onclick="boardList()">ACCUSE</button>
			<button type="button" onclick="manual()">MANUAL</button>
		</div>
	</div>

	<!-- 메인페이지 -->
	<div id="main">
		<c:if test="${empty uvo}">
			<a href="#" onclick="login()">로그인을 해주세요</a>

			<form class="loginform" action="${cpath}/login.do" method="post"
				style="display: none">
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

			<a href="#" onclick="join()">회원가입</a>
			<form class="joinform" action="${cpath}/join.do" method="post"
				style="display: none">
				<p>
					아이디:<input type="text" class="form-control" name="id">
					<button id="result" type="button" onclick="idCheck()">중복
						확인</button>
				</p>
				<p>
					비밀번호:<input type="password" name="pw">
				</p>
				<p>
					블랙박스번호:<input type="text" name="bb_num">
				</p>
				<p>
					이름:<input type="text" name="name">
				</p>
				<p>
					주민번호:<input type="text" name="rrn">
				</p>
				<p>
					휴대폰번호: <input type="text" name="phone">
				</p>
				<p>
					주소: <input type="text" name="address">
				</p>

				<button type="submit">회원가입</button>
			</form>
		</c:if>

		<c:if test="${!empty uvo}">
			<form action="${cpath}/logout.do" method="post">
				<div class="now">
					${uvo.name}님 방문을 환영합니다 <input type="submit" value="Logout">
				</div>
				<video class="now" width="640" height="344" controls
					autoplay="autoplay" src="original/20220429092515936.mp4" type="video/mp4">
				</video>
			</form>

		</c:if>
	</div>
	<div class="mybox">
		<p></p>
	</div>
	<div class="accuse" style="display: none">
		<div class="list"></div>
		<button onclick="accuse()"></button>
		<div class="file" style="display: none">
			<input type="file" name="vr_title" id="vr_title">
			<button onclick="boardList()">CANCEL</button>
			<button onclick="fileLoad()">SUBMIT</button>
		</div>
	</div>
	<div class="manual"></div>

	<div class="footer">
		<div class="shell">빅데이터 순간포착</div>
	</div>

</body>
</html>