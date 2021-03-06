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
	    <link rel="stylesheet" type="text/css" href="/resources/css/mypage_orderlist.css">
	    <link href="/resources/css/suport_page.css" rel="stylesheet" type="text/css">
	   	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	   		 
	   	<!-- axios 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>   	    
	    <!-- vuejs 추가 -->
	   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	</head>

	<body>
		<!-- 헤더 -->
		<%@include file="header.jsp"%>
			
		<div id="wrap">
			<div id="main">
				<div id="snb">
					<h2>마이페이지</h2>
				    <ul>
						<a href="/order/order_list"><li id="now">주문내역</li></a>
						<a href="/review/review_list"><li>리뷰내역</li></a>
						<a href="/qna/qna_list"><li>상품문의내역</li></a>
				        <a href="/member/passwordCheckForm"><li>개인정보수정</li></a>
				    </ul>
				</div> 
		                 
			    <div class="contents">
					<!-- app 열기 -->
					<div id="app" >
					<!-- Contents -->
						<div id="contents">
							<div class="sub">								
								<div class="tb_tit">
						        	주문내역
						        </div>														
							
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
														<c:if test="${detail.odt_status == '주문완료' && detail.review == 0}">
														
															<div class="reviewdiv">
																<button type="button" class="btn" @click="리뷰작성새창(${detail.pd_num})">리뷰작성</button>
															</div>
														</c:if>
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
					</div>
					<!-- app 닫기 -->	
			    </div>  
			    <!--contents-->
		    </div>  <!--main-->
		</div>  <!--wrap -->
				
		<!-- 푸터 -->
		<%@include file="footer.jsp"%>	
		
		<script>
			const v=new Vue({
			    el : "#app",
				methods : {
					리뷰작성새창(pd_num){
						window.open("/review/review_write?pd_num="+pd_num ,"open" ,"height=750 , width=1100");
					}
				}
			});
		</script>
	</body>
</html>
