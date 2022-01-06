//카카오톡 주소 api
  function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
      
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = "("+data.zonecode+") " + addr;             
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
                
                
            }
        }).open();
    }

//아이디,이메일 중복확인검증 (최종적으로 ture 이여야만 가입가능 , 값이바뀌면 다시 false)
let idConf = true;
let emailConf = true;


//휴대폰 자릿수 맞으면 인증번호버튼 활성화
function phoneChk(){
    const phone = $("input[name=user_phone]").val();
    if(phone!="" && phone.length >= 10){
        $(".btn_call").css("border","1px solid #005DDE").css("color","#005DDE");
    }else{
        $(".btn_call").css("border","1px solid #ddd").css("color","#ddd");
    }
}
//인증번호
function singup(){
    const phone = $("input[name=user_phone]").val();
    if(phone!="" && phone.length >= 10){
        alert("인증번호를 발송했습니다.");                  
        $("#numChkTab").show(); //인증확인탭 보이기
    }         
}
//인증번호확인
function numChk(){
    const singupNum = $("input[name=singupNum]").val();
    if(singupNum=="" || singupNum.length!=6){alert("인증번호를 확인해주세요");return;}
    alert("확인되었습니다.");
}

//전체동의
function allChk(obj){
    const allObj="input[name=chk1],input[name=chk2],input[name=chk3]";

    if ($(obj).is(":checked") == true) { //전체동의체크
        $(allObj).prop("checked" , true);
    }else{ //전체동의체크해제
        $(allObj).prop("checked" , false);
    }
}


$(function(){
    //처음 로딩시 인증확인탭 숨김
    $("#numChkTab").hide();
    //전체동의 체크시
    $("input[name=chk_all]").click(function(){
        allChk(this);
    });

    $("input[name=id]").change(function(){ 
        idConf=false;
    });

    //숫자만 입력가능
    $("input[name=user_phone],input[name=singupNum]").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
        phoneChk();
    });

	$('#msg_id').hide();
	$('#msg_pw2').hide();
	$('#msg_name').hide();
	$('#msg_email').hide();

});


// 비밀번호 일치 검사
var msg_pw2 = $('#msg_pw2');
$('input[name=password]').focusout(function(){

	if( $("input[name=user_pw]").val()!=$("input[name=password2]").val() ){
		msg_pw2.show();
	}else{
		msg_pw2.hide();
	}
});
$('input[name=password2]').focusout(function(){

	if( $("input[name=user_pw]").val()!=$("input[name=password2]").val() ){
		msg_pw2.show();
	}else{
		msg_pw2.hide();
	}
});

// 이름 검사
const regName = /^[가-힣]{2,6}$/;
$('input[name=name]').focusout(function(){
	const name = $('#msg_name');
	
	if(!regName.test($("input[name=name]").val())){
		name.text("이름은 한글 2자 이상 6자 이하만 가능합니다."); 
		name.show();
	}else{
		name.hide();
	}
	
});
	
// 이메일 중복검사
$('input[name=user_email]').focusout(function(){
	const email = $(this).val();	
	const msg = $('#msg_email');
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
    if (email==""){
		msg.text("이메일을 입력해 주세요.");
		emailConf=false; 
		return;
	}
	if (email.match(regExp) != null){ 
	}else{
		msg.text("이메일 형식이 올바르지 않습니다.");
		msg.show();
		emailConf=false;
		return;
	}

	$.ajax({
		type:'post',
		url:'/member/emailCheck',
		datatype:'text',
		beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
		},
		data:{email:email,
			  user_id:user_id},
		success: function(data){
			if(data ==='useable'){
				msg.hide();			
				emailConf=true;
			}else{
				msg.show();
				msg.text(`${email}는 이미 사용중인 이메일 입니다.`);
				emailConf=false;
			}
		},
		error: function(data, textStatus){
			console.log('error');
		}
	});
});

//가입 전 양식체크
function frm_check(){
    const regName = /^[가-힣]{2,6}$/;
	
    if(!idConf){alert("아이디를 확인해 주세요");return false;}
	if( $("input[name=password]").val()=="" || $("input[name=password2]").val()=="") {alert("비밀번호를 입력해주세요.");return false;}
    if( $("input[name=user_pw]").val()!=$("input[name=password2]").val() ){alert("비밀번호가 서로 다릅니다.");return false;}
    if ($("input[name=name]").val()==""){alert("이름을 입력해 주세요."); return false;} 
    if(!regName.test($("input[name=name]").val())){alert("이름은 한글 2자 이상 6자 이하만 가능합니다."); return false;}
    if(!emailConf){alert("이메일 중복확인을 해주세요");return false;}       
    if ($("input[name=user_phone]").val()=="" || $("input[name=user_phone]").val().length <= 10 ){alert("휴대폰 번호를 입력해 주세요."); return false;}
    if ($("input[name=user_address]").val()=="" || $("input[name=user_address]").val()=="" ){alert("주소를 선택해 주세요."); return false;}
    if ($("input[name=user_address2]").val()=="" || $("input[name=user_address2]").val()=="" ){alert("상세주소를 입력해 주세요."); return false;}
    if($("input[name=chk1]").is(":checked") == false || $("input[name=chk2]").is(":checked") == false){alert("필수 이용약관동의에 체크해 주세요.");return false;}
    
    alert("회원정보 수정이 완료되었습니다.");
    document.fmData.submit();
}