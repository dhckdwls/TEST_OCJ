<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<!-- 테일윈드 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

	<!-- daisy ui 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

	<!-- 폰트어썸 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

	<!-- 제이쿼리 불러오기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<form action="/usr/article/doModify" method="POST">
		<table>
		<input type="hidden" name="id" value="${article.id }"/>
			<tr>
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" placeholder="${article.title }" name="title"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" placeholder="${article.body }" name="body"/></td>
			</tr>
		</table>
		<button class="btn btn-outline" type="submit">수정</button>
		
	</form>



</body>
</html>