<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form method="post" action="joinPro" name="userInfo"
					onsubmit="return checkValue()">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memberId">아이디</label> <input type="text"
								class="form-control" id="memberId" name="memberId"
								maxlength="50" placeholder="아이디를 입력해주세요" required> <span
								class="idchk"></span>
						</div>
						<div class="col-md-6 mb-3">
							<label for="memberName">이름</label> <input type="text"
								class="form-control" id="memberName" placeholder="이름을 입력해주세요"
								value="" required> <span class="memberNamechk"></span>

						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memberPw">비밀번호</label> <input type="text"
								class="form-control" id="memberPw" placeholder="비밀번호를 입력해주세요"
								value="" required> <span class="pwchk1"></span>
						</div>

						<div class="col-md-6 mb-3">
							<label for="memberPwCheck">비밀번호 확인</label> <input type="text"
								class="form-control" id="memberPwCheck"
								placeholder="비밀번호를 다시 한번 입력해주세요" value="" required><span
								class="pwchk"></span>
						</div>

					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="text"
							class="form-control" id="email" placeholder="metadog@example.com"
							required="required"> <span class="emailchk"></span>
					</div>

					<div class="mb-3">
						<label for="phoneNumber">휴대폰 번호</label> <input type="text"
							class="form-control" id="phoneNumber"> <span
							class="phchk"></span>
					</div>

					<div class="mb-3">
						<label for="address">우편번호 <span class="text-muted">&nbsp;(선택사항)</span>
							<span class="text-muted">
								<button type="button" class="btn" id="check_btn" onclick="#">찾기</button>
						</span>
						</label> <input type="text" class="form-control" id="address"
							placeholder="찾기를 눌러 주소를 입력하세요">
					</div>

					<div class="mb-3">
						<label for="address2">주소<span class="text-muted">&nbsp;(선택사항)</span></label>
						<input type="text" class="form-control" id="address2"
							placeholder="주소를 입력해주세요.">
					</div>
					<div class="mb-4"></div>

					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
				<br>
				<button class="btn btn-primary btn-lg btn-block"
					onclick="goPreForm();">뒤로가기</button>

			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2021 YD</p>
		</footer>
	</div>
</body>