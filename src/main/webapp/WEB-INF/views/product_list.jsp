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
    <title>JavaQua</title>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/resources/js/mouse.js"></script>

    

</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
  
    <div id="main">
     	
        <div class = "product_list">
        <!-- <div style="margin-left: auto; margin-right: auto; width:1050px; padding-top:20px;"><a>열대어</a> > <a>랜덤금붕어</a></div> -->
        <!--     <div class = "tit_goods" ><h3><a class="list_name" href='#none'>&nbsp;&nbsp; <c:choose><c:when test="${cri.serTitle ne '' }">'${cri.serTitle }' 검색결과</c:when><c:when test="${cri.category2 eq '%%'}">${cri.category1}1</c:when><c:when test="${cri.serTitle eq ''}">${cri.category2}2</c:when></c:choose>   &nbsp;</a></h3></div> -->          
        	<div class = "tit_goods" ><h3><a class="list_name" href='#none'>&nbsp;&nbsp;${cri.listTitle } &nbsp;</a></h3></div>
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
                        	
                            <li class="cut" id=list_1><a href='/product/productDetail?pd_num=${pd.pd_num }'><span id="list_img"><span style="display:inline-block"><img src="/resources/upload/product/${pd.file1Arr[0] }" onerror="this.src='/resources/images/이미지준비중.jpg'" style="max-width:249px; max-height:249px;"></span>
                            	</span></a>
                                <div class="info_goods" >
                                    <span class="name">                              
                                        <a class="txt" href='/product/productDetail?pd_num=${pd.pd_num }'>${pd.title }</a>
                                    </span><br>
                                    <c:if test="${pd.discount ne 0 }">
                                        <span class="discount">${pd.discount }%</span>
                                        </c:if>
                                    <span class="price">
                                    	
                                        ${pd.price }원
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
                                        
                                        <span class="cost" style="display:block;"><c:if test="${pd.discount ne 0 }">${pd.price2 }원</c:if></span>
                                        
                                    <span class="under">
                                        <a href='#none' @click="장바구니담기(${pd.pd_num}, '${pd.title}', ${pd.price}, '${pd.file1Arr[0]}', '${id}')" class=under_cart></a>

                                    </span>                                                                                                             
                                </div>
                            </li>
                           </c:forEach>                      
                        </ul>
                        <c:if test="${empty pdList }">
                          		<div>
                           		<h2 style="margin-top:100px;display:inline-block ;text-align:center; height:200px; width:1050px;">등록된 상품이 없습니다.</h2>
                           		</div>
                           </c:if>
                    </div>
                </div>
            </div>
        </div>       
        <div id="page_div">
    
    <div id="page_select">
        <a class="first" href="/product/productList?page=1&category1=${cri.category1}&category2=${cri.category2}&order=${cri.order}&serTitle=${cri.serTitle}"></a>
        <c:choose>
        	<c:when test="${cri.page == 1}">
        		<a class="prev" href=""></a>
        	</c:when>
        	<c:otherwise>
        		<a class="prev" href="/product/productList?page=${cri.page-1}&category1=${cri.category1}&category2=${cri.category2}&order=${cri.order}&serTitle=${cri.serTitle}"></a>
        	</c:otherwise>
        </c:choose>
        <c:forEach begin="${paging[0]}" end="${paging[1]}" step="1" var="i">
        
        	
        <a <c:if test="${cri.page == i}">id="now_num"</c:if> class="number" href="/product/productList?page=${i }&category1=${cri.category1}&category2=${cri.category2}&order=${cri.order}&serTitle=${cri.serTitle}">${i}</a>
        	
        
        </c:forEach>
 		<c:choose>
        	<c:when test="${cri.page == paging[2]}">
        		<a class="next" href=""></a>
        	</c:when>
        	<c:otherwise> 
        		<a class="next" href="/product/productList?page=${cri.page+1 }&category1=${cri.category1}&category2=${cri.category2}&order=${cri.order}&serTitle=${cri.serTitle}"></a>
        	</c:otherwise>
        </c:choose>

        <a class="last" href="/product/productList?page=${paging[2] }&category1=${cri.category1}&category2=${cri.category2}&order=${cri.order}&serTitle=${cri.serTitle}"></a>
    </div>  
    </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>

<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
var config = {
		headers:{
			"${_csrf.headerName}":"${_csrf.token}"
		}	
}
function deleteCheck(t,pd_num,file1){
	confirm("'"+t+"'"+" 를 삭제 합니다.");
	console.log(pd_num);
	$.ajax({
		url : "/product/productDelete",
		type : "post",
		data : {pd_num : pd_num,
				file1 : file1},
		beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
		},
		dataType: "text",
		success : function(data){
			console.log(data);
			if(data == 1){
				
				alert("'"+t+"'"+" 삭제완료");
				location.reload();
			}
			else{
				alert("'"+t+"'"+" 삭제실패");
				
			}
			
		},
		error : function(data){
			console.log("send formData error.");
		}
		
	})

}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function(){

	let price = document.querySelectorAll(".price");
	let cost = document.querySelectorAll(".cost");
	for (var i=price.length; i--;){
		price[i].textContent = numberWithCommas(price[i].textContent);
	}
	for (var i=cost.length; i--;){
		cost[i].textContent = numberWithCommas(cost[i].textContent);
	}

});

const v_pdList = new Vue({
	el:"#main",
	data:{
		id : '${id}'
	},
	methods : {
		장바구니담기: function(pd_num, title, price, file1, id){
			console.log(id);
			if(!id){alert("회원만 이용할수 있습니다.");return;}
             const params = new URLSearchParams();
             params.append('pd_num', pd_num);
             params.append('title', title);
             params.append('price', price);
             params.append('amount', 1);
             params.append('file1', file1);
             params.append('user_id', id);
           
             axios.post('/cart/cart_add',params, config)
             .then(res=>{
            	 alert(res.data);
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });				
		}
		
	}
})

</script>
</body>
</html>
