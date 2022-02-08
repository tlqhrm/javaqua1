<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
</head>
<body style="text-align:center;">
<jsp:include page="header.jsp"></jsp:include>
<div style="margin:200px 0px 300px 0px">
<h1> 오류가 발생했습니다. 관리자에게 문의해주세요.</h1>
</div>
<h4>오류메세지 : <c:out value="${exception.getMessage() }"></c:out></h4>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>