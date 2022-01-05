<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
