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
    <script src="/resources/js/loginCheck.js"></script>
</head>
<c:choose>
	<c:when test="${empty id and cri.bd_category2 eq 'contact'}">
		<script>
		
		alert("로그인 후 이용해 주세요.")
		location.href="/member/login";
			
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
			<c:when test="${cri.bd_category2 eq 'notice' }">
					<c:set var="board_name" value="공지사항"></c:set>
			</c:when>
			<c:when test="${cri.bd_category2 eq 'contact' }">
					<c:set var="board_name" value="1:1 문의"></c:set>
			</c:when>
			<c:when test="${cri.bd_category2 eq 'faq' }">
					<c:set var="board_name" value="자주하는질문"></c:set>
		</c:when>	
	</c:choose>
    
    <ul>
		<a href="boardList?bd_category2=notice&page=1"><li <c:if test="${cri.bd_category2 eq 'notice' }">id="now"</c:if>>공지사항</li></a>
        <a href="boardList?bd_category2=faq&page=1"><li <c:if test="${cri.bd_category2 eq 'faq' }">id="now"</c:if>>자주하는질문</li></a>
        <a href="boardList?bd_category2=contact&page=1"><li <c:if test="${cri.bd_category2 eq 'contact' }">id="now"</c:if> >1:1 문의</li></a>
        <a href=""><li>매장안내</li></a>

    </ul><br>
</div>  <!--snb-->
        
        
        
    <div class="contents">
    <div id="contact_title"><h2>${board_name}</h2></div><br>

      <table id="notice_list" style="table-layout: fixed">
        <thead>
            <tr>
                <th id="number">번호</th>
                <th id="category">카테고리</th>
                <th id="title">제목</th>
                <th id="writer">작성자</th>
                <th id="write_date">작성일</th>
                <th id="view">조회</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach items="${bdList }" var="bd">
            	<tr>
	                <td class="number">${bd.bd_num }</td>
	                <td class="category">${bd.bd_category1 }</td>
	                <c:choose>
	                	<c:when test="${bd.indent == 0 }">
	     					 <c:choose>
	                			<c:when test="${bd.reply eq 0 }">
	                				<td class="title"><a href="/board/readBoard?bd_id=${bd.bd_id}&page=${cri.page}">${bd.status}<b>${bd.title }</b></a> <c:if test="${not empty bd.file1}"><span><img src="/resources/images/로고/사진 아이콘.png" width="16" height="16"></span></c:if></td>
	                			</c:when>
	                			<c:otherwise>
	                				<td class="title"><a href="/board/readBoard?bd_id=${bd.bd_id}&page=${cri.page}">${bd.status}<b>${bd.title }</b> </a>[${bd.reply}]<c:if test="${not empty bd.file1}"><span ><img src="/resources/images/로고/사진 아이콘.png" width="16" height="16"> </span></c:if></td>
	                			</c:otherwise>
	                		</c:choose>
	                	</c:when>
	                	<c:otherwise>
	                		<c:choose>
	                			<c:when test="${bd.reply eq 0 }">
	                				<td class="title"><a href="/board/readBoard?bd_id=${bd.bd_id}&page=${cri.page}">${bd.status}<c:forEach begin="1" end="${bd.indent}" step="1">&nbsp&nbsp&nbsp&nbsp</c:forEach><b>└re : ${bd.title }</b></a><c:if test="${not empty bd.file1}"><span><img src="/resources/images/로고/사진 아이콘.png" width="16" height="16"></span></c:if></td>
	                			</c:when>
	                			<c:otherwise>
	                				<td class="title"><a href="/board/readBoard?bd_id=${bd.bd_id}&page=${cri.page}">${bd.status}<c:forEach begin="1" end="${bd.indent}" step="1">&nbsp&nbsp&nbsp&nbsp</c:forEach><b>└re : ${bd.title }</b></a>[${bd.reply}]<c:if test="${not empty bd.file1}"><span ><img src="/resources/images/로고/사진 아이콘.png" width="16" height="16"></span></c:if></td>
	                			</c:otherwise>
	                		</c:choose>
	                		
	                	</c:otherwise>
	                </c:choose>	                
	                <td class="writer">${bd.user_id }</td>
	                <td class="write_date">${bd.updateDate }</td>
	                <td class="view">${bd.hit }</td>
            	</tr>
            </c:forEach> 												 												
        </tbody>
    </table>
    <div style="clear:both;"></div>

    	<c:if test="${empty bdList and cri.bd_category2 eq 'contact' }">
   			<div class="no_data" style="padding:150px 0 148px;border-top:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;color:#4c4c4c;font-size:12px;">
			1:1문의가 존재하지 않습니다.
			</div>
    	</c:if>
    	<c:if test="${empty bdList and cri.bd_category2 eq 'faq' }">
   			<div class="no_data" style="padding:150px 0 148px;border-top:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;color:#4c4c4c;font-size:12px;">
			자주하는 질문이 존재하지 않습니다.
			</div>
    	</c:if>
    	<c:if test="${empty bdList and cri.bd_category2 eq 'notice' }">
   			<div class="no_data" style="padding:150px 0 148px;border-top:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;color:#4c4c4c;font-size:12px;">
			공지사항이 존재하지 않습니다.
			</div>
    	</c:if>

	<c:choose>
		<c:when test="${not empty id and cri.bd_category2 eq 'contact'}">
			<a href="/board/boardWriteForm?bd_category2=${cri.bd_category2}" onClick="return loginCheck(${id})"><span style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:10px;">글쓰기</span></a>
		</c:when>
		<c:when test="${admin eq 1 }">
			<a href="/board/boardWriteForm?bd_category2=${cri.bd_category2}" onClick="return loginCheck(${id})"><span style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:10px;">글쓰기</span></a>
		</c:when>
	</c:choose>
    

    <div id="page_div">
    
    <div id="page_select">
        <a class="first" href="boardList?bd_category2=${cri.bd_category2}&page=1"></a>
        <c:choose>
        	<c:when test="${cri.page == 1}">
        		<a class="prev" href=""></a>
        	</c:when>
        	<c:otherwise>
        		<a class="prev" href="boardList?bd_category2=${cri.bd_category2}&page=${cri.page-1}"></a>
        	</c:otherwise>
        </c:choose>
        <c:forEach begin="${paging[0]}" end="${paging[1]}" step="1" var="i">
        <c:choose>
        	<c:when test="${cri.page != i}">
        		<a class="number" href="boardList?bd_category2=${cri.bd_category2}&page=${i}">${i}</a>
        	</c:when>
        	<c:otherwise>
				<a class="number" id="now_num" href="boardList?bd_category2=${cri.bd_category2}&page=${i}">${i}</a>
        	</c:otherwise>
        </c:choose>
        
        </c:forEach>
 		<c:choose>
        	<c:when test="${cri.page == paging[2]}">
        		<a class="next" href=""></a>
        	</c:when>
        	<c:otherwise>
        		<a class="next" href="boardList?bd_category2=${cri.bd_category2}&page=${cri.page+1}"></a>
        	</c:otherwise>
        </c:choose>

        <a class="last" href="boardList?bd_category2=${cri.bd_category2}&page=${paging[2]}"></a>
    </div>  
    </div>  <!--page_div-->
	<form action="/board/boardList" method="get">
		<input type="hidden" name="bd_category2" value="${cri.bd_category2}">
		<input type="hidden" name="page" value="1">
    <div id="search_checkbox">
    <table>
    <tbody>
    <tr>
    <td class="input_txt">
        <img src="https://www.kurly.com/shop/data/skin/designgj/images/board/ico_function.gif">검색어
    </td>
    
        <td class="stxt">
        <input type="checkbox" name="serBoard" value="serName" <c:if test="${cri.serSet[0] eq cri.checker}">checked</c:if>> 아이디
        <input type="checkbox" name="serBoard" value="serTitle" <c:if test="${cri.serSet[1] eq cri.checker}">checked</c:if>> 제목
        <input type="checkbox" name="serBoard" value="serContent" <c:if test="${cri.serSet[2] eq cri.checker}">checked</c:if>> 내용&nbsp;
    </td> 
    <td>
        <div class="search_btn">
            <input type="text" name="word" value="${cri.word}">
            <input type="submit" value="       " style="background:url(https://www.kurly.com/shop/data/skin/designgj/images/board/search.png); width=34px; hight=34px;">     
        </div>
        
    </td>
    </tr>
    </tbody>
    </table>
    </div>
    </form>



    </div>  <!--contents-->

    </div>  <!--main-->
</div>  <!--wrap -->


<jsp:include page="footer.jsp"></jsp:include>

</c:otherwise>
</c:choose>
</body>
</html>
