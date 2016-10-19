<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<title>사업장 승인폼</title>



<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script type='text/javascript'
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
 

<style>


#complete_com_div{
width: 70%;
height:89%;
background: white;
position: relative;
left: 250px;

}
#home_banner {
	width: 100%;
	height: 11%;
	background: #344d91;
	margin: 0;
	padding: 0;
}

#logo_wrapper {
	position: absolute;
	left: 250px;
	z-index: 3;
}

#logo_banner {
	display: inline;
	margin: auto;
	width: 100px;
	height: 100px;
}

#Honey_comB {
	display: inline;
	font-size: 38pt;
	color: #fff;
	vertical-align: middle;
}

#logo_a {
	text-decoration: none;
}

#back_button {
	
}

#back_button {
	width: 50px;
	margin: auto;
}

#submit {
	width: 50px;
	margin: auto;
}

#delete {
	width: 50px;
	margin: auto;
}

#back_button_div {
	width: 60px;
	margin: auto;
}

#h1_tag {
	width: 500px;
	margin: auto;
	font-size: 40px;
	text-align: center;
}

h1 {
	width: 500px;
	margin: auto;
	text-align: center;
}


html{
width: 100%;
height: 100%;
}
 body{
 
background:#e9ebee;
height: 100%;
 }


</style>
<script>
	function listCheck(com_num) {;		
		url = "admin_comCheck?com_num=" + com_num;
		window
				.open(
						url,
						"post",
						"toolbar=no,width=700,height=300,directories=no,status=yes,scrollbars=yes,menubar=no");
 
	}

	 function del(com_num) {;
		url = "admin_comDelete?com_num=" + com_num;

			  window
					.open(
							url,
							"post",
							"toolbar=no,width=600,height=300,directories=no,status=yes,scrollbars=yes,menubar=no"); 
			  
	} 
	 
	 function submitCheck(com_num){;
	 url = "admin_comInsert?com_num="+com_num;
	 window
		.open(
				url,
				"post",
				"toolbar=no,width=600,height=300,directories=no,status=yes,scrollbars=yes,menubar=no"); 
	 }
	 
</script>
</head>
<body background='e9ebee'>




<div id="home_banner">
		<div id="logo_wrapper">
			<img id="logo_banner" src="/HoneyComb_2_0/resources/img/logo.png"
				width="80" height="80"
				onclick="location.href='/HoneyComb_2_0/admin/admin_mainPage'"> <a
				id="logo_a" href="/HoneyComb_2_0/admin/admin_mainPage"><p id="Honey_comB">HONEYCOMB</p></a>
		</div>
	</div>



<div id = 'complete_com_div'>

	<div id='h1_tag'>
		<br>Company Approval
		<hr>
	</div>
	<br>
	<form align="center">
		<table width="400" border="1" cellpadding="1" cellspacing="0"
			align="center">
			<tbody>
				<c:if test="${ empty admincomplete }">
					<tr>
						<td align="center">신청한 사업장이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${ !empty admincomplete }">
					<c:forEach var="admincomplete" items="${admincomplete}">
						<tr>
							<td><a onclick="listCheck('${admincomplete.com_num}')" id="compl">${admincomplete.com_name}</a></td>
							<td id="compl_button"><input type="submit"
								class="btn btn-primary btn-xs" id="submit" value="등록"
								onclick="submitCheck('${admincomplete.com_num}')"> 
								<input
								type="button" class="btn btn-primary btn-xs" id="delete"
								value="삭제" onclick="del('${admincomplete.com_num}')"></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="back_button_div">

			<input type="button" class="btn btn-primary btn-xs" value="back"
				id='back_button' onclick="javascript:location.href='admin_mainPage'">
		</div>
 
	</form>

</div>
</body>
</html>
