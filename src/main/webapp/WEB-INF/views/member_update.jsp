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
        <link rel="stylesheet" type="text/css" href="/resources/css/join.css" />
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
        <!--//header-->


<div id="wrap_update">
   <div style="padding-top:65px;">
      <div id="snb">
         <h2>마이페이지</h2>
          <ul>
            <a href="/order/order_list"><li>주문내역</li></a>
            <a href="/review/review_list"><li>리뷰내역</li></a>
            <a href="/qna/qna_list"><li>Q&A내역</li></a>
            <a href="/member/passwordCheckForm"><li id="now">개인정보수정</li></a>
          </ul>
      </div> 
                   
       <div class="contents">
   			<div class="container">
	           	<div class="tb_tit">
		        	회원정보수정
		        </div>
                <form name="fmData" method="post" action="/member/updateMember">  
                	<input type="hidden" name="${_csrf.parameterName}"
    					value="${_csrf.token}" />
                    <table class="tbl_comm">
                        <tbody>
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <input type="text" name="user_id" maxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" class="inputText" value="${mvo.user_id }" readonly="readonly">                              
                                   <br><div id="msg_id">아이디를 입력해주세요.</div> 
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <input type="password" name="user_pw" maxlength="16" placeholder="비밀번호를 입력해주세요" class="inputText">
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호확인</th>
                                <td>
                                    <input type="password" name="password2" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" class="inputText">
                                    <br><div id="msg_pw2">비밀번호가 일치하지 않습니다.</div>
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>
                                    <input type="text" name="name" maxlength="6" placeholder="이름을 입력해주세요" class="inputText" value="${mvo.name }"  readonly>
                                   <br><div id="msg_name">이름은 한글 2자 이상 6자 이하만 가능합니다.</div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <input type="text" name="user_email" maxlength="20" placeholder="예:javacua@javacua.com" class="inputText" value="${mvo.user_email }">
                                  
                                    <br><div id="msg_email"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td>
                                    <input type="text" name="user_phone" maxlength="11" placeholder="숫자만 입력해주세요" class="inputText" value="${mvo.user_phone }">
                                </td>
                            </tr>

                            <tr>
                                <th>주소</th>
                                <td>
                                    <button type="button" class="btn_address" name="user_address" onclick="execDaumPostcode()">주소 검색</button>
									<input type="text" class="inputText" name="user_address" id="address" placeholder="주소" readonly="readonly" style="margin-top:10px" value="${mvo.user_address}">
									<input type="text" class="inputText" name="user_address2" id="detailAddress" style="margin-top:10px" placeholder="상세주소" value="${mvo.user_address2}">
									
                                </td>
                            </tr>

                            <tr>
                                <th>이용약관동의</th>
                                <td>
                                    <div>
                                        <label>
                                            <input type="checkbox" name="chk_all" class="input_chk"> 
                                            <span class="chkText">전체 동의합니다.</span>                                       
                                        </label>
                                        <a class="terms">약관보기></a>
                                    </div>  
                                    <div>
                                        <label>
                                            <input type="checkbox" name="chk1" class="input_chk"> 
                                            <span class="chkText">이용약관 동의 (필수)</span>                                        
                                        </label>
                                        <a class="terms">약관보기></a>
                                    </div>       
                                    <div>
                                        <label>
                                            <input type="checkbox" name="chk2" class="input_chk"> 
                                            <span class="chkText">개인정보 수집 및 이용 동의 (필수)</span>
                                        </label>
                                        <a class="terms">약관보기></a>
                                    </div>      
                                    <div>
                                        <label>
                                            <input type="checkbox" name="chk3" class="input_chk"> 
                                            <span class="chkText">마케팅 수신 동의 (선택)</span>
                                        </label>
                                        <a class="terms">약관보기></a>
                                    </div>    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <div style="text-align: center; margin-top: 30px;">
                    <button type="button" class="btn_join" onclick="frm_check()">수정하기</button>
                </div> 
                </form>  
                <br><br>        
            </div>
       </div>  
       <!--contents-->
   </div>  <!--main-->
</div>  <!--wrap -->


<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
var user_id = '${mvo.user_id}';
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
</script>

<script src="/resources/js/member_update.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		</body>
    	</c:otherwise>
	</c:choose>
</html>