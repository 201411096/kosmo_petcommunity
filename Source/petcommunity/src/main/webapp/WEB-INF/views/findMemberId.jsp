<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/mypage.css">
</head>
<body>
	<h4>아이디 찾기</h4>
	<form action="findMemberId.do">
		<div class="tedoory">
			<div class="form-group">
				<label for="memberEmail">이메일</label> <input type="text" name="memberEmail"
					id="memberEmail" />
			</div>
			<input type="submit" id="idBtn" value="아이디 찾기">
		</div>
	</form>
	<br>
	<h4>비밀번호 찾기</h4>
	<form action="findMemberpass.do">
		<div class="tedoory">
			<div class="form-group">
				<label for="memberId">ID</label> <input type="text" name="memberId"
					id="memberId" />
			</div>
			<div class="form-group">
				<label for="memberEmail2">이메일</label> <input type="text" name="memberEmail2"
					id="memberEmail2" />
			</div>
			<input type="submit" id="passBtn" value="비밀번호 찾기">
		</div>
	</form>
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
    <script src="./resources/js/signup.js"></script>
    <script src="./resources/js/getLocation.js"></script>
    <script src="./resources/bootstrap_template/template_01/js2/main.js"></script>
</body>
</html>