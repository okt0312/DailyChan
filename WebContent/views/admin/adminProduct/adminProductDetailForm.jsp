<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
    /*content*/
    	body{margin:0px;padding:0px; left:0; top:0; box-sizing:border-box;}
        #adproductEnroll{
            width:100%;height:100%; background-color: white;
            position: fixed; left: 15%; top:5%;
            
        }
        #adcate{
            margin-left:80px;
            margin-top:50px;
            line-height: 40px;
            font-weight: bolder;
            height:280px;
            
        }
        #outer{
			margin:15px;
         	padding:15px;
         	width:700px;
         	height:90%;
         	background:rgba(255,240,240,0.6);
         	opacity:0.7;  
         	border-radius:50px; 
         	margin-left:50px;  
             box-shadow:inset 1px 2px 5px 5px #aeb2b7;
             
        }
        #enrollsubmit{
        	text-align:center;
            margin-top:50px;
            
        }
       
        
        #dailyList{height:20px;}
        Button {
			box-shadow:inset 0px 1px 0px 0px #181c20;
			background:linear-gradient(#181c20);
			background-color:#181c20;
			border-radius:6px;
			border:1px solid #181c20;
			display:inline-block;
			cursor:pointer;
			color:#ffffff;
			font-family:Arial;
			font-size:13px;
			font-weight:bold;
			padding:6px 11px;
			text-decoration:none;
			text-shadow:0px 1px 0px #181c20;
		}
		Button:hover {
			background:linear-gradient(to bottom, #1d1d1d 5%, #e9e7e5 100%);
			background-color:#5554547e;
		}
		Button:active {
			position:relative;
			top:1px;
		}
    </style>
</head>
<body>
		<%@ include file="../adminCommon/adminMainPage.jsp" %>

    <div id="adproductEnroll">
       <div id="outer">
        <h1>&nbsp;&nbsp;&nbsp;상품정보</h1>
        <table id="adcate">
            <tr>
            <form id="PdinsertForm" action="<%= contextPath %>/pdinsert.ad" method="post" enctype="multipart/form-data">
            
                <td width="200" >* 카테고리</td>
                <td>
			        <input type="text" value="" readonly>
        		</td>
            </tr>
            <tr>
                <td width="200">* 상품명</td>
                <td><input type="text" required name="pdTitle"></td>
            </tr>
            <tr>
                <td width="200">상품코드</td>
                <td><input type="text"  name="pdCode"></td>
            </tr>
            <tr>
                <td width="200">납품업체명</td>
                <td><select name="pdEnterPrise" style="width:174px">
						<option value="1234567890">집반찬연구소</option>
						<option value="1111111111">동원홈푸드</option>                
                	</select>
                </td>
            </tr>
            <tr>
                <td width="200">기본이미지</td>
                <td><input type="file" style="cursor:pointer;" name="pdUpfile1"></td>
            </tr>
            <tr>
                <td width="200">세부 이미지 01</td>
                <td><input type="file" style="cursor:pointer;" name="pdUpfile2"></td>
            </tr>

            <tr>
                <td width="200">* 판매가</td>
                <td><input type="text" required name="pdPrice"></td>
            </tr>
            <tr>
                <td width="200">* 수량</td>
                <td><input type="text" required name="pdStock"></td>
            </tr>
            <tr>
                <td width="200">상품 정보 이미지</td>
                <td><input type="file" style="cursor:pointer;" name="pdUpfile3"></td>
            </tr>
       		 </table>
       		 <div id="enrollsubmit">
        		<button type="submit">수정하기</button>&nbsp;&nbsp;
        		<button onclick="deleteMember();"></button>&nbsp;&nbsp;
        		<button onclick="location.href='<%= contextPath%>/productList.ad?currentPage=1'">목록으로</button>
        	</div> 
        	</form>       
       </div>
    </div>
    <script>
    function deleteMember(){   		
    		
    		var bool = confirm("정말 탈퇴시키겠습니까?");
    		if(bool){
    		$("#postForm").submit();    			
    		}else{
    			alert("취소하였습니다.");
    		}
    		
    	}
    </script>
</body>
</html>