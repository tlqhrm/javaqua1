<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="ko">

	<head>
	    <title>JavaQua</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="이미지/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
	    <link rel="stylesheet" type="text/css" href="/resources/css/order.css">
	    <link rel="stylesheet" type="text/css" href="/resources/css/mypage_orderlist.css">
	   	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	</head>

	<body>
		<!-- 헤더 -->
		<%@include file="header.jsp"%>

		<!-- Contents -->
		<div id="contents">
			<div class="sub">		
				
				<h3 class="tit">주문내역</h3>														
			
				<c:forEach var="order" items="${orderlist}">  
					<ul class="list_oerder">
						<li>
						 	<div class="date">${order.orderdate.substring(0,10)} &nbsp;<span style="font-size:14px">( 주문번호 ${order.od_num} )</span></div>
						 	<c:forEach var="detail" items="${detail_list}"> 
						 		<c:if test="${order.od_num == detail.od_num}">
							 		<div class="order_goods">
										<div class="name" onclick="location.href='/product/productDetail?&pd_num=${detail.pd_num}'"> ${detail.title}<span style="float:right">＞</span></div>
										<div class="order_info">
											<div class="thumb"><img style="margin-top:20px" width="80;" src="/resources/upload/product/${detail.file1.split(";")[0]}"/></div>
											<div class="desc">
												<dl>
													<dt>주문가격</dt>
													<dd><fmt:formatNumber value="${detail.price}" pattern="#,###" />원</dd>
												</dl>
												<dl>
													<dt>주문수량</dt>
													<dd>${detail.amount}</dd>
												</dl>
												<dl>
													<dt>주문상태</dt>
													<dd>${detail.odt_status}</dd>
												</dl>
											</div>
										</div>		
									</div>
								</c:if>
							</c:forEach>
						</li>
					</ul>	
					<br>
				</c:forEach>	
			</div>
		</div>
		<!--//Contents -->		
		<!-- 푸터 -->
		<%@include file="footer.jsp"%>	
	</body>
</html>
