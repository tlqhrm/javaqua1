<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/suport_page.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">  
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<c:choose>
	<c:when test="${empty id and bvo.bd_category2 eq 'contact' }">
		<script>
		alert("접근권한이 없습니다.");
		location.href="/";
		</script>
	</c:when>
	<c:when test="${admin ne 1 and bvo.bd_category2 ne 'contact' }">
		<script>
		alert("접근권한이 없습니다.");
		location.href="/";
		</script>
	</c:when>
	<c:otherwise>
<body>

     <!---header-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--//header-->



<div id="wrap">

<div id="main">
	<div id="snb"><h2>고객센터</h2>
	    <c:choose>
			<c:when test="${bvo.bd_category2 eq 'notice' }">
					<c:set var="board_name" value="공지사항"></c:set>
			</c:when>
			<c:when test="${bvo.bd_category2 eq 'contact' }">
					<c:set var="board_name" value="1:1 문의"></c:set>
			</c:when>
			<c:when test="${bvo.bd_category2 eq 'faq' }">
					<c:set var="board_name" value="자주하는질문"></c:set>
		</c:when>	
	</c:choose>
    
    <ul>
		<a href="boardList?bd_category2=notice&page=1"><li <c:if test="${bvo.bd_category2 eq 'notice' }"> id="now"</c:if>>공지사항</li></a>
       <a href="boardList?bd_category2=faq&page=1"><li <c:if test="${bvo.bd_category2 eq 'faq' }"> id="now"</c:if>>자주하는질문</li></a>
       <a href="boardList?bd_category2=contact&page=1"><li <c:if test="${bvo.bd_category2 eq 'contact' }"> id="now"</c:if>>1:1 문의</li></a>
    </ul><br>
    </div>  <!--snb-->
<div class="contents">
<div id="contents_title"><h2>${board_name }</h2></div><br>
 


<form onsubmit="br()" action = "/board/boardUpdate?${_csrf.parameterName}=${_csrf.token}" name = "contact_write" method = "POST" enctype = "multipart/form-data" class="form">
	<input type="hidden" name="bd_id" value="${bvo.bd_id }">
	<input type="hidden" name="file1" value="${bvo.file1 }">
	<input type="hidden" name="${_csrf.parameterName}"
    		value="${_csrf.token}" />
<table id = "write_form">
    <tbody>
        <tr>
            <td rowspan="2" style="width: 80px;">제목</td>
        	<td><select name="bd_category1">
            	<c:choose>
            		<c:when test="${bvo.bd_category2 eq 'contact'}">
	            		<option value = "">선택해주세요</option>
	                    <option value = "주문/배송" <c:if test="${bvo.bd_category1 eq '주문/배송'}">selected</c:if>>주문/배송</option>
	                    <option value = "교환/환불" <c:if test="${bvo.bd_category1 eq '교환/환불'}">selected</c:if>>교환/환불</option>
	                    <option value = "상품문의" <c:if test="${bvo.bd_category1 eq '상품문의'}">selected</c:if>>상품문의</option>
	                    <option value = "기타" <c:if test="${bvo.bd_category1 eq '기타'}">selected</c:if>>기타</option>
            		</c:when>
            		<c:when test="${bvo.bd_category2 eq 'notice'}">
	            		<option value = "">선택해주세요</option>
	                    <option value = "공지" <c:if test="${bvo.bd_category1 eq '공지'}">selected</c:if>>공지</option>
	                    <option value = "이벤트" <c:if test="${bvo.bd_category1 eq '이벤트'}">selected</c:if>>이벤트</option>
            		</c:when>
            		<c:when test="${bvo.bd_category2 eq 'faq'}">
	            		<option value = "" >선택해주세요</option>
	                    <option value = "주문" <c:if test="${bvo.bd_category1 eq '주문'}">selected</c:if>>주문</option>
	                    <option value = "배송" <c:if test="${bvo.bd_category1 eq '배송'}">selected</c:if>>배송</option>
	                    <option value = "교환/환불" <c:if test="${bvo.bd_category1 eq '교환/환불'}">selected</c:if>>교환/환불</option>
            		</c:when> 
            	</c:choose>
            </td>

        </tr>
        <tr>
            <td><input type="text" name="title" size="50" value="${bvo.title }" required></td>
        </tr>

        <tr>
            <td>내용</td>
            <td><textarea name = "content" rows="30" cols = "100" required style="max-width:fit-content; margin-top:5px;margin-bottom: 5px;"  >${bvo.content }</textarea></td>
        </tr>
        <tr>
            <td>이미지</td>
            <td><input type="file" accept="image/*" name="file"><br>현재 이미지 : <img src="/resources/upload/board/${bvo.file1 }" alt="없음" style="max-width:100px;"></td>

        </tr>
    </tbody>
</table>
<div style="clear:both;"></div>
<a href="#none" onClick="history.go(-1)"><span style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">취소</span></a>
<input type="submit" value="수정하기" onclick="click_btn()" id="write_btn" style="cursor:pointer; height:32px; width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">
<!--  <span onclick="click_btn()" id="write_btn" style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">글쓰기</span>
-->
</form>
<div style="clear:both;"></div>





</div>  <!--contents-->

</div>  <!--main-->

</div>  <!--wrap -->

<jsp:include page="footer.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
<script>
var contents = document.querySelector('textarea');

contents = text.replaceAll("<br>", "\r\n");

function br(){	
	contents.value = contents.value.replace(/(\n|\r\n)/g, '<br>');
}
</script>
	
</body>
</html>