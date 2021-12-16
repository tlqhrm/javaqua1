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
	    <link rel="stylesheet" type="text/css" href="css/order.css">
	   	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	    <!-- axios 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	    	    
	    <!-- vuejs 추가 -->
	   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	</head>

	<body>

		
		<!-- app 열기 -->
		<div id="app" v-clock>
		<!-- 헤더 -->
		<%@include file="header.jsp"%>

		<!-- Contents -->
		<div id="contents">
			<div class="sub">		
				
				<h3 class="tit">주문서</h3>														
				<div class="tb_tit">주문상품 </div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mem_table">	
						<c:set var = "total" value = "0" />				
						<c:forEach var="cart" items="${cartList}"> 	
						<c:set var= "total" value="${total + (cart.price*cart.amount)}"/>  		
							<tr>
								<td class="txtb" width="500px">${cart.title} / 수량 ${cart.amount}</td>
								<td style="text-align:right">
									<fmt:formatNumber value="${cart.price*cart.amount}" pattern="#,###" />원
								</td>
							</tr>
						</c:forEach>
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
							{{회원정보.user_address}}
						</td>
					</tr>
				</table>
					
				<div style="border: 2px solid #0281ec; padding: 23px 20px 23px 20px; margin: 30px 0 0 0; font-size: 14px;">
					<span style="float: left; font-weight: bold;">주문금액</span>
					<span style="float: right;"><fmt:formatNumber value="${total}" pattern="#,###" />원</span>
					<br><br>
		
					<span style="float: left; font-weight: bold;">배송비</span><br>		
					<span class="mile_num01" style="float: right; margin-top: -15px;"><fmt:formatNumber value="3500" pattern="#,###" />원</span>
					<br>

					<div style="height: 1px; width: 100%; background-color: #DCDCDC;"></div><br>
					<span style="float: left; font-weight: bold; font-size: 18px;">최종결제금액</span><span style="float: right;color: #F85477; font-weight: bold; font-size: 24px;"><fmt:formatNumber value="${total+3500}" pattern="#,###" />원</span>
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
			let total="${total}";	
		</script>
		<script src="js/cart_order.js"></script>
	</body>
</html>
