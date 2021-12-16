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
<c:choose>
	<c:when test="${admin ne 1 and id ne bvo.user_id and bvo.bd_category2 eq 'contact' }">
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


<span id="bd_category2" style="display:none">${bvo.bd_category2}</span>
<span id="bd_id" style="display:none">${bvo.bd_id}</span>
<span id="id" style="display:none">${id}</span>
<span id="reply" style="display:none">${bvo.reply}</span>
<span id="admin" style="display:none">${admin}</span>
<div id="wrap">

    <div id="main" >
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
       <a href=""><li>매장안내</li></a>
    </ul><br>
</div>  <!--snb-->
        
        

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
<div class="contents" style="float:right"  id="comments"> 

    <table>
        <tbody>     
        
        
        <tr v-if="bd_category2 == 'contact'">
       		<td id="comment_count" style="max-width:fit-content; margin-top:5px; border-bottom:0px">댓글({{length}})</td>
       </tr>
       <tr v-if="bd_category2 == 'contact'" style=margin-bottom:50px;>
        	<td style="max-width:fit-content; margin-top:5px; border-bottom:0px">${id }</td>
            <td  style="max-width:fit-content; margin-top:5px; border-bottom:0px; width:50px"><textarea required id="input_comment" name = "comment" rows="4" cols = "80" required style="max-width:fit-content; margin-top:5px; resize:none;"></textarea></td>
            <td style="max-width:fit-content; margin-top:5px; border-bottom:0px; "><button id="regButton" @click="commentReg(${bvo.bd_id },'${id}')">등록</button></td>
        </tr>
       <tr v-for="(item,index) in list" class="comment">
			<td>
				<span v-if="'${bvo.user_id}' == item.user_id"><b>{{item.user_id}}<br>(글쓴이)</b></span>
				<span v-if="'${bvo.user_id}' != item.user_id"><b>{{item.user_id}}</b></span>
					
			</td>
			<td v-show="item.status == true" :id = "'comment'+index"><div style="width:570px; word-break:break-all">{{item.updateDate}}<br><br><span :id ="'comment_text'+index"style='font-size:17px;'>{{item.comment1}}</span></div></td>
			<td v-show="item.status == false" :id = "'comment'+index"><textarea  :id='"update_comment"+index' name = 'comment' rows='4' cols = '80' required style='max-width:fit-content; margin-top:5px; resize:none;'>{{item.comment1}}</textarea></td>
			<td v-if="('${id}' == item.user_id || ${admin} == 1) && item.status == true" :id="'btn'+index" ><button  @click="updateComment(index, item.re_num , ${bvo.bd_id })">수정</button><button @click="deleteComment(index, item.re_num , ${bvo.bd_id })">삭제</button></td>	
			<td v-if="('${id}' == item.user_id || ${admin} == 1) && item.status == false" :id="'btn'+index" ><button @click="updateReg(index,item.re_num,item.bd_id)">등록</button><button @click="updateCancle(index)">취소</button></td>
			
		</tr>

<!-- <tbody>     
        
        <c:if test="${bvo.bd_category2 eq 'contact' }">
        <tr><td id="comment_count" style="max-width:fit-content; margin-top:5px; border-bottom:0px">댓글(${bvo.reply })</td></tr>
        <tr style=margin-bottom:50px;>
        	<td style="max-width:fit-content; margin-top:5px; border-bottom:0px">${id }</td>
            <td  style="max-width:fit-content; margin-top:5px; border-bottom:0px; width:50px"><textarea required id="input_comment" name = "comment" rows="4" cols = "80" required style="max-width:fit-content; margin-top:5px; resize:none;"></textarea></td>
            <td style="max-width:fit-content; margin-top:5px; border-bottom:0px; "><button id="regButton" onClick="commentReg(${bvo.bd_id },'${id}')">등록</button></td>
        </tr>
       <c:choose>
			<c:when test="${not empty commentList }">
				<c:forEach items="${commentList }" var="cl" varStatus="i" begin="0" end="${fn:length(commentList) }" step="1">
					<tr class="comment">
						<td>
							<c:choose>
								<c:when test="${bvo.user_id eq cl.user_id }">
									<b>${cl.user_id}<br>(글쓴이)</b>
								</c:when>
								<c:otherwise>
									<b>${cl.user_id }</b>
								</c:otherwise>
							</c:choose>
						</td>
						<td id = "comment${i.index + 1}"><div style="width:570px; word-break:break-all">${cl.writeDate }<br><br><span id = "comment_text${i.index + 1}"style='font-size:17px;'><b>${cl.comment1}</b></span></div></td>
						<c:choose>
							<c:when test="${cl.user_id eq id  or admin eq 1}">
								<td id="btn${i.index + 1}" ><button  onClick="updateComment(${i.index + 1}, ${cl.re_num }, ${bvo.bd_num },'${bvo.bd_category2 }')">수정</button><button onClick="deleteComment(${i.index + 1},${cl.re_num },${bvo.bd_num },'${bvo.bd_category2 }')">삭제</button></td>
							</c:when>
						</c:choose>			
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>  
		</c:if>
    </tbody> --> 
		
    </tbody>
</table>
</div>



 
<div style="clear:both;"></div>
<a href="boardList?bd_category2=${bvo.bd_category2 }&page=${page}" ><span style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">글 목록</span></a>
	<c:if test="${admin eq 1 and bvo.bd_category2 ne 'contact' }">
		<form action="/board/boardUpdateForm" method="post">
		
		<input type="hidden" name="bd_id" value="${bvo.bd_id }">
		<input type="hidden" name="bd_category1" value="${bvo.bd_category1 }">
		<input type="hidden" name="bd_category2" value="${bvo.bd_category2 }">
		<input type="hidden" name="title" value="${bvo.title }">
		<input type="hidden" name="content" value="${bvo.content }">
		<input type="hidden" name="file1" value="${bvo.file1 }">
		<input type="submit" value="수정하기" id="update_btn" style="cursor:pointer; height:32px; width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">
	</form>
	<form action="/board/deleteBoard" method="post">
		<input type="hidden" name="bd_category2" value="${bvo.bd_category2 }">
		<input type="hidden" name="bd_id" value="${bvo.bd_id}">
		<input type="submit" onClick="return delete_Check()" value="삭제하기" style="cursor:pointer; height:32px; width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">
	</form>		
		
	</c:if>
	<c:if test="${(id eq bvo.user_id or admin eq 1) and bvo.bd_category2 eq 'contact' }">
	<form action="/board/boardUpdateForm" method="post">
		<input type="hidden" name="bd_id" value="${bvo.bd_id }">
		<input type="hidden" name="bd_category1" value="${bvo.bd_category1 }">
		<input type="hidden" name="bd_category2" value="${bvo.bd_category2 }">
		<input type="hidden" name="title" value="${bvo.title }">
		<input type="hidden" name="content" value="${bvo.content }">
		<input type="hidden" name="file1" value="${bvo.file1 }">
		<input type="submit" value="수정하기" id="update_btn" style="cursor:pointer; height:32px; width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">
	</form>
	<form action="/board/deleteBoard" method="post">
		<input type="hidden" name="bd_category2" value="${bvo.bd_category2 }">
		<input type="hidden" name="bd_id" value="${bvo.bd_id }">
		<input type="hidden" name="file1" value="${bvo.file1 }">
		<input type="submit" onClick="return delete_Check()" value="삭제하기" style="cursor:pointer; height:32px; width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">
	</form>	
		
		<a href="/board/boardWriteForm?step=${bvo.step + 1}&indent=${bvo.indent + 1}&group_num=${bvo.group_num}&bd_category2=${bvo.bd_category2}&bd_id=${bvo.bd_id}" ><span style="width:100px;text-align:center;line-height:30px;background-color:skyblue;border:rgb(103, 164, 185) solid 1px;float:right;color:#fff;margin-left:2px;font-size:13px;margin-top:60px;">답글달기</span></a>
		
	</c:if>

<div style="clear:left;"></div>







</div>  <!--main-->

</div>  <!--wrap -->

<jsp:include page="footer.jsp"></jsp:include>
<script>


var v_comments = new Vue({
	el:'#comments',
	data:{
		list : "",
		user_id : '${bvo.user_id}',
		bd_category2 : '${bvo.bd_category2}'
	},
	
	created(){
		this.getCommentList();
	},
	
	methods:{
		getCommentList(){
			var bd_category2 = document.getElementById("bd_category2").textContent;
			var bd_id = document.getElementById("bd_id").textContent;

		    var comments;
			if(bd_category2 === 'contact'){
				$.ajax({
					type:'post',
					url:'/reply/getReplyList',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					async : false,
					datatype:'text',
					data:{
						bd_id : bd_id
					},
					success: function(data){
						comments = JSON.parse(data); 
		                
		                var writer;
		                var commentControll;
						if(data){		
							for(var i=0; i<comments.length; i++){
								comments[i].status = true;
							}
							console.log("리스트부르기 성공");
						}
					},
					error: function(data){
						console.log('리스트 에러');
					}
				})			
			}
			this.list = comments;
			this.length = comments.length;
		},
		
		commentReg(bd_id, id){
			const admin = ${admin};
			const bd_category2 = '${bvo.bd_category2}';
			const comment1 = document.getElementById("input_comment").value;
			if(comment1 == ""){
				alert("내용을 입력해 주세요.");
				return false;
			}
			var count;
			console.log(comment1);
			
			$.ajax({
				type:'post',
				url:'/reply/insertReply',
				datatype:'text',
				async : false,
				data:{
					  bd_id : bd_id,
					  user_id : id,		  
					  comment1 : comment1,
					  bd_category2 : bd_category2,
					  admin : admin
					},
					success: function(data){
					
					if(data == 1){					
						v_comments.getCommentList();				
						count = v_comments.length;
						document.getElementById("input_comment").value = "";
									
						var id = "comment"+(count-2);	
						alert("댓글 작성 완료");
						if(count > 1){
							document.getElementById(id).scrollIntoView({behavior: "smooth", block: "center", inline: "center"});
						}				
					}else{
						alert(data);
					}
				},
				error: function(data, textStatus){
					console.log('error');
				}
			});
			
		},
		
		updateComment(row, re_num, bd_id){

			v_comments.list[row].status = false;
			
			document.getElementById("update_comment"+row).focus();
			document.getElementById("update_comment"+row).setSelectionRange(-1,-1);
		
		},
		
		
		updateCancle(row){
			v_comments.list[row].status = true;
		},
		
		updateReg(row,re_num,bd_id){
			
			let box = document.getElementById("update_comment"+row);
			let comment = box.value;
			
			let tr = box.parentNode.parentNode;
			
			
			$.ajax({
				type:'post',
				url:'/reply/updateReply',
				datatype:'text',
				async : false,
				data:{re_num : re_num,
					  comment1 : comment,
					  bd_id : bd_id},
				success: function(data){
					if(data == 1){
						v_comments.getCommentList()
						alert("댓글 수정 완료.");
						
					}else{
						alert("등록 실패.");
					}
				},
				error: function(data, textStatus){
					console.log('error');
				}
			});
		
			
		},
		
		deleteComment(row,re_num,bd_id){
			if(confirm("정말 삭제 하시겠습니까?")){
				let box = document.getElementById("comment"+row);
				
				let tr = box.parentNode
				
				
				$.ajax({
					type:'post',
					url:'/reply/deleteReply',
					datatype:'text',
					data:{re_num : re_num,
						  bd_id : bd_id},
					success: function(data){
						console.log(data);
						if(data == 1){
							v_comments.getCommentList();
							alert("댓글 삭제 완료.");
						}else{
							alert("삭제 실패.");
						}
					},
					error: function(data, textStatus){
						console.log('error');
					}
				});
			}else{
				return;
			}
		},
		
		delete_Check(){
			return confirm("정말 삭제 하시겠습니까?");
		},
		
		check(){
			
			console.log(this.test);
			console.log(v_comments.test);
		}
		
		
	}
	
})



/*
function getCommentList(){
	var bd_category2 = document.getElementById("bd_category2").textContent;
	var bd_id = document.getElementById("bd_id").textContent;
	var id = document.getElementById("id").textContent;
	var reply = document.getElementById("reply").textContent;
    var admin = document.getElementById("admin").textContent;
	console.log(bd_category2);
	console.log(reply);
	console.log(bd_id);
	console.log(id);
	console.log(admin);
	if(bd_category2 === 'contact'){
		$.ajax({
			type:'post',
			url:'/reply/getReplyList',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			datatype:'text',
			data:{
				bd_id : bd_id
			},
			success: function(data){
				var comments = JSON.parse(data); 
                var comment = "";
                var writer;
                var commentControll;
				if(data){		
					console.log("리스트부르기 성공");
					v_comments.list = comments;
					v_comments.length = comments.length;
					
				}
			},
			error: function(data){
				console.log('리스트 에러');
			}
		})			
	}
}



$(function(){
	getCommentList();
})


*/


var comment_origin = new Array;
var btn_origin = new Array;
var row1;





	
</script>

</body>
	</c:otherwise>
</c:choose>
</html>
