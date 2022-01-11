<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
	<link rel="stylesheet" href="/resources/css/header.css">
	<!-- axios 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	   		    	    
    <!-- vuejs 추가 -->
   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
</head>

<div id="header">
	<div id="header2">
          <div id="header_logo">
              <div class="logo" style="margin: 0px;"> 
                <a href='/'></a>
            </div>
        </div>                       
        <div class="frame">        
                &nbsp;&nbsp;&nbsp; github : <a href="https://github.com/tlqhrm/javaqua1.git" style="color:rgb(3, 140, 232)">github.com/tlqhrm/javaqua1.git</a>
                          
	                <ul id='join_login'>
	                <li class="no_mypage">
	                	<form action="/member/logout" method='post' id="frm">
							<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
							<span class="right_border" onClick="document.getElementById('frm').submit()" style="cursor:pointer">로그아웃</span>
						</form></li>
	                    <li id="mypage"><a href="/order/order_list" class="right_border blue">님&nbsp;&nbsp;</a>                       
	                    </li>	                   
	                </ul>
            </div>
            <span><h1>관리자페이지</h1></span>
    </div>
    <div id="header3">
        <div class="frame">
            <div class="menu">                   
                <ul>
                    <li><a href="/admin/member">회원관리</a></li>
                    <li><a href="/admin/product">상품관리</a></li>
                    <li><a href="/admin/order">주문관리</a></li>
                    <li><a href="/admin/board/notice">게시판관리</a></li>
                </ul>
            </div>  
        </div>
    </div>     
</div>
