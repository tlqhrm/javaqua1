<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="ko">

	<head>
	    <title>JavaQua</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
	    <link rel="stylesheet" type="text/css" href="/resources/css/order.css">
	   	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	</head>

	<body>		
		<!-- 헤더 -->
		<%@include file="header.jsp"%>

		<!-- Contents -->
		<div id="contents">
			<div class="sub">	
				<div style="margin-top:200px">		
					<h3 class="tit">주문이 정상적으로 완료되었습니다.</h3>		
					<div class="cashbox_btn1"><a style="text-decoration:none; color:#fff" href="/order/order_list">주문내역 확인</a></div>	
				</div>												
			</div>
		</div>
		<!--//Contents -->
		
		<!-- 푸터 -->
		<%@include file="footer.jsp"%>	
	</body>
</html>