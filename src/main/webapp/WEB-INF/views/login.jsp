<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javaqua</title>
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css">
    <script src="/resources/js/login.js"></script>
    

</head>

<body>
<c:if test="${name != null }"><script>location.href = document.referrer;</script></c:if>
    <div id="header">
        <div id="header2">
            <div id="header_logo" style="width: 1050px;margin: 0px; margin-left: auto; margin-right: auto; ">
                <div class="logo" style="margin: 0px;"> 
                    <a href='/'></a>
                </div>
            </div>
        </div>
    </div>
    <div id="login">
<!--         <h3 id="id_login">계정 로그인</h3> -->
        <form method="post" action="/member/login">
        
        	<c:choose>
        		<c:when test="${cookie.save.value ne null }">
        		<input type="text" name="user_id" placeholder="아이디" id="input_id" value="${cookie.save.value}"><br>
            <input type="password" name="user_pw" placeholder="비밀번호" id="input_password"><br>
            <div id="save"><input type="checkbox" name="save" value="save" checked> 아이디 저장<span style="padding-left: 190px;">      
        		</c:when>
        		<c:otherwise>
        		<input type="text" name="user_id" placeholder="아이디" id="input_id"><br>
            <input type="password" name="user_pw" placeholder="비밀번호" id="input_password"><br>
            <div id="save"><input type="checkbox" name="save" value="save"> 아이디 저장<span style="padding-left: 190px;">
        		</c:otherwise>
        	</c:choose>
            <a href="#none" id="find"> 아이디 찾기 </a><b>|</b>
            <a href="#none" id="find"> 비밀번호 찾기 </a></span><br></div>
            <a href="로그인 버튼"><button type="submit" name="login" class="button"><span class="font_box"><b>로그인</b></span></button></a><br>
            <a href='/member/joinForm'><button type="button" class="button"> <b><span class="font_box"> 계정이 없으신가요? 회원가입</button></a>
        </form>
        <hr id="line">
        <div>
            <p> 다른 방법으로 로그인 </p>
            <a href="#none"><button type="button" class="other_login"><img src="/resources/images/login/facebook.jpg" alt="" class="other_img"><b> Facebook 로그인</b></button></a><br>
            <a href="#none"><button type="button" class="other_login" style="margin-top: 10px;"><img src="/resources/images/login/google.jpg" alt="" class="other_img"><b> Google 로그인</b></button></a>
        </div>
    </div>
    <div class="clear"></div>
</body>

</html>
