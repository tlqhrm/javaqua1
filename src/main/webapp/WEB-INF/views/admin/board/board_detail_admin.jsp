<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    
    <link href="/resources/css/suport_page.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

</head>

<body>


<span id="bd_category2" style="display:none">${bvo.bd_category2}</span>
<span id="bd_id" style="display:none">${bvo.bd_id}</span>
<span id="id" style="display:none">${id}</span>
<span id="reply" style="display:none">${bvo.reply}</span>
<span id="admin" style="display:none">${admin}</span>
<div id="wrap">

    <div id="main" >

              

<div class="contents">
    <div id="contact_title"><h2>${board_name}</h2></div><br>
<table id='contents_table'>
    <tbody id="content_body">
        <tr>
            <td style="width: 80px;">제목</td>
            <td id="title" colspan="3">${bvo.status}${bvo.title}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td id="author" colspan="3">${bvo.user_id }</td>
        </tr>
        <tr>
            <td>작성일</td>
            <td id="date">${bvo.updateDate }</td>
            <td style="width : 80px;">조회수</td>
            <td id="views">${bvo.hit }</td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><div id="subject" style="min-height: 400px;">${bvo.content }
            <c:choose>
            	<c:when test="${not empty bvo.file1 }">
            		<br><img src="http://localhost:8090/resources/upload/board/${bvo.file1 }" alt="이미지" style="max-width:450px;">
            	</c:when>
            </c:choose>
            </div></td>
            
        </tr>
        </tbody>
    </table>
</div>  <!--contents-->




 








</div>  <!--main-->

</div>  <!--wrap -->

<script>


var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

var v_comments = new Vue({
	el:'#comments',
	data:{
		list : "",
		user_id : '${bvo.user_id}',
		bd_category2 : '${bvo.bd_category2}'
	},

	methods:{
		delete_Check(){
			return confirm("정말 삭제 하시겠습니까?");
		},
		
		check(){
			
			console.log(this.test);
			console.log(v_comments.test);
		}
		
		
	}
	
})




var comment_origin = new Array;
var btn_origin = new Array;
var row1;





	
</script>

</body>

</html>
