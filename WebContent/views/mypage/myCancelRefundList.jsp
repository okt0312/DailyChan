<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.cancelRefundList{
		box-sizing:border-box;
	}
	.cancelRefundList{
		margin:50px 0px 0px 450px;
		width:800px;
		height:600px;
	}
	
	/* 조회 기간 선택 영역 */
	#cancelPeriodSch {
		width:700px;
		height:35px;
		margin:auto;
		vertical-align:middle;
	}
	#cancelPeriodSch *{
		float:left;
		font-size:12px;
	}
	
	/* 주문/배송 리스트 영역*/
	.myCancelList{
		margin-top:30px;
	}
	.myCancelList, .myCancelList tr{
		border-top:1px solid black;
		border-bottom:1px solid black;
		border-collapse: collapse;
	}
	.myCancelList th{
		font-size:13px;
		background:#f5f5f5;
	}
	.myCancelList td{
		font-size:12px;
		text-align:center;
	}
	#myCancelInfo>img{
		float:left;
		margin:5px 5px 5px 20px;
	}
	#myCancelInfo>div{
		width:200px;
		text-align:left;
		float:left;
		margin:20px 0px 0px 10px;
	}
	#myCancelInfo>div>a{
		font-size:13px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<%@ include file="mypageMainOuter.jsp" %>

	<div class="cancelRefundList">
		<h3>취소/반품 조회</h3>
		<hr>
		
		
		<!-- 취소반품 조회기간 선택 -->
		<div id="cancelPeriodSch">
			<form>
				<dl>
					<dt>조회기간</dt>
					<dd>
						<span class="date">
							<input type="text" class="input_txt input_date" title="기간검색 시작일" id="date_start" name="date_start" value="2020-03-12" readonly="readonly">
							<button type="button" id="cal_start" title="조회기간 선택 달력 레이어 열기" class="">달력에서 선택</button>
						</span>
						<span class="tx">~</span>
						<span class="date">
							<input type="text" class="input_txt input_date" title="기간검색 종료일" id="date_end" name="date_end" value="2020-04-12" readonly="readonly">
							<button type="button" id="cal_end" title="조회기간 선택 달력 레이어 열기">달력에서 선택</button>
						</span>
					</dd>
					<dd>
						<button type="button" class="bt_sch" id="searchBtn">조회</button>
					</dd>
				</dl>
			</form>
		</div>
		
		<!-- 주문배송 조회 리스트 -->
		<table class="myCancelList">
			<tr height="28px">
				<th width="130px">주문번호/주문일</th>
				<th width="450px">상품정보</th>
				<th width="100px">진행상태</th>
				<th width="100px">처리일자</th>
			</tr>
			<tr>
				<td>
					<a href="" style="color:blue; text-decoration: underline;">20200429-1234567</a>
					2020-04-29<br>
				</td>
				<td id="myCancelInfo">
					<img src="" width="70" height="70"></img>
					<div>
						<a href=""><b>데일리찬 상품명</b></a><br>
						1개 / 12,000원
						결제수단 : 신용카드
					</div>
				</td>
				<td>취소완료</td>
				<td>2020-05-01</td>
			</tr>
		</table>
		
		<table class="myCancelList">
			<tr height="28px">
				<th width="130px">주문번호/주문일</th>
				<th width="450px">상품정보</th>
				<th width="100px">진행상태</th>
				<th width="100px">처리일자</th>
			</tr>
			<tr>
				<td>
					<a href="" style="color:blue; text-decoration: underline;">20200410-1234567</a>
					2020-04-10<br>
				</td>
				<td id="myCancelInfo">
					<img src="" width="70" height="70"></img>
					<div>
						<a href=""><b>데일리찬 상품명</b></a><br>
						1개 / 12,000원
						결제수단 : 신용카드
					</div>
				</td>
				<td>취소완료</td>
				<td>2020-04-12</td>
			</tr>
		</table>
		
		<table class="myCancelList">
			<tr height="28px">
				<th width="130px">주문번호/주문일</th>
				<th width="450px">상품정보</th>
				<th width="100px">진행상태</th>
				<th width="100px">처리일자</th>
			</tr>
			<tr>
				<td>
					<a href="" style="color:blue; text-decoration: underline;">20200331-1234567</a>
					2020-03-31<br>
				</td>
				<td id="myCancelInfo">
					<img src="" width="70" height="70"></img>
					<div>
						<a href=""><b>데일리찬 상품명</b></a><br>
						1개 / 12,000원
						결제수단 : 신용카드
					</div>
				</td>
				<td>취소완료</td>
				<td>2020-04-01</td>
			</tr>
		</table>
		
		
		
		
		<!-- 페이징바 -->
		
		
	</div>

		

</body>
</html>