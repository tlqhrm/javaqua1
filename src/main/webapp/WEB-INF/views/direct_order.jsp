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

	    <!-- axios 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	    	    
	    <!-- vuejs 추가 -->
	   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	   	<!-- numeral 추가 -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
	</head>

	<body>
		<!-- 헤더 -->
		<jsp:include page="header.jsp"></jsp:include>
		
		<!-- app 열기 -->
		<div id="app" >
		

		<!-- Contents -->
		<div id="contents">
			<div class="sub">		
				
				<h3 class="tit">주문서 </h3>														
				<div class="tb_tit">주문상품</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mem_table">				
					<tr height="100" onclick="location.href='/product/productDetail?&pd_num=${param.pd_num}'" style="cursor:pointer">
						<td><img width="70" src="/resources/upload/product/${param.file1}"></td>
						<td class="txtb" width="500px">${param.title} / 수량 ${param.amount}</td>
						<td style="text-align:right">
							<fmt:formatNumber value="${param.price*param.amount}" pattern="#,###" />원
						</td>
					</tr>
				</table>
				<br>
				
				<div class="tb_tit">주문자정보</div>					
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mem_table">				
					<tr>
						<td class="txtb" width="110px">이름</td>
						<td>
							{{회원정보.name}}
						</td>
					</tr>				
					<tr>
						<td class="txtb" width="110px">휴대폰</td> 
						<td>
							{{회원정보.user_phone}}
						</td>
					</tr>
					<tr>
						<td class="txtb" width="110px">이메일</td> 
						<td>
							{{회원정보.user_email}}
						</td>
					</tr>
					<tr>
						<td class="txtb" width="110px">배송지</td> 
						<td>
							{{회원정보.user_address}}, {{회원정보.user_address2}}
						</td>
					</tr>
				</table>
					
				<div style="border: 2px solid #0281ec; padding: 23px 20px 23px 20px; margin: 30px 0 0 0; font-size: 14px;">
					<span style="float: left; font-weight: bold;">주문금액</span>
					<span style="float: right;">{{주문금액|콤마표시}}원</span>
					<br><br>
		
					<span style="float: left; font-weight: bold;">배송비</span><br>		
					<span class="mile_num01" style="float: right; margin-top: -15px;">{{배송비|콤마표시}}원</span>
					<br>

					<div style="height: 1px; width: 100%; background-color: #DCDCDC;"></div><br>
					<span style="float: left; font-weight: bold; font-size: 18px;">최종결제금액</span><span style="float: right;color: #F85477; font-weight: bold; font-size: 24px;">{{최종결제금액|콤마표시}}원</span>
					<br>															
				</div>	
				<div @click="결제하기()" class="cashbox_btn1"><a>결제하기</a></div>	
			</div>
		</div>
		<!--//Contents -->
		</div>
		<!-- app 닫기 -->
		
		<!-- 푸터 -->
		<%@include file="footer.jsp"%>	
		<script>
			let id="${id}";	
			let pd_num="${param.pd_num}";
			let title="${param.title}";
			let price="${param.price}";
			let amount="${param.amount}";	
			var config = {
					headers:{
						"${_csrf.headerName}":"${_csrf.token}"
					}	
			}
		</script>
		<script src="/resources/js/direct_order.js"></script>
		
	</body>
</html>
