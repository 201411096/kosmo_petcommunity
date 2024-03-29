<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file ="../views/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css2/fonts1/material-icon/css/material-design-iconic-font.min.css">

	
	<link rel="stylesheet"
	href="./resources/css/signup.css">
	


</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
					<figure>
							<img
								src="./resources/bootstrap_template/template_01/img/gallery/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.PNG"
								alt="sing up image" style="width:300px ">
						</figure>
						<a href="login.do" class="signup-image-link">로그인 페이지로 이동</a>
						<br>
						<h2 class="form-title">회원가입</h2>
						<form action="signup2.do" method="POST" class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="memberName" id="memberName" placeholder="이름" />
							</div>
							<div class="form-group">
								<label for="tel"><i class="zmdi zmdi-phone"></i></label> <input
									type="text" name="memberTel" id="memberTel" placeholder="휴대폰 번호" />
							</div>
							<div class="form-group">
								<label for="id"><i class="zmdi zmdi-account-box"></i></label>
								 <input type="text" name="memberId" id="memberId" placeholder="ID"/>	 
							</div>
							
							<span id="idresult"></span>
							
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label><input
									type="password" name="memberPassword" id="memberPassword" placeholder="Password" />
									
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="password 확인" />
							</div>
							<span id="passresult"></span>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="memberEmail" id="memberEmail" placeholder="Email" />
							</div>
							
							<div class="form-group">
								<span><i class="zmdi zmdi-face"></i>생년월일</span>
								<input type="date" name="memberBirthday" id="memberBirthday"/>
							</div>

							<div class="form-group">
								<span class='zmdi zmdi-home'>주소</span>
								<input type="text" id="sample2_postcode" placeholder="우편번호"> 
								<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample2_address" name="memberAddress" placeholder="주소"><br> 
								<input type="text" id="sample2_detailAddress" placeholder="상세주소">
								<input type="text" id="sample2_extraAddress">
							</div>
							
							
							
							<div id="layer"
								style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnCloseLayer"
									style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
									onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>

							
							<div class="form-group2">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span></span><a href="#" id="signCheck1">이용약관</a>
									에 동의 하십니까? </label>
							</div>
							
							<div class="form-group2">
								<input type="checkbox" name="agree-term2" id="agree-term2"
									class="agree-term2" /> <label for="agree-term2"
									class="label-agree-term"><span></span><a href="#" id="signCheck2">개인정보</a>
									수집 및 이용에 동의 하십니까?</label>
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="회원가입" />
							</div>

						</form>
					</div>
					
				</div>
			</div>
		</section>
		
<input class="modal-state" id="open-pop" type="checkbox" />
<div class="modal">
  <label class="modal_bg" for="open-pop"></label>
  <div class="modal_inner">
    <label class="modal_close" for="open-pop"></label>
    <h2>popup 제목</h2>
    <p>내용</p>
  </div>
</div>

	</div>
<%@include file="../views/footer.jsp"%>
	<!-- JS -->
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

	<script src="./resources/bootstrap_template/template_01/js2/main.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>