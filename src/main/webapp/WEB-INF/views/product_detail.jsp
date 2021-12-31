<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/css/suport_page.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/css/product_detail.css">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
 
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/resources/js/loginCheck.js"></script>

    <!-- axios 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	    	    
    <!-- vuejs 추가 -->
   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
   	<!-- numeral 추가 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
</head>

<body>

<!---header-->
<jsp:include page="header.jsp"></jsp:include>
<!--//header-->



<body>
<detail id="detail"> 
    <section id="detailmain">
        <div id="detail">
        	<!-- app 열기 -->
			<div id="app" >
            <div id="bg1">
         		<div id="bg2" style="text-align:center; display:inline-block;">     
         			<span id="main_img" ><img src="/resources/upload/product/${pvo.file1Arr[0] }" onerror="this.src='/resources/images/이미지준비중.jpg'" style="margin-left:auto; margin-right:auto;"></span>
         			<div id="bg3" style=" float:left;">
						<c:set var="size" value="${fn:length(pvo.file1Arr)}" />
	         			<c:if test="${size == 0 }"><c:set var="size" value="1" /></c:if> 
	         			<c:if test="${size > 4 }"><c:set var="size" value="5" /></c:if> 
						<c:forEach var="i" begin="0" end="${size - 1}">					
					    	<span class="prev_img" style="margin-right:-5px;" @mouseover="미리보기(${i})"><img  src="/resources/upload/product/${pvo.file1Arr[i] }" onerror="this.src='/resources/images/이미지준비중.jpg'"> </span> 				
						</c:forEach>
	            	</div>
	            </div>
          	</div>
	        <div id="name" style="position:relative">
	        	<div style="height:27px;">
	                <c:forEach items="${pvo.category1Arr }" var="ca1">
	                 	<c:if test="${ca1 eq 'new' }">
	                 		<img src="/resources/images/상품아래/신상품.gif">
	                 	</c:if>
	                 	<c:if test="${ca1 eq 'sale' }">
	                 		<img src="/resources/images/상품아래/세일.gif">
	                 	</c:if>
	                 	<c:if test="${ca1 eq 'best' }">
	                 		<img src="/resources/images/상품아래/베스트.gif">
	                 	</c:if>
	                 </c:forEach>
                     <c:if test="${pvo.stock eq 0 }">
                 		<img src="/resources/images/상품아래/품절.jpg"><br>
                 	</c:if>
	            </div>                   
	           	${pvo.title }
	            <div id="tmain">
                   <table class="info">
                       <tr class="info" style="margin">
                           <th class="info1">판매가</th>
                           <td class="info1"><span class="price"><fmt:formatNumber value="${pvo.price}" pattern="#,###" /></span>원&nbsp;&nbsp;&nbsp;&nbsp;
                           <c:if test="${pvo.discount ne 0 }">
                              <span class="discount">${pvo.discount }%</span>
                           </c:if>
                                   
                           <span style="display:none" id="ori_price">${pvo.price }</span>
                           <span style="display:none" id="stock">${pvo.stock }</span>
                           <c:if test="${pvo.discount ne 0 }">
                               <span class="cost" style="">${pvo.price2 }</span>원
                           </c:if></td>                     
                       </tr>
                       <tr>
                           <th class="info2">배송방법</th>
                           <td class="info2">택배</td>
                       </tr>
                       <tr>
                           <th class="info3">배송비</th>
                           <td class="info3">3,500원(50,000원 이상 구매 시 무료)</td>
                       </tr>
                       <tr>
                           <th class="info4">수량</th>
                           <td class="info4">
	                           <span style="display:inline-block; height:27px; position:relative;">
									<input v-model="수량" type="text" maxlength="3" @change="문자제거(수량)" size="2">
									<a href="#none" @click="수량업()" id="up" style="position: absolute; left:54px; top:-3px;"><img src="/resources/images/수량업.gif"></a>
			                        <a href="#none" @click="수량다운()" id="down" style="position: absolute; left:54px; top:10px;"><img src="/resources/images/수량다운.gif"></a>
	                           </span>    
							</td>
                       </tr>
                   </table>
	            </div>

                <table id="money">
                    <tr>
                       <th class="tmoney">합계금액</th>
                       <td class="tmoney">{{합계금액|콤마표시}}원</td>
                    </tr>
                </table>
                <ul>
                    <li class="lname"><a @click="즉시구매()" style="color:#fff; cursor:pointer">즉시구매</a></li>
                    <li><a @click="장바구니담기()" style="color:#fff; cursor:pointer">장바구니담기</a></li>
                </ul>	
	       	</div>
	                
          <div class="clear"></div>
          
			<div id="btfTab" class="tab tab-dock-top">
				<ul class="tab-titles">
					<li class="li1">상품상세</li>
					<li class="li2">배송정보</li>
					<li class="li3">리뷰 ({{페이징정보.totalContent}})</li>
					<li class="li4">문의</li>
				</ul>
			</div>
			
			<div class="clear"></div>
           
          
          <!-- 제품상세섹션 -->
           <section style="margin-top:50px;">	               
              <div id="target1">
              	<img src="/resources/images/detail/이용매뉴얼.png">
              </div>
              <div style="float:left">${pvo.content }</div>	
                 <!-- <img src="/resources/images/detail/상품결제정보.png"> -->   
                 <img id="target2" src="/resources/images/detail/배송정보.png">
                 <img src="/resources/images/detail/교환및반품정보.png">	                            	                	         
           </section>
            
                     
            <!-- 리뷰 구역 -->
	        <div class="tb_tit" id="target3">리뷰 ({{페이징정보.totalContent}})</div>
	        
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mem_table">				
				<tr height="100" v-for="(item,i) in 리뷰데이터" :key="i">
					<td width="100">{{item.user_id}}</td>
					<td class="txtb" width="800"><span style="white-space: pre-line;">{{item.content}}</span></td>
					<td>{{item.writedate}}</td>
				</tr>
			</table>    
			
			<!--리뷰 page_div-->			
		    <div id="page_div">
			    <div id="page_select">
			    	<!-- << 버튼 -->
			        <a class="first" @click="페이징(1)"></a>
			        <!-- // -->
			        
			        <!-- < 버튼 -->
			        	<a class="prev" @click="페이징(현재페이지-1)"></a>
			        <!-- // -->
			        
			        <!-- 페이징 -->		
			        <span v-for="item in 페이징리스트">    
			        	<span> 	
					        <a v-if="현재페이지 ==item" class="number" @click="페이징(item)" id="now_num">
					        	{{item}}
					        </a>
					        <a v-else class="number" @click="페이징(item)">
					        	{{item}}
					        </a>
				        </span>  
					</span>
			        <!-- // -->
			        			        
			        <!-- > 버튼 -->
			        	<a class="next" @click="페이징(현재페이지+1)"></a>
			        <!-- // -->
			        			     					
					<!-- >> 버튼 -->
			        <a class="last" @click="페이징(페이징정보.startEnd[2])"></a>
			        <!-- // -->
			    </div>  
		    </div>  
		    <!--//리뷰 page_div-->
			<!-- //리뷰 구역 --> 
     		</div>
			<!-- app닫기 -->  
			
			
			
			<!-- qapp 열기 -->
			<!-- 상품문의 구역 -->
			<div id="qapp" >
		        <div class="tb_tit" id="target4">
		        	상품문의
		        	<span style="float:right">
						<button type="button" class="btn" @click="문의하기새창(${pvo.pd_num})">문의하기</button>
					</span>
		        </div>
		        
		        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mem_table" v-for="(item,i) in 문의데이터" :key="i">				
					<tr height="100">
						<td width="40">질문</td>
						<td width="100">{{item.user_id}}</td>
						<td class="txtb" width="800px">
							<span style="white-space: pre-line;">{{item.title}}</span><br><br>
							<span style="white-space: pre-line;">{{item.content}}</span>
						</td>
						<td>{{item.writedate}}</td>
					</tr>
					<tr v-if="item.status=='답변완료'" class="replytr" height="100">
						<td class="fontred">└ &nbsp;답변</td>
						<td class="replytd">[운영자]</td>
						<td class="txtb replytd" width="800px">
							<span style="white-space: pre-line;">{{item.reply}}</span>
						</td>
						<td>{{item.writedate}}</td>
					</tr>
				</table> 
				
				<!--문의 page_div-->
				<div id="page_div">
				    <div id="page_select">
				    	<!-- << 버튼 -->
				        <a class="first" @click="페이징(1)"></a>
				        <!-- // -->
				        
				        <!-- < 버튼 -->
				        	<a class="prev" @click="페이징(현재페이지-1)"></a>
				        <!-- // -->
				        
				        <!-- 페이징 -->		
				        <span v-for="item in 페이징리스트">    
				        	<span> 	
						        <a v-if="현재페이지 ==item" class="number" @click="페이징(item)" id="now_num">
						        	{{item}}
						        </a>
						        <a v-else class="number" @click="페이징(item)">
						        	{{item}}
						        </a>
					        </span>  
						</span>
				        <!-- // -->
				        
				        <!-- > 버튼 -->
				        	<a class="next" @click="페이징(현재페이지+1)"></a>
				        <!-- // -->
						
						<!-- >> 버튼 -->
				        <a class="last" @click="페이징(페이징정보.startEnd[2])"></a>
				        <!-- // -->
				    </div>  
			    </div>  
			    <!--//문의 page_div-->
			</div>   
			<!-- //상품문의 구역 -->
			<!--//qapp 닫기 -->
		</div>	       
   	</section>
</detail>

<span class="target"></span>
</body>

<!-- 푸터 -->

<jsp:include page="footer.jsp"></jsp:include>

<script>
	let id="${id}";	
	let pd_num = "${pvo.pd_num}";
	let title = "${pvo.title}";
	let price = "${pvo.price}";
	let file1 = "${pvo.file1}".split(";")[0];
	let stock = "${pvo.stock}";
	
//	$(".prev_img").on("mouseover",function(){
//		$("#main_img img").attr("src",$(this).children("img").attr("src"));
//	});

</script>
<script src="/resources/js/product_detail.js"></script>
</html>
