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

<body>

<div id="wrap">

<div id="main">

	    <c:choose>
			<c:when test="${bvo.bd_category2 eq 'notice' }">
					<c:set var="board_name" value="공지사항"></c:set>
			</c:when>
			<c:when test="${bvo.bd_category2 eq 'faq' }">
					<c:set var="board_name" value="자주하는질문"></c:set>
			</c:when>
	</c:choose>

<div class="contents">
<div id="contents_title"><h2>${board_name }</h2></div><br>
 


<form onsubmit="br()" action = "/board/boardWrite?${_csrf.parameterName}=${_csrf.token}" name = "contact_write" method = "POST" enctype = "multipart/form-data" class="form">
	<input type="hidden" name="bd_category2" value="${bvo.bd_category2 }">
	<input type="hidden" name="group_num" value="${bvo.group_num }">
	<input type="hidden" name="step" value="${bvo.step }">
	<input type="hidden" name="indent" value="${bvo.indent }">
	<input type="hidden" name="${_csrf.parameterName}"
    		value="${_csrf.token}" />
<table id = "write_form">
    <tbody>
        <tr> 
            <td>카테고리</td>
        	<td><select name="bd_category1" required>
            	<c:choose>
            		<c:when test="${bvo.bd_category2 eq 'notice'}">
	            		<option value = "">선택해주세요</option>
	                    <option value = "공지">공지</option>
	                    <option value = "이벤트">이벤트</option>
            		</c:when>
	         		<c:when test="${bvo.bd_category2 eq 'faq'}">
	            		<option value = "">선택해주세요</option>
	                    <option value = "주문">주문</option>
	                    <option value = "배송">배송</option>
	                    <option value = "교환/환불">교환/환불</option>
	                    <option value = "기타">기타</option>
            		</c:when> 
            	</c:choose>
            	</select>
            </td>						
        </tr>
        <tr>
       		<td rowspan="1" style="width: 80px;">제목</td>
            <td><input type="text" name="title" size="50" required></td></td>
        </tr>

        <tr>
            <td>내용</td>
            <td><textarea wrap="hard" name = "content" rows="30" cols = "100" required style="max-width:fit-content; margin-top:5px;margin-bottom: 5px;" ></textarea></td>
        </tr>
        <tr>
            <td>이미지</td>
            <td><input type="file" accept="image/*" name="file"></td>
        </tr>
    </tbody>
</table>
<div style="clear:both;"></div>
<a href="#none" onClick="history.go(-1)"><span style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">취소</span></a>
<input type="submit" value="글쓰기" onclick="click_btn()" id="write_btn" style="cursor:pointer; height:32px; width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">
<!--  <span onclick="click_btn()" id="write_btn" style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">글쓰기</span>
-->
</form>
<div style="clear:both;"></div>





</div>  <!--contents-->

</div>  <!--main-->

</div>  <!--wrap -->

<script>

function br(){
	var contents = document.querySelector('textarea');
	contents.value = contents.value.replace(/(\n|\r\n)/g, '<br>');

}

</script>
</body>
</html>