<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %> 
<%
	Member m = (Member)request.getAttribute("m");
%>    
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
		}
        
        
        
    </style>
</head>
<body>
		<%@ include file="../adminCommon/adminMainPage.jsp" %>



    <div id="adproductEnroll">
       <div id="outer">
        <h1>&nbsp;&nbsp;&nbsp;회원정보</h1>
       <form id="collectForm" action="<%=contextPath%>/updateMember.ad" method="post">      
        <table id="adcate">
            <tr>
                <td width="200" >아이디</td>
                <td><input type="text" value="<%=m.getMemberId() %>" name="memberId"  readonly></td>
            </tr>
            <tr>
                <td width="200">이름</td>
                <td><input type="text" value="<%=m.getMemberName() %>" name="memberName" readonly></td>
            </tr>
            <tr>
                <td width="200">이메일</td>
                <td><input type="text" value="<%=m.getEmail() %>" name="email" readonly></td>
            </tr>
            <tr>
                <td width="200">전화번호</td>
                <td><input type="text" value="<%=m.getPhone() %>"name="phone" ></td>
            </tr>
            <tr>
                <td width="200">가입일</td>
                <td><input type="text" value="<%=m.getEnrollDate() %>" name="enrollDate" readonly></td>
            </tr>
            <tr>
                <td width="200">수정일</td>
                <td><input type="text" value="<%=m.getModifyDate() %>" name="modifyDate" readonly></td>
            </tr>          
        </table>
       		 <div id="enrollsubmit">
        		<button type="submit" onclick="return updateMember();">수정하기</button>&nbsp;&nbsp;
        		<button type="button" onclick="deleteMember();">삭제하기</button>&nbsp;&nbsp;
        		<button type="button" onclick="location.href='<%=contextPath%>/memberList.ad?currentPage=1';">목록으로</button>
        		<!-- 버튼타입 버튼으로 해줘야 int값 충돌 X -->
        	</div>        
        
       </form>
       </div>
    </div>

    <script>
    	function deleteMember(){   		
    		var bool = confirm("정말 탈퇴시키겠습니까?");
    		if(bool){
    			location.href = "<%=contextPath%>/deleteMember.ad?mid=<%=m.getMemberId()%>";
    			alert("탈퇴되었습니다.");
    		}else{
    			alert("취소하였습니다.");
    		}   			
    	} 
    	function updateMember(){
    			alert("수정되었습니다.");
    		}

  	
    </script>
</body>
</html>
