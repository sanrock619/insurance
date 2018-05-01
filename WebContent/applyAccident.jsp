<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="member" class="beans.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">

<title>線上投保</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- open-iconic css -->
<link href="open-iconic/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<style>
body {
	padding-top: 54px;
}

@media ( min-width : 992px) {
	body {
		padding-top: 56px;
	}
}

.form {
	padding-top: 5%;
	padding-left: 5%;
	padding-right: 5%;
	text-align: left;
}

.window {
	margin: auto;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">網路投保專區-意外傷害險</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">
							<span class="oi oi-home" aria-hidden="true"></span>首頁
					</a></li>
					<li class="nav-item"><a class="nav-link" href="calculate.jsp">
							<span class="oi oi-calculator" aria-hidden="true"></span>試算保費
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="member.jsp"> <span class="oi oi-file" aria-hidden="true"></span>保戶園地
					</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">
							<span class="oi oi-tag" aria-hidden="true"></span>註冊會員
					</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">
							<span class="oi oi-account-logout" aria-hidden="true"></span>登出會員
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<c:choose>
		<c:when test="${member.id==null }">
			<c:redirect url="login.jsp" />
		</c:when>
		<c:otherwise>
			<!-- Page Content -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">

						<div class="container" style="margin-top: 5%">
							<div class="row">
								<div class="col-sm-8 window">
									<div class="card text-center">
										<div class="card-header">意外傷害險-填寫投保內容</div>
										<div class="card-block">
											<form class="form" action="Accident" method="post">
												<div class="form-group row">
													<label for="insAmount" class="col-sm-3 col-form-label">
														<span class="oi oi-dollar" aria-hidden="true"></span>保險金額
													</label>
													<div class="form-group col-md-4">
														<select class="form-control" id="insAmount"
															name="insAmount" required>
															<option value=5 selected>50萬</option>
															<option value=10>100萬</option>
															<option value=15>150萬</option>
															<option value=20>200萬</option>
															<option value=25>250萬</option>
															<option value=30>300萬</option>
															<option value=35>350萬</option>
															<option value=40>400萬</option>
															<option value=45>450萬</option>
															<option value=50>500萬</option>
															<option value=55>550萬</option>
															<option value=60>600萬</option>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-sm-3 col-form-label"> <span
														class="oi oi-people" aria-hidden="true"></span>受益人
													</label>
													<div class="form-check">
														<input class="big-checkbox" type="checkbox" value="法定繼承人"
															id="legalHeir" name="beneficiary1"> <label
															class="form-check-label" for="legalHeir">法定繼承人</label>
													</div>
													<div class="form-check">
														<input class="big-checkbox" type="checkbox" value="配偶"
															id="spouse" name="beneficiary2"> <label
															class="form-check-label" for="spouse">配偶</label>
													</div>
													<div class="form-check">
														<input class="big-checkbox" type="checkbox" value="子女"
															id="child" name="beneficiary3"> <label
															class="form-check-label" for="child">子女</label>
													</div>
													<div class="form-check">
														<input class="big-checkbox" type="checkbox" value="父母"
															id="parents" name="beneficiary4"> <label
															class="form-check-label" for="parents">父母</label>
													</div>
													<!-- 													<div class="form-check col-md-3" style="padding-left: 2%"> -->
													<!-- 														<input class="big-checkbox" type="checkbox" value="其他直系血親" -->
													<!-- 															id="other" name="beneficiary4"> <label -->
													<!-- 															class="form-check-label" for="other">其他直系血親</label> -->
													<!-- 													</div> -->
													<!-- 受益人Modal -->
													<div class="modal fade" id="alert" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">
																<div class="modal-header"
																	style="background-color: #0066FF; color: white;">
																	<h5 class="modal-title">系統訊息</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">請至少選擇一位受益人</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">關閉</button>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-sm-3 col-form-label"> <span
														class="oi oi-calendar" aria-hidden="true"></span>自動續約
													</label>
													<div class="col-sm-2 form-check form-check-inline"
														style="padding-left: 2%">
														<input class="form-check-input" type="radio" name="auto"
															id="Y" value="Y" checked> <label
															class="form-check-label" for="Y">是</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" name="auto"
															id="N" value="N"> <label class="form-check-label"
															for="N">否</label>
													</div>
												</div>

												<div class="form-group row">
													<div class="col-sm text-center">
														<a href="calculate_life.jsp" class="btn btn-info"> <span
															class="oi oi-calculator" aria-hidden="true"></span>回到試算保費
														</a>
													</div>
													<br> <br>
													<div class="col-sm text-center">
														<button class="btn btn-warning" type="submit" id="submit">
															<span class="oi oi-chevron-right" aria-hidden="true"></span>下一步
														</button>
													</div>
												</div>
											</form>
										</div>

									</div>
									<div class="col-sm text-center" style="margin-top: 5%"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<footer class="pt-4 my-md-5 pt-md-5 border-top container-fluid">
			<div class="row">
				<div class="col-12 col-md">
					<span class="oi oi-cloud" aria-hidden="true"></span> <small
						class="d-block mb-3 text-muted">&copy; 雲端保險股份有限公司</small>
				</div>
				<div class="col-6 col-md">
					<ul class="list-unstyled text-small">
						<li><a class="text-muted yyy" href="#"><span class="oi oi-bullhorn" aria-hidden="true"></span>法令公告</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-document" aria-hidden="true"></span>隱私權聲明</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-eye" aria-hidden="true"></span>資訊公開</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-lock-locked" aria-hidden="true"></span>電子商務自律規範</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<ul class="list-unstyled text-small">
						<li><a class="text-muted" href="#"><span class="oi oi-question-mark" aria-hidden="true"></span>常見問題</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-location" aria-hidden="true"></span>服務據點</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-phone" aria-hidden="true"></span>網路投保服務專線 0800-000-000</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-map-marker" aria-hidden="true"></span>台北市大安區敦化南路十段000號1樓</a></li>
					</ul>
				</div>
			</div>
		</footer>
			</div>
		</c:otherwise>
	</c:choose>
</body>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>