<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
    <head>
        <title>JavaQua</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">

        <link rel="stylesheet" href="/resources/css/header.css">    
        <link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
        <link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	
	
    </head>
	
	<c:choose>
		<c:when test="${empty id }">
			<script>history.go(-1)</script>
		</c:when>
		<c:otherwise>

	
    <body>
        <!---header-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--//header-->z

    <div id="login" style="height: 300px; margin-top:100px">
        <h3 >회원정보 확인</h3>
        <form method="post" action="/member/passwordCheck">
        	<input type="text" name="user_id" placeholder="아이디" id="input_id" value="${id}" readonly><br>
            <input type="password" name="user_pw" placeholder="비밀번호" id="input_password"><br>     
            <a href="로그인 버튼"><button type="submit" name="login" class="button"><span class="font_box"><b>확인</b></span></button></a><br>
        </form>
        
    </div>


        <!--footer-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--//footer-->
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script>
		var user_id = '${mvo.user_id}';
		</script>

     	<script src="/resources/js/member_update.js"></script> 
     	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
    		</c:otherwise>
	</c:choose>
</html>