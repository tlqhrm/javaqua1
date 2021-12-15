<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/product_list.css">
    <link rel="stylesheet" href="/resources/css/footer.css">
    <link rel="stylesheet" href="/resources/css/header.css">
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="/resources/js/jquery.js"></script> -->
    <script src="/resources/js/mouse.js"></script>
    

    

</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
  
    <div id="main">
     	
        <div class = "product_list">
        <!-- <div style="margin-left: auto; margin-right: auto; width:1050px; padding-top:20px;"><a>열대어</a> > <a>랜덤금붕어</a></div> -->
            <div class = "tit_goods" ><h3><a class="list_name" href='#none'>&nbsp;&nbsp; <c:choose><c:when test="${cri.category1 ne '%%'}">${cri.category1}1</c:when><c:when test="${cri.serTitle eq '%%'}">${cri.category2}2</c:when><c:otherwise >'${cri.serTitle }' 검색결과</c:otherwise></c:choose>   &nbsp;</a></h3></div>          
            <div style="margin-left: auto; margin-right: auto; width:1050px; padding-top:20px;  ">
            	<span style="float:right; padding-bottom:20px;"><a href="/product/productList?page=1&category2=${cri.category2 }&order=registdate&serTitle=${cri.serTitle }&category1=${cri.category1 }" class="<c:if test='${cri.order eq "registdate"}'>now_order</c:if>">신상품순</a>
            	&nbsp;&nbsp;<a href="/product/productList?page=1&category2=${cri.category2 }&order=salescount&serTitle=${cri.serTitle }&category1=${cri.category1 }" class="<c:if test='${cri.order eq "salescount"}'>now_order</c:if>">판매량순</a>
            	&nbsp;&nbsp;<a href="/product/productList?page=1&category2=${cri.category2 }&order=price&serTitle=${cri.serTitle }&category1=${cri.category1 }" class="<c:if test='${cri.order eq "price"}'>now_order</c:if>">높은가격순</a></span>
            </div>
            <div class = "list_goods">
                <div class="bx-wrapper">
                    <div class="bx-viewport">                    
                        <ul class="list_1" style=" position:relative; list-style: none; margin: 0px; float: left; padding: 0px;">
                        	<c:forEach items="${pdList }" var="pd">
                        	
                            <li class="cut" id=list_1><a href='/product/productDetail?pd_num=${pd.pd_num }'><img src="/upload/${pd.file1 }" onerror="this.src='/resources/images/이미지준비중.jpg'" style="max-width:249px; max-height:249px;"></a>
                                <div class="info_goods" >
                                    <span class="name">                              
                                        <a class="txt" href='/product/productDetail?pd_num=${pd.pd_num }'>${pd.title }</a>
                                    </span><br>
                                    <span class="price">
                                    	<c:if test="${pd.discount ne 0 }">
                                        <span class="discount">${pd.discount }%</span>
                                        </c:if>
                                        ${pd.strPrice }원
                                    </span>  
                                    <c:forEach items="${pd.category1Arr }" var="ca1">
                                    	<c:if test="${ca1 eq 'new' }">
                                    		<span class="icon_new"></span>
                                    	</c:if>
                                    	<c:if test="${ca1 eq 'sale' }">
                                    		<span class="icon_sale"></span>
                                    	</c:if>
                                    	<c:if test="${ca1 eq 'best' }">
                                    		<span class="icon_best"></span>
                                    	</c:if>
                                    </c:forEach>
                                        <c:if test="${pd.stock eq 0 }">
                                    		<span class="icon_stock"></span>
                                    	</c:if>
                                        
                                        <span class="cost" style="display:block;"><c:if test="${pd.discount ne 0 }">${pd.strPrice2 }원</c:if></span>
                                        
                                    <span class="under">
                                        <a href='#none' class=under_cart></a>
                                        <a href='#none' class=under_wish></a>
                                        <c:if test="${admin eq 1 }">
                                        <span >
                                        <button type="button" onClick="location.href='JavaquaServlet?command=product_update_form&pd_num=${pd.pd_num}'">수정</button>
                                        <button type="button" onClick="deleteCheck('${pd.title}','${pd.pd_num }')">삭제</button>
                                        </span>
                                        </c:if>
                                    </span>                                                                                                             
                                </div>
                            </li>
                            
                           </c:forEach> 
                        </ul>
                    </div>
                </div>
            </div>
        </div>       
        <div id="page_div">
    
    <div id="page_select">
        <a class="first" href="JavaquaServlet?command=${bd_category2}_list&page=1"></a>
        <c:choose>
        	<c:when test="${page == 1}">
        		<a class="prev" href=""></a>
        	</c:when>
        	<c:otherwise>
        		<a class="prev" href="JavaquaServlet?command=${bd_category2}_list&page=${page-1}"></a>
        	</c:otherwise>
        </c:choose>
        <c:forEach begin="${paging[0]}" end="${paging[1]}" step="1" var="i">
        <c:choose>
        	<c:when test="${page != i}">
        		<a class="number" href="JavaquaServlet?command=${bd_category2}_list&page=${i}">${i}</a>
        	</c:when>
        	<c:otherwise>
				<a class="number" id="now_num" href="JavaquaServlet?command=${bd_category2}_list&page=${i}">${i}</a>
        	</c:otherwise>
        </c:choose>
        
        </c:forEach>
 		<c:choose>
        	<c:when test="${page == paging[2]}">
        		<a class="next" href=""></a>
        	</c:when>
        	<c:otherwise>
        		<a class="next" href="JavaquaServlet?command=${bd_category2}_list&page=${page+1}"></a>
        	</c:otherwise>
        </c:choose>

        <a class="last" href="JavaquaServlet?command=${bd_category2}_list&page=${paging[2]}"></a>
    </div>  
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
<script>
function deleteCheck(t,n){
	confirm("'"+t+"'"+" 를 삭제 합니다.");
	location.href='JavaquaServlet?command=product_delete&pd_num='+n;
}
</script>
</body>
</html>
