<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

	<!-- 다음 주소찾기 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
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
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
	
	$(document).ready(function(){
		$("#joinMemberId").focusout(function() {
			
			var memberId = $('#joinMemberId').val();
			var idChk = $("#idChk");
			
			if (memberId == '') {
				idChk.css('color', 'red');
				idChk.text('ID를 입력 해 주세요.');
			} else {
				$.ajax({
					type: "post",
					url: "/member/memberIdChk",
					data: {memberId : memberId},
					success : function(result){
						if (result == "success") {
							idChk.css('color', 'green');
							idChk.text('해당 ID는 사용 가능합니다.');
						} else if (result == "fail") {
							idChk.css('color', 'red');
							idChk.text('중복된 ID가 있습니다.');
						}
					}
				});
			}
		});
	});
	
	</script>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form method="post" onsubmit="return checkValue()">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memberId">아이디</label>
							<input type="text" class="form-control" id="joinMemberId" name="memberId" maxlength="50" placeholder="아이디를 입력해주세요" required>
							<span id="idChk"></span>
						</div>
						<div class="col-md-6 mb-3">
							<label for="memberName">이름</label>
							<input type="text" class="form-control" name="memberName" placeholder="이름을 입력해주세요" value="" required>
							<span class="memberNamechk"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memberPw">비밀번호</label>
							<input type="password" class="form-control" name="memberPw" placeholder="비밀번호를 입력해주세요" value="" required>
							<span class="pwchk1"></span>
						</div>

						<div class="col-md-6 mb-3">
							<label for="memberPwCheck">비밀번호 확인</label>
							<input type="password" class="form-control" placeholder="비밀번호를 다시 한번 입력해주세요" value="" required>
							<span class="pwchk"></span>
						</div>

					</div>
					<div class="mb-3">
						<label for="email">이메일</label>
						<input type="text" class="form-control" name="memberEmail" placeholder="metadog@example.com" required="required"> <span class="emailchk"></span>
					</div>

					<div class="mb-3">
						<label for="address">우편번호</label> <span class="text-muted">&nbsp;(선택사항)</span>
						<button type="button" class="btn btn-secondary" style="vertical-align: middle;height: 21px;font-size: small;padding: 0px 12px;" onclick="sample6_execDaumPostcode()">찾기</button>
						<input type="text" class="form-control" name="memberAddr" readonly="readonly" placeholder="찾기를 눌러 주소를 입력하세요">
					</div>

					<div class="mb-3">
						<label for="address2">주소<span class="text-muted">&nbsp;(선택사항)</span></label>
						<input type="text" class="form-control" name="memberAddrDetail" placeholder="주소를 입력해주세요.">
					</div>
					
					<input type="hidden" id="memberGb" name="memberGb" value="003">

					<button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
					<button class="btn btn-primary btn-lg btn-block" onclick="history.back();">뒤로가기</button>
				</form>

			</div>
		</div>
	</div>
</body>

<%@ include file="../footer.jsp"%>