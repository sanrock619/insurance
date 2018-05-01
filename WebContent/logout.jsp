<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log out</title>
</head>
<body>
<c:choose>
	<c:when test="${member.id==null }">
		<c:redirect url="login.jsp" />
	</c:when>
	<c:otherwise>
<% 
session.invalidate();
%>
<c:redirect url="login.jsp" />
	</c:otherwise>
</c:choose>
</body>
</html>