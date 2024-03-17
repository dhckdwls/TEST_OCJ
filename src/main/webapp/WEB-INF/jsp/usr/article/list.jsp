<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<table class="table-auto border-collapse border border-gray-400">
    <thead>
        <tr>
            <th class="border border-gray-400 px-4 py-2">번호</th>
            <th class="border border-gray-400 px-4 py-2">등록날짜</th>
            <th class="border border-gray-400 px-4 py-2">제목</th>
            <th class="border border-gray-400 px-4 py-2">내용</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="article" items="${articles}">
            <tr>
                <td class="border border-gray-400 px-4 py-2">${article.id}</td>
                <td class="border border-gray-400 px-4 py-2">${article.regDate}</td>
                <td class="border border-gray-400 px-4 py-2"><a href="/usr/article/detail?id=${article.id }">${article.title}</a></td>
                <td class="border border-gray-400 px-4 py-2">${article.body}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>