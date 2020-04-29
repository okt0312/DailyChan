<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.mypage.model.vo.Mypage, java.util.ArrayList"%>
<%
	ArrayList<Mypage> myList = (ArrayList<Mypage>)request.getAttribute("myList"); // 10
	ArrayList<Mypage> count = (ArrayList<Mypage>)request.getAttribute("count"); // 6
	
	System.out.println(myList);
	System.out.println(count);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문배송조회</title>
<style>
	/* 주문배송조회 */
	.orderDeliveryList{
		box-sizing:border-box;
		float:left;
		width:800px;
		margin-bottom:200px;
	}
	
	/* 조회 기간 선택 영역 */
	#orderPeriodSch {
		width:800px;
		height:35px;
		margin:auto;
		vertical-align:middle;
	}
	#orderPeriodSch *{
		float:left;
		font-size:12px;
	}
	
	/* 주문/배송 리스트 영역*/
	.myOrderList{
		margin:30px 0px 0px 5px;
	}
	.myOrderList, .myOrderList tr{
		border-top:1px solid grey;
		border-bottom:1px solid grey;
		border-collapse: collapse;
	}
	.myOrderList th{
		font-size:13px;
		background:#f5f5f5;
	}
	.myOrderList td{
		font-size:12px;
		text-align:center;
		border:1px solid lightgrey;
	}
	.myOrderList a{text-decoration:none; cursor:pointer;}
	#myOrderInfo{
		padding:20px 0px 10px 30px;
	}
	#myOrderInfo>div{
		width:270px;
		text-align:left;
		float:left;
		margin-bottom:10px;
	}
	#myOrderInfo>div>a{
		font-size:13px;
		cursor:pointer;
		color:black;
	}
	.orderDtBtn{
		width:63px;
		height:25px;
		background:white;
		border:1px solid black;
		margin-top:2px;
		font-size:10px;
		cursor:pointer;
	}
	.trackShipmentBtn{
		width:60px;
		height:30px;
		background:tomato;
		border:none;
		font-size:10px;
		color:white;
		margin-bottom:5px;
		cursor:pointer;
	}
	.cancelOrderBtn, .requestRefundBtn{
		width:60px;
		height:30px;
		background:white;
		border:1px solid black;
		font-size:10px;
		cursor:pointer;
	}
	#cancelOrdBlockBtn{
		width:60px;
		height:30px;
		background:white;
		border:1px solid black;
		font-size:10px;
		cursor:pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<%@ include file="mypageMainOuter.jsp" %>
	<%@ include file="../common/mainSideBar.jsp" %>
	
	<div class="orderDeliveryList">
		<h3>주문/배송 조회</h3>
		<hr>
		
		<!-- 주문배송 조회기간 선택 -->
		<div id="orderPeriodSch">
			<form>
				<dl>
					<dt>조회기간</dt>
					<dd>
						<input type="date" id="fromDate" name="fromDate" max="sysdate">
						<span>~</span>
						<input type="date" id="toDate" name="toDate">
					</dd>
					<dd>
						<button type="button" class="bt_sch" id="searchBtn">조회</button>
					</dd>
				</dl>
			</form>
		</div>
		
		<!-- 주문배송 조회 리스트 -->
		<table class="myOrderList" width="790px">
			<thead>
				<tr height="35px">
					<th width="180px">주문번호/주문일</th>
					<th width="350px">상품정보</th>
					<th width="130px">진행상태</th>
					<th width="130px">확인</th>
				</tr>
			</thead>
			<tbody>
				<% if(myList.isEmpty()){ %>
					<tr height="300px">
						<td colspan="4">
							<img src="<%= request.getContextPath() %>/resources/img/cautionlogo.png" width="50px" height="50px">
							<br><br>
							<div>장바구니에 담긴 상품이 없습니다.</div>
						</td>
					</tr>
				
				<% } else { %>
			
			
					<% int i = 0; int p = 0;%>
					
					<%for(Mypage c : count){ %>
					
							<% for(int tr=0; tr<c.getCountOrdNo(); tr++){%>
								<tr height="100px">
									<%if(tr == 0){ %>				
										<td class="firstTd" rowspan="<%=c.getCountOrdNo()%>">
											<a style="color:blue; text-decoration: underline;" class="orderNo"><%=myList.get(i).getOrderNo()%></a><br>
											<%=myList.get(i).getOrderDate() %><br>
											<button class="orderDtBtn" type="button">상세확인 ></button>
										</td>
									<%}%>
									
									<td id="myOrderInfo">
										<div>
											<input type="hidden" class="pCosde" value="<%=myList.get(p).getProCode()%>">
											<a class="pName"><b><%=myList.get(p).getProName()%></b></a><br>
											<%=myList.get(p).getQuantity() %>개 / <%=myList.get(p).getPrice()%>원
										</div>
										<% p++; %>
									</td>
									
									<%if(tr == 0){ %>
										<td rowspan="<%=c.getCountOrdNo()%>">
											<% switch(myList.get(i).getStatus()) {
												case 0: out.println("결제완료"); break;
												case 1: out.println("상품준비중"); break;
												case 2: out.println("배송중"); break;
												case 3: out.println("배송완료"); break;
											 } %>
										</td>
										<td rowspan="<%=c.getCountOrdNo()%>">
											<% switch(myList.get(i).getStatus()) {
												case 0: break;
												case 1: break;
												case 2: %> <button type="button" class="trackShipmentBtn">배송조회</button><br><%; break;
												case 3: %> <button type="button" class="trackShipmentBtn">배송조회</button><br><%; break;
											} %>
										</td>
									<%} %>
								</tr>
							<% } %>
						
					<% i++; } %>
				
				<% } %>
			</tbody>
		</table>
		
		<!-- 페이징바 -->
		
		
	</div>

	<script>
		$(function(){
			$("#selectOrder").css("color", "rgb(247, 112, 46)");
			
			$(".orderNo").click(function(){
				var orderNo = $(this).text();
				location.href="<%=contextPath%>/orderDetail.my?orderNo=" + orderNo;
			});
			
			$(".orderDtBtn").click(function(){
				var orderNo = $(this).siblings(".orderNo").text();
				location.href="<%=contextPath%>/orderDetail.my?orderNo=" + orderNo;
			})
			
			$(".pName").click(function(){
				var pCode = $(this).prev().val();
				location.href="<%=contextPath%>/pDetail.pro?pCode=" + pCode;
			})
			
			$(".requestRefundBtn").click(function(){
				var orderNo = $(this).parent().siblings(".firstTd").children(".orderNo").text();
				location.href="<%=contextPath%>/refund.my?orderNo=" + orderNo;
			});
			
			$(".trackShipmentBtn").click(function(){
				window.open("<%=contextPath%>/views/mypage/shipmentView.jsp", "배송조회", "width=300, top = 50, left = 500, location = no");
				<%-- window.open("<%=contextPath%>/loginPop.me", "로그인팝업창", "width=500, height=700, top = 50, left = 500, location = no"); --%>
			});
			
			
			/*Ajax로 값만 서블릿으로 전달하고 이 페이지에 머물도록!!!(refund.my 지우고)*/
			$(".cancelOrderBtn").click(function(){
				var orderNo = $(this).parent().siblings(".firstTd").children(".orderNo").text();
				
				var result = confirm("주문을 즉시취소하시겠습니까?")
	            if(result){
	            	$.ajax({
	            		url:"deleteOrd.my",
	            		data:{orderNo:orderNo},
	            		type:"get",
	            		success:function(){
	            			alert("주문취소 처리가 완료되었습니다.");
	            		}, error:function(){
	            			colsole.log("통신 실패");
	            		}
	            	});	
	            }
			});
			
		});	
		
		function cancelOrdBlock(){
			alert("                즉시취소는 결제완료 단계까지 가능합니다.\r\n              상품준비중 이후의 단계에서는 상품이 조리되어\r\n              취소처리가 불가능하니 이점 양해 부탁드립니다.");
		}
		
	</script>

	<%@ include file="../../views/common/mainFooter.jsp" %>

</body>
</html>