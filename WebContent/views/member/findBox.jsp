<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

 	.content{
 	position: relative;
    width: 1000px;
    min-width: 1000px;
    margin: auto;
    padding: 0;

}

.wrap_box{
    min-height: 480px;
    padding: 120px 0;
    background: #f5f5f5;
    text-align: center;
    margin: 0;
}

table{
/*      border: 1px solid red;  */
    margin-left: 35px;    
}


.login_box_id_find, .login_box_pw_find{
    
    border: 1px solid rgba(128, 128, 128, 0.306);
    width: 452px;
    height: 519px;
    background:white;
}
.login_box_id_find{
   margin-left:0px;
}
.login_box_pw_find{
    margin-left: 10px;
}

#login_set_id, #login_set_pw{
    
    width: 350px;
    height: 270px;    
    margin-left: 50px;    
}

#id_name, #pw_id{
    width: 360px;
    height: 44px;
    margin-left:0px;
    margin-top: 40px;
}
#pw_name, #id_email{
    
    width: 360px;
    height: 44px;
    margin-left:0px;
    margin-top: 20px;
    
}
#btn_find_id, #btn_find_pw{
    margin-top: 40px;
    width: 360px;
    height: 44px;
    margin-left: 0px;
    background-color: hsl(28, 100%, 50%);
    color:white;

}
#caution1, #caution2{
    color: hsl(28, 100%, 50%);
    font-size: 11px;
    text-align: center;
}
.find_info{

    border: 1px gray;
    width: 380px;
    margin-top: 10px;
    margin-left: -20px;
    font-size: 12px;
	
}   

</style>

</head>
<body>
<%@ include file="../common/mainHeader.jsp" %>
<%@ include file="../common/mainSideBar.jsp" %>

	<div class="content">
		<div class="wrap_box">
			<table class="find_box">
				<tr>
					<td>
						<div class="login_box_id_find">
							<h2 align="center">아이디 찾기</h2>

							<!-- 아이디찾기 폼 -->
							<div class="login_set" id="login_set_id">

								<form name="findIdForm" id="findIdForm" method="post">
									<input type="hidden" name="login_id" value=""> 
									 <!-- <label for="id_name" class="ir">이름</label> -->
									<input type="text" id="id_name" name="id_name" class="login_input" maxlength="10" placeholder="개인: 이름, 사업자: 대표자명입력"><br> 
									<!-- <label for="id_email" class="ir">이메일</label>  -->
									<input type="text" id="id_email" name="id_email" class="login_input" maxlength="50" placeholder="이메일">


									<!-- 입력정보 오류시 노출 -->
									<br>
									<span class="caution ir" id="caution1">입력하신 정보에 해당하는
										회원정보를 찾을 수 없습니다.</span>
									<button class="btn_login" type="button" id="btn_find_id">
										<em>아이디 찾기</em>
									</button>
								</form>

								<div class="find_info">
									<ul class="list">
										<li>회원가입시 등록한 이름, 이메일 정보를 입력해 주세요.</li>
									</ul>
								</div>
							</div>

							<!-- 아이디찾기 결과 -->
							<div class="login_set ir" id="login_set_id_result">
								<div class="id_result">
									<span>회원님의 아이디를 찾았습니다.</span> <em id="id_result"></em>
								</div>

								<!-- 입력정보 오류시 노출 -->
								<button class="btn_login" type="button" id="btn_login"
									onclick="fnGologin();">
									<em>로그인</em>
								</button>
								<div class="find_info">
									<ul class="list">
										<li>비밀번호를 모르신다면 우측 비밀번호 찾기를 이용해주세요</li>
									</ul>
								</div>
							</div>
					</td>


					<td>

						<div class="login_box_pw_find">
							<h2 align="center">비밀번호 찾기</h2>
							<form name="findPwForm" id="findPwForm" method="post">
								<div class="login_type login_set_pw"></div>
								<!-- 비밀번호찾기 폼 -->
								<div class="login_set login_set_pw" id="login_set_pw">

									<!-- <label for="pw_id" class="ir">아이디</label> 	 -->
									<input type="text" name="pw_id" id="pw_id" class="login_input" maxlength="20" placeholder="아이디"><br> 
									<input type="text" name="pw_id" id="pw_id_text" class="login_input" maxlength="20" placeholder="아이디" style="display: none;">

									<!-- <label for="pw_name" class="ir">이름</label> -->
									<input type="text" name="pw_name" id="pw_name" class="login_input" maxlength="10" placeholder="개인: 이름, 사업자: 대표자명입력">

									<!-- 입력정보 오류시 노출 -->
									<br>
									<span class="caution ir" id="caution2">입력하신 정보에 해당하는 회원정보를 찾을 수 없습니다.</span>
									<button class="btn_login" type="button" id="btn_find_pw">
										<em>비밀번호 찾기</em>
									</button>

									<div class="find_info">
										<ul class="list">
											<li>회원가입시 등록한 아이디, 이름, 이메일 정보를 입력해주세요</li>
										</ul>
									</div>
								</div>
							</form>
							<!--  비밀번호찾기 결과-->
							<div class="login_set ir" id="login_set_pw_result">
								<div class="pw_result">
									<em id="pw_result"></em> <b>비밀번호 재설정용 이메일을 전송했습니다.</b> <span>전송
										받으신 메일을 통해 비밀번호를<br>재설정하신 후 로그인 해주세요
									</span>
								</div>

								<!-- 입력정보 오류시 노출  -->

								<button class="btn_login">
									<em>인증메일 재발송</em>
								</button>
								<div class="find_info">
									<ul class="list">
										<li>인증메일을 받지 못하셨다면 인증메일 재발송을 눌러주세요</li>
									</ul>
								</div>
							</div>

						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	
	function maskingCar(email) {
		if(email_check(email)) {
			var len = email.split('@')[0].length-3; // AB***@gamil.com
			return email.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');
		} else {
			if (email == undefined || email === '') {
				return '';
			}
			var pattern = /.{3}$/; // 정규식
			return email.replace(pattern, "***");
		}
		
	}

	
	function email_check( email ) {
	    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email));

	}
	$(document).ready(function(){
	    $(document).on("keydown", function (event) {    
	  	   if (event.keyCode === 8 && !$(event.target).is("input, textarea")) {
	  	      event.preventDefault();
	  	    }
	   	});
	    
	    
	    $("input[name='login_type']").change(function(e){
	        
	    	if($(this).val() == "sns") {
	    		resetInput();
	    		$("#pw_id").prop("disabled",true);
	    		overpass.member.fnMsgClear($("#caution2"));
	    	
	    	}else{
	    		resetInput();
	    		if($("#id_result").html() != "") {
	    			$("#pw_id").val($("#id_result").html());
	        		$("#pw_id").prop("disabled",true);

	        		$("#login_set_pw_result").hide();
	        		overpass.member.fnMsgClear($("#caution2"));
	        		$("#pw_result").html("");
	    			$(".login_set_pw").show();
	    		}else{
	        		$("#pw_id").prop("disabled",false);

	        		$("#login_set_pw_result").hide();
	        		overpass.member.fnMsgClear($("#caution2"));
	        		$("#pw_result").html("");
	    			$(".login_set_pw").show();
	    		}

			
	    		
	    	}
	    });
		
	
	    $("#id_name").blur(function(){
			if($(this).val() == "") {
				overpass.member.fnMsgShow($("#caution1"),"이름(대표자명)을 입력해 주세요.");
				return;
			}
			overpass.member.fnMsgClear($("#caution1"));
		});
		
		$("#id_email").blur(function(){
			if($(this).val() == "") {
				overpass.member.fnMsgShow($("#caution1"),"이메일을 입력해 주세요.");
				return;
			} 
			overpass.member.fnMsgClear($("#caution1"));

		});
		
		$("#pw_id").blur(function(){
			if($(this).val() == "") {
				overpass.member.fnMsgShow($("#caution2"),"아이디를 입력해 주세요.");
				return;
			}
			overpass.member.fnMsgClear($("#caution2"));
		});
		
		$("#pw_name").blur(function(){
			if($(this).val() == "") {
				overpass.member.fnMsgShow($("#caution2"),"이름(대표자명)을 입력해 주세요.");
				return;
			}
			overpass.member.fnMsgClear($("#caution2"));
		});
		
		/* 이메일 삭제 */
		$("#pw_email").blur(function(){
			if($(this).val() == "") {
				overpass.member.fnMsgShow($("#caution2"),"이메일을 입력해 주세요.");
				return;
			}
			overpass.member.fnMsgClear($("#caution2"));
		});
	
			//엔터키 이벤트
    $("#id_name,#id_email").keypress(function(event){    	
    	if ( event.which == 13 ) {     
    		 $("#btn_find_id").click();   
        }
    });
    
    $("#pw_id,#pw_name").keypress(function(event){    	
    	if ( event.which == 13 ) {     
    		 $("#btn_find_pw").click();   
        }
    });
	
	
		</script>

	<%@ include file="../common/mainFooter.jsp" %>
</body>
</html>