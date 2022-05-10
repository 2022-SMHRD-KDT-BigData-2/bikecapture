<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring Test</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function goJSON() {
	$.ajax({
		url : "${cpath}/bookListAjax.do",
		type:"get",
		dataType:"json",
		success:ajaxHtml,
		error : function(){alert("error");}
		
	});
  }
  function ajaxHtml(data) {
	  var bList = "<table class='table table-bordered table-hover'>";
	  bList+="<tr>";
	  bList+="<td>번호</td>";
	  bList+="<td>제목</td>";
	  bList+="<td>작가</td>";
	  bList+="<td>출판사</td>";
	  bList+="<td>ISBN</td>";
	  bList+="<td>보유도서수</td>";
	  bList+="</tr>";
	  
	  $.each(data,(index,obj)=>{
		  bList+="<tr>";
		  bList+="<td>"+obj.num+"</td>";
		  bList+="<td>"+obj.title+"</td>";
		  bList+="<td>"+obj.author+"</td>";
		  bList+="<td>"+obj.company+"</td>";
		  bList+="<td>"+obj.isbn+"</td>";
		  bList+="<td>"+obj.count+"</td>";
		  bList+="</tr>";
	  });
	  bList+="</table>";
	  
	  $("#view").html(bList);
  }
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring Test</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOOK</div>
    <div class="panel-body">
		<table class="table table-boardered table-hover">		  
		  <tr>
		  	<td>번호</td>
	   		<td>제목</td>
	    	<td>작가</td>
	    	<td>출판사</td>
	    	<td>ISBN</td>	  	
	    	<td>보유도서수</td>	  	
		  </tr>
		  <c:forEach var="vo" items="${list}">	
		  	
		  <tr>
		  	<td>${vo.num}</td>
	   		<td>${vo.title}</td>
	    	<td>${vo.author}</td>
	    	<td>${vo.company}</td>
	    	<td>${vo.isbn}</td>	  	
	    	<td>${vo.count}</td>	  	
		  </tr>
		  </c:forEach>
		  <tr>
		    <td colspan="5">
		      <button class="btn btn-success btn-sm" onclick="goJSON()">도서목록 가져오기</button>
		    </td>
		  </tr>
		</table>
		<div id="view">여기에 도서목록이 출력됩니다</div>
	</div>
    <div class="panel-footer">빅데이터 분석서비스 개발자과정(정상범)</div>
  </div>
</div>

</body>
</html>