<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mypageOuter{
	    width:1000px;
	    margin:auto;
		box-sizing:border-box;
	    padding-top:70px;
	}
	.mypageOuter a{
	    text-decoration:none;
	}
	
	/*마이페이지 간략정보 영역 스타일*/
	#mypageBrief{
		width:1004px;
		height:180px;
		box-sizing:border-box;
		border-top:1px solid lightgrey;
		border-bottom:1px solid lightgrey;
		margin-bottom:70px;
	}
	#deliverySite{
		width:1000px;
		height:30px;
		float:right;
	}
	#deliverySite~div{
		width:250px;
		height:50px;
		margin-top:40px;
		font-size:18px;
		text-align:center;
		font-weight:bold;
		float:left;
	}
	#deliverySite+div{
		font-size:30px;
	}

	#deliverySite img{
		height:20px;
		margin-top:12px;
		margin-right:5px;
		float:right;
	}
	#deliverySite a{
		width:300px;
		height:30px;
		margin-top:15px;
		font-size:11px;
		text-align:left;
	    float:right;
	}
	#deliverySite~div>a{
		color:tomato;
		font-size:18px;
	}
	
	/* 마이페이지 카테고리 영역 스타일 */
	#mypageCategory{
		width:200px;
		height:620px;
		float:left;
	}
	#mypageCategory>div{
		height:40px;
	}
	#mypageCategory>.myCateFirst{
		margin-top:25px;
		font-size:16px;
		font-weight:bold;
		color:black;
	}
	#mypageCategory>div>a{
		text-align:left;
		font-size:14px;
		font-weight:600;
		color:rgb(102, 102, 102);
		cursor:pointer;
	}
	#mypageCategory>div>a:hover{
		color:rgb(247, 112, 46);
		text-weight:800;
	}
</style>
</head>
<body>

	<%@ include file="../common/mainHeader.jsp" %>
	
	<%
		String memberName = loginUser.getMemberName();
	%>
	
	<div class="mypageOuter">
        <h1 style="text-align:center">마이페이지</h1>
        <br>
		
		<!-- 마이페이지 간략정보 영역 -->
        <div id="mypageBrief" align="center">
           	<div id="deliverySite">
                <a href="<%=contextPath%>/addressForm.my?userId=<%=m.getMemberId()%>">기본 배송지 정보 넣을 곳</a>
                <img src="<%= contextPath %>/resources/img/positionlogo.png">
            </div>
			<div><b><%= memberName %></b>님</div>
			<div id="order_count">주문/배송<br><a href="<%= contextPath %>/orderList.my">0</a> 건</div>
			<div id="coupon_count">쿠폰<br><a href="<%= contextPath%>/couponForm.my?userId=<%=m.getMemberId() %>">0</a>장</div>
			<div>적립금<br><a href="<%= contextPath%>/pointForm.my"><%=m.getPointSum() %></a> 원</div>
                
        </div>
       <br>
       <br>

		<!-- 마이페이지(좌) 카테고리 영역 -->
		<div id="mypageCategory">
			<div class="myCateFirst">주문정보</div>
			<div><a id="selectOrder" href="<%= contextPath %>/orderList.my">주문/배송 조회</a></div>
			<div><a id="selectCancel" href="<%= contextPath%>/cancelOrder.my">취소/반품 조회</a></div>
			<div class="myCateFirst">구매혜택</div>
			<div><a id="selectCoupon" href="<%= contextPath%>/couponForm.my?userId=<%=m.getMemberId() %>">쿠폰 조회</a></div>
			<div><a id="selectPoint" href="<%= contextPath%>/pointForm.my?userId=<%=m.getMemberId() %>">적립금 조회</a></div>
			<div class="myCateFirst">활동내역</div>
			<div><a id="selectRecent" href="<%= contextPath%>/recentView.my">최근 구매한 상품</a></div>
			<div><a id="selectReview" href="<%= contextPath%>/review.my">고객 후기</a></div>
			<div><a id="selectInquiry" href="">나의 문의 내역</a></div>
			<div class="myCateFirst">회원정보</div>
			<div><a id="selectAddress" href="<%=contextPath%>/addressForm.my?userId=<%=m.getMemberId()%>">배송지 관리</a></div>
			<div><a id="selectMyInfo" href="<%=contextPath%>/initPwdConfirm.my?target=updateMember">개인정보수정</a></div>
			<div><a id="selectWithdraw" href="<%=contextPath%>/initPwdConfirm.my?target=deleteMember">회원탈퇴</a></div>
			
		</div>	
    </div>
    <script>
    	var userId = "<%=m.getMemberId()%>";
        	$.ajax({
			url: "<%=contextPath%>/mainAddr.my",
			type: "POST",
			data : {userId : userId},
			success: function(list) 
			{
				var address = "";
				if(list.length > 0)
				{
					for(var i = 0; i < list.length; i++)
					{
						if(list[i].addressDefault == 'Y')
						{
							address += "[" + list[i].zipCode + "]" + " ";
							address += list[i].address + " ";
							address += list[i].addressDetail;
						}
					}
				}
				else
				{
					address = "등록된 주소지가 없습니다."
				}
				$("#deliverySite a").html(address);
			}
		});
        	
        	$.ajax({
    			url: "<%=contextPath%>/couponSum.my",
    			type: "POST",
    			data : {userId : userId},
    			success: function(count) 
    			{
    				$("#coupon_count a").html(count);
    			}
    		});
        	
        	$.ajax({
    			url: "<%=contextPath%>/countOrd.my",
    			type: "POST",
    			data : {userId : userId},
    			success: function(ordCount)
    			{
    				$("#order_count a").html(ordCount);
    			}
    		});
        	
   	</script>
</body>
</html>