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
		<c:when test="${not empty id }">
			<script>history.go(-1)</script>
		</c:when>
		<c:otherwise>

	
    <body>
        <!---header-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--//header-->

        <div id="wrap">
            <div class="container">
                <h3 class="tit">회원가입</h3>
                <form name="fmData" method="post" action="/member/join">  
                    <table class="tbl_comm">
                        <tbody>
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <input type="text" name="user_id" maxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" class="inputText">                              
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
                                    <input type="text" name="name" maxlength="6" placeholder="이름을 입력해주세요" class="inputText">
                                   <br><div id="msg_name">이름은 한글 2자 이상 6자 이하만 가능합니다.</div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <input type="text" name="user_email" maxlength="20" placeholder="예:javacua@javacua.com" class="inputText">
                                  
                                    <br><div id="msg_email"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td>
                                    <input type="text" name="user_phone" maxlength="11" placeholder="숫자만 입력해주세요" class="inputText">
                                    <button type="button" class="btn_call" onclick="singup()">인증번호</button>
                                </td>
                            </tr>

                            <tr id="numChkTab">
                                <th></th>
                                <td>
                                    <input type="text" name="singupNum" maxlength="6" class="inputText">
                                    <button type="button" class="numChk" onclick="numChk()">인증확인</button>
                                </td>
                            </tr>

                            <tr>
                                <th>주소</th>
                                <td>
                                    <button type="button" class="btn_address" name="user_address" onclick="execDaumPostcode()">주소 검색</button>
									<input type="text" class="inputText" name="address" id="address" placeholder="주소" style="margin-top:10px">
									<input type="text" class="inputText" name="detailAddress" id="detailAddress" style="margin-top:10px" placeholder="상세주소">
									<input type="hidden" class="inputText" name="user_address" id="totalAddress">
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
                    <button type="button" class="btn_join" onclick="frm_check()">가입하기</button>
                </div> 
                </form>
             
            </div>
        </div>

        <!--footer-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--//footer-->
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
       		<script src="/resources/js/join.js"></script>
        	<script src="/resources/js/header.js"></script>
		<script>

		</script>

     	<script src="/resources/js/join.js"></script> 
     	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
    		</c:otherwise>
	</c:choose>
</html>