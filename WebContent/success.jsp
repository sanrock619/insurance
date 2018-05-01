<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Alertify JavaScript -->
<script src="alertify/alertify.min.js"></script>

<!-- Alertify CSS -->
<link rel="stylesheet" href="alertify/alertify.min.css" />
<!-- Alertify Default theme -->
<link rel="stylesheet" href="alertify/default.min.css" />
<!-- Alertify Semantic UI theme -->
<link rel="stylesheet" href="alertify/semantic.min.css" />
<!-- Alertify Bootstrap theme -->
<link rel="stylesheet" href="alertify/bootstrap.min.css" />
<title>線上投保</title>
</head>
<body>
	<script>
		alertify.alert('系統訊息', '投保成功，感謝您對本公司的支持', function() {
			location = 'myPolicy.jsp';
		});
	</script>
</body>
</html>