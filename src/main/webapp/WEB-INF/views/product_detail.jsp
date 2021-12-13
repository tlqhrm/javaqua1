<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/suport_page.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/header.css">    
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/loginCheck.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    
    <link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/product_detail.css">
</head>

<body>

     <!---header-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--//header-->


<body>
<detail id="detail"> 
    <section id="detailmain">
        <div id="detail">
            <div id="bg1">
         		<div id="bg2" style="text-align:center; display:inline-block;">     
         			<span ><img id="main_img" src="/resources/upload/${pvo.file1Arr[0] }" onerror="this.src='/resources/images/이미지준비중.jpg'" style="margin-left:auto; margin-right:auto;"></span>
         			<div id="bg3" style=" float:left;">
         			<c:set var="size" value="${fn:length(pvo.file1Arr)}" />
         			
         			<c:choose>
         				<c:when test="${size > 3 }">
         					<c:set var="size" value="5" />
         				</c:when>
         				<c:otherwise>
         					<c:set var="size" value="2" />
         				</c:otherwise>
         			</c:choose>
 
					<c:forEach var="i" begin="0" end="${size - 1}">					
					    <span class="prev_img" style=""><img src="/resources/upload/${pvo.file1Arr[i] }" onerror="this.src='/resources/images/이미지준비중.jpg'"> </span> 
					
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
                                <td class="info1"><span class="price">${pvo.price }</span>원&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${pvo.discount ne 0 }">
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
                                    <input id="count" type="text" size="2" name="stock" value="1">
                                    <a href="#none" onClick="changeCount('up')" id="up"><img src="/resources/images/수량업.gif"></a>
                                    <a href="#none" onClick="changeCount('down')" id="down"><img src="/resources/images/수량다운.gif"></a>
                                </span>    
								</td>
                            </tr>
                        </table>
                        <div id="tinfo">
                            (최소주문수량 1개 이상)<p id="tinfo"><img src="/resources/images/detail/느낌표.png" style="margin-top: 3px;">
                                위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.
                            </p>
                        </div>
                    </div>
                    <table id="money">
                        <tr>
                            <th class="tmoney">총 상품금액</th>
                            <td class="tmoney"><span id="price"></span>원</td>
                        </tr>
                    </table>
                    <ul>
                        <li class="lname"><a href="#none">즉시구매</a></li>
                        <li><a href="basket.html">장바구니담기</a></li>
                        <li><a href="#none">찜하기</a></li>
                    </ul>

                </div>
                
                <div class="clear"></div>

                <!-- 제품상세섹션 -->

            <section style="margin-top:50px;">
               
                	<div>
                    <img src="/resources/images/detail/이용매뉴얼.png">
                    </div>
                	<div style="float:left">${pvo.content }</div>

                    <!-- <img src="/resources/images/detail/상품결제정보.png"> -->
                    <img src="/resources/images/detail/배송정보.png">
                    <img src="/resources/images/detail/교환및반품정보.png">
               
                
              

            </section>

        </div>
    </section>
</detail>
<span class="target"></span>
<script src="/resources/js/detail.js"></script>
<script src="/resources/js/product_detail.js"></script>
</body>

<!-- 푸터 -->

<jsp:include page="footer.jsp"></jsp:include>
</html>
