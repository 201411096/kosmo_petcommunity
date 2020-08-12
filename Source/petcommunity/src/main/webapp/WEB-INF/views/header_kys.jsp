﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>oki doghere</title>
<meta charset="UTF-8">
<meta name="description" content="Instyle Fashion HTML Template">
<meta name="keywords" content="instyle, fashion, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link href="./resources/css/toastr.css" rel="stylesheet" type="text/css" />
<!-- Stylesheets -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css/slicknav.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet" href="./resources/css/head.css" />

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- header section -->
	<header class="header-section">
		<div class="header-warp">
			<a href="main.do" class="site-logo"> <img
				src="./resources/bootstrap_template/template_01/img/logo2.png"
				alt="">
			</a>



			<ul class="main-menu">
				<c:choose>
					<c:when test="${sessionScope.memberVO.memberFlag eq '1'}">
						관리자/${sessionScope.memberVO.memberName}님, 안녕하세요
						<a href="logout.do">[로그아웃]</a>

					</c:when>

					<c:when test="${sessionScope.memberVO.memberFlag eq '0'}">				
						${sessionScope.memberVO.memberName}님, 안녕하세요
						<a href="logout.do">[로그아웃]</a>
						<a href="mypageAnimal.do">[마이 페이지]</a>
						<a href="productCart.do">[장바구니]</a>

					</c:when>
				</c:choose>

				<li><a href="lostboardlist.do"><strong>잃어버렸어요</strong></a></li>
				<li><a href="findboardlist.do"><strong>목격했어요</strong></a></li>

				<li><a href="/petcommunity/communityBoardList.do">커뮤니티</a></li>
				<li><a href="shop.do">유기견 후원 스토어</a></li>
				<li><a href="/petcommunity/productList.do">오키도키 굿즈</a></li>
				<li><a href="/petcommunity/findHospitalList.do">동물 병원 정보</a></li>
				<li><a href="/petcommunity/cs.do">고객 문의</a></li>

				<c:if test="${empty sessionScope.memberVO}">
					<li><a href="login.do">로그인/회원가입</a></li>
				</c:if>

				<c:if test="${sessionScope.memberVO.memberFlag eq '1'}">
					<li><a href="adminPage.do">관리자페이지</a></li>
				</c:if>

			</ul>
		</div>
	</header>

	<script
		src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
	<df-messenger intent="WELCOME" chat-title="petcommunity"
		agent-id="2573aba7-c532-485a-a3e8-889b7d15fac1" language-code="ko"></df-messenger>

<input id="hiddenId" type=hidden value="${sessionScope.memberVO.memberId}"}>

	<!--====== Javascripts & Jquery ======-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/jquery-3.2.1.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/bootstrap.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/jquery.slicknav.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/owl.carousel.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/circle-progress.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	<script src="./resources/js/toastr.js"></script>
</body>

</html>