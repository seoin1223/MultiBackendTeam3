<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PAGE settings -->
<link rel="icon"
	href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
<title>trip</title>

<!-- CSS dependencies -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/colorful.css">
</head>

<body>
	<!-- 로그인 등록 또는 로그인 -->
	<div class="py-5" id="loginSlot">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-4">
					<form action="/login-process" method="post">

						<div class="form-group">
							<label>아이디</label>
							<input type="text" class="form-control" placeholder="아이디를 입력하세요"
									name = "username">
							<!-- <small class="form-text text-muted">'
							    추후에 에러용?
							</small> -->
						</div>

						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" placeholder="비밀번호를 입력하세요"
									name = "password">
						</div>

						<div class="form-check mb-3">
							<input class="form-check-input" type="checkbox" name="remember-me" id="remember-me">
							<label class="form-check-label" for="remember-me">
								Remember-me
							</label>
						</div>

						<button type="submit" class="btn btn-primary">로그인</button>

					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- ===================================================== -->


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>



</html>