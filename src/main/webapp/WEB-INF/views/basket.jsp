<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html>

	<head>
		<title>JavaQua</title>  
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width">  
	    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	    <link rel="stylesheet" href="/resources/css/10-11.css" />
	    <link href="images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">	    
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	    
	     	    
	   	<!-- axios 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	    	    
	    <!-- vuejs 추가 -->
	   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	</head>
	
	<body>
		<!-- 헤더 -->
		<%@include file="header.jsp"%>  
		
		<!-- app 열기 -->
		<div id="app" v-clock>     
		
		
		    <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
	        	<div id="frame">
		            <div id="frame2">
		                <span style="font-size: 16pt; font-weight: bold;">장바구니</span>
		                <span></span>
		        	</div>
		        	<br/>
		         
	                <input type="hidden" name="cmd" value="order">
	                <div class="basketdiv" id="basket">
	                    <div class="row head">
	                        <div class="subdiv">
	                            <div class="img">이미지</div>
	                            <div class="pname">상품명</div>
	                        </div>
	                        <div class="subdiv">
	                            <div class="basketprice">가격</div>
	                            <div class="num">수량</div>
	                            <div class="sum">합계</div>
	                        </div>
	                        <div class="subdiv">
	        
	                            <div class="basketcmd">삭제</div>
	                        </div>
	                        <div class="split"></div>
	                    </div>
	                          
	                    <c:set var = "total" value = "0" />      
	                    <c:forEach var="cart" items="${cartList}" varStatus="status">  
		                    <c:set var= "total" value="${total + (cart.price*cart.amount)}"/>    
<<<<<<< HEAD
		                    <div class="row data">
=======
		                    <div class="row data" >
>>>>>>> feature/memberUpdate
		                        <div class="subdiv" onclick="location.href='/product/productDetail?&pd_num=${cart.pd_num}'">
		                            <div class="img"><img src="/resources/upload/product/${cart.file1}" width="60"/></div>
		                            <div class="pname">
		                                <span>${cart.title}</span>
		                            </div>
		                        </div>
		                        <div class="subdiv">
		                            <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price"><fmt:formatNumber value="${cart.price}" pattern="#,###" />원</div>
		                            <div class="num">
		                                <div class="updown">
		                                    <input type="text" size="2" maxlength="3" class="p_num" value="${cart.amount}" readonly>
		                                    <span @click="수량업(${cart.cart_num},${status.index })"><i class="fas fa-arrow-alt-circle-up up"></i></span>
		                                    <span @click="수량다운(${cart.cart_num},${status.index })"><i class="fas fa-arrow-alt-circle-down down"></i></span>
		                                </div>
		                            </div>
		                            <div class="sum"><fmt:formatNumber value="${cart.price*cart.amount}" pattern="#,###" />원 </div>
		                        </div>
		                        <div class="subdiv">
		                            <div class="basketcmd"><a @click="상품삭제(${cart.cart_num})" class="abutton">삭제</a></div>
		                        </div>
		                    </div>    
	                    </c:forEach>
	         
	        
	                <div class="right-align basketrowcmd">
	                    <a class="abutton" @click="전체삭제()">장바구니비우기</a>
	                </div>
	        
	                <div class="bigtext right-align box blue summoney">합계금액  <fmt:formatNumber value="${total}" pattern="#,###" />원</div>
	        
	                <div id="goorder" class="">
	                    <div class="clear"></div>
	                    <div class="buttongroup center-align cmd">
	                        <a @click="주문하기()" style="cursor:pointer">주문하기</a>
	                    </div>
	                </div>
	            </div>
	            </div>
			</form>   
		   
		</div>
		<!-- app 닫기 -->
	     <!-- 푸터 -->
		<%@include file="footer.jsp"%> 
		<script>
		let id = '${id }';
		</script>
		<script type="text/javascript" src="/resources/js/10-11.js"></script>


	</body>
</html>
