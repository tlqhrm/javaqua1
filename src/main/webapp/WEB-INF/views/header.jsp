<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Insert title here</title>
<script src="/resources/js/header.js"></script>
<!-- 자바스크립트 쿠키 cdn -->

<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/header.css">   
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<c:if test="${serTitle eq '%%'}"><c:set var="serTitle" value=""></c:set></c:if>

  <div id="header">
        <div id="header2">
            <div id="header_logo"">
                <div class="logo" style="margin: 0px;"> 
                    <a href='/'></a>
                </div>
            </div>
            <div class="frame">
                <div id="takbae">
                    <a href="#none">※ <span class="red">생물 </span>배송안내 > ※</a>
                </div>
                <c:choose>
                <c:when test="${name == null}">
                <ul id='join_login'>
                    <li class="no_mypage"><a href='/member/joinForm' class="right_border red">회원가입</a></li>
                    <li class="no_mypage"><a href='/member/login' class="right_border">로그인</a></li>       
                    <li class="no_mypage"><a href='/cart/cart_list' class="right_border">장바구니</a></li>
                    <li id="consumer_center"><a href='/board/boardList?bd_category2=notice&page=1' >고객센터</a><span id="un3"></span>
                    <ul>
                        <li><a href="/board/boardList?bd_category2=notice&page=1">공지사항</a></li>
                        <li><a href="/board/boardList?bd_category2=faq&page=1">자주하는 질문</a></li>
                        <li><a href='/board/boardList?bd_category2=contact&page=1'>1:1 문의</a></li>
                    </ul></li>
                </ul>
                </c:when>
                <c:otherwise>
                <ul id='join_login'>
                <li class="no_mypage"><a href='/member/logout' class="right_border">로그아웃</a></li>
                    <li id="mypage"><a href='JavaquaServlet?command=join_form' class="right_border blue">${name } 님&nbsp;&nbsp;</a><span id="un1"></span>
                        <ul>
                            <li><a href='/order/order_list'>주문내역 조회</a></li>
                            <li><a href="#none">개인정보 수정</a></li>
                        </ul></li>
                    
                    <li class="no_mypage"><a href='/cart/cart_list' class="right_border">장바구니</a></li>
                    <li class="no_mypage" id="consumer_center"><a href='/board/boardList?bd_category2=notice&page=1' >고객센터</a><span id="un2"></span>
                    <ul>
                        <li><a href="/board/boardList?bd_category2=notice&page=1">공지사항</a></li>
                        <li><a href="/board/boardList?bd_category2=faq&page=1">자주하는 질문</a></li>
                        <li><a href='/board/boardList?bd_category2=contact&page=1'>1:1 문의</a></li>
                    </ul></li>
                </ul>
                </c:otherwise>
                </c:choose>
            </div>
            <div id="notice">
                <div class="title">
                    <a href="#none">
                        <div id="icon"></div>
                        <div id="no">NOTICE</div>
                    </a>   
                </div>
            </div>                
            <div class="content">
                <ul id="notice_list">
                    <li><a href="#none">직원 & 아르바이트생 모집</a></li>
                    <li><a href="#none">콜럼비아 야생 임제 수입</a> </li>
                    <li><a href="#none">독일수입소식</a></li>
                    <li><a href="#none">실지렁이 입고</a></li>
                    <li><a href="#none">인도네시아 & 인도 수입종 입하소식</a></li>
                    <li><a href="#none">베타 코이 암컷입고</a></li>
                    <li><a href="#none">직원 & 아르바이트생 모집</a></li>
                </ul>
            </div>         
            <c:if test="${admin eq 1}">
            	<div><h1 style="display: inline-block;">관리자 로그인 입니다.</h1><span style="position: absolute;right: 10px; z-index:10;"><button type="button" onClick="location.href='/product/productRegistForm'">상품등록</button></span></div>
            </c:if>         
        </div>
        <div id="header3">
            <div class="frame">
                <div class="menu">                   
                    <ul>
                        <li id="view_all"><a href="/product/productList?page=1" ><div><span id="s_1"></span><span id="s_2"></span><span id="s_3"></span></div>전체보기</a> </li>
                        <li><a href="/product/productList?page=1&category1=new">신상품</a></li>
                        <li><a href="/product/productList?page=1&category1=best">베스트</a></li>
                        <li><a href="/product/productList?page=1&category1=sale">할인상품</a></li>
                        <li><a href="/product/productList?page=1&category2=수초">수초</a></li>
                    </ul>
                    <div id="side_search">
                        <form action="/product/productList" method="get">
                        	<input type="hidden" name="page" value="1">                      	
                            <input type="text" class="text_btn text_btn_clear" placeholder="검색어를 입력하세요." value="${cri.serTitle}" name="serTitle">
                            <input type="image" class="search_btn" src="/resources/images/헤더/검색버튼.png">
                            
                            <div>
                                <button type="button" class="del_btn">
                            </div>
                        </form>                      
                    </div>
                </div>  
            </div>
        </div>
        <div id="header4">
            <div class="frame">
                <div>                                   
                    <ul class='h_menu' id='b_left'>
                        <h3>열대어</h3> 
                        <li><a href="/product/productList?page=1&category2=금붕어">금붕어<span>></span></a>
                            <ul id="h_menu_gold">
                                <li><a href="/product/productList?page=1&category2=랜덤 금붕어">랜덤 금붕어</a></li>
                                <li><a href="/product/productList?page=1&category2=최상급 금붕어">최상급 금붕어</a></li>
                                <li><a href="/product/productList?page=1&category2=오란다">오란다</a></li>
                                <li><a href="/product/productList?page=1&category2=난주">난주</a></li>
                                <li><a href="/product/productList?page=1&category2=점보">점보</a></li>
                                <li><a href="/product/productList?page=1&category2=진주린">진주린</a></li>
                            </ul>
                        </li>
                        <li><a href="/product/productList?page=1&category2=구피">구피</a></li>
                        <li><a href="/product/productList?page=1&category2=플래티/몰리">플래티/몰리</a></li>
                        <li><a href="/product/productList?page=1&category2=테트라">테트라</a></li>
                        <li><a href="/product/productList?page=1&category2=베타/구라미">베타/구라미<span>></span></a>
                            <ul id="h_menu_beta">
                                <li><a href="/product/productList?page=1&category2=랜덤 베타">랜덤 베타</a></li>
                                <li><a href="/product/productList?page=1&category2=실물 베타">실물 베타</a></li>
                                <li><a href="/product/productList?page=1&category2=야생 베타">야생 베타</a></li>
                                <li><a href="/product/productList?page=1&category2=구라미">구라미</a></li>
                            </ul>
                        </li>
                        <li><a href="/product/productList?page=1&category2=라스보라/레인보우">라스보라/레인보우</a></li>
                        <li><a href="/product/productList?page=1&category2=코리/플레코/캣">코리/플레코/캣</a></li>
                        <li><a href="/product/productList?page=1&category2=엔젤/디스커스">엔젤/디스커스</a></li>
                        <li><a href="/product/productList?page=1&category2=라미네지/시클리드">라미네지/시클리드</a></li>
                        <li><a href="/product/productList?page=1&category2=애완새우/달팽이">애완새우/달팽이<span>></span></a>
                            <ul id="h_menu_shirimp">
                                <li><a href="/product/productList?page=1&category2=생이새우">생이새우</a></li>
                                <li><a href="/product/productList?page=1&category2=비쉬림프">비쉬림프</a></li>
                                <li><a href="/product/productList?page=1&category2=패각류">패각류</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class='h_menu'id='b_right'>
                        <h3>수초</h3> 
                        <li><a href="/product/productList?page=1&category2=전경수초">전경수초</a></li>
                        <li><a href="/product/productList?page=1&category2=중경수초">중경수초</a></li>
                        <li><a href="/product/productList?page=1&category2=후경수초">후경수초</a></li>
                        <li><a href="/product/productList?page=1&category2=씨앗수초">씨앗수초</a></li>
                        <li><a href="/product/productList?page=1&category2=부상수초">부상수초</a></li>
                        <li><a href="/product/productList?page=1&category2=음성수초">음성수초</a></li>
                    </ul>
                </div>  
            </div>
        </div>       
    </div>
	    <div id="recent_div_1"> 
		<h3 style="position:relative; background-color:rgb(244, 244, 244); z-index:2; margin:0px; padding:18.72px 0px 18.72px 0;">최근 본 상품</h3>
			<div id="recent_div_1-2">
				<div id="recent_div_2" >
					<ul id="recent_ul" >

						<li @click="상세페이지(item.pd_num)" v-for="item in cookieArr" class="recent_box_1" >
							<div class="recent_box_2"  :style="{'background-image':'url(/resources/upload/product/'+item.file1+')'}"></div>
							<div class="recent_title">{{품명(item.title)}}</div>
							<div v-if="item.price2 == null" class="recent_price2">{{item.price}}원</div>
							<div v-if="item.price2 != null" class="recent_price">{{item.price}}원</div>
							<div v-if="item.price2 != null" class="recent_price2">{{item.price2}}원</div>
						</li>
					</ul>
				</div>
			</div>
			<ul id="recent_updown" style="z-index:3; display:inline-block; width:90px; height:30px; float:left; margin:0px; border-top:1px #f4f4f4 solid">
			    <li @click="위로()" id="recent_up">
			    	<img src="/resources/images/화살표/최근상품 위에.gif" width=30px height=20px style="padding:5px 17.5px 5px 17.5px">
			    </li>
			    <li @click="아래로()" id="recent_down" >
			    	<img src="/resources/images/화살표/최근상품 아래.gif" width=30px height=20px style="padding:5px 17.5px 5px 17.5px">
			    </li>
   			</ul>
		</div>
<script>
 



</script>
</body>
</html>