<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현황 확인 폼(가입인원 체크)</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script type='text/javascript'
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<style type="text/css">
#home_banner {
	position: absolute;
	width: 100%;
	height: 11%;
	background: #344d91;
	margin: 0;
}

#logo_wrapper {
	width: 700px;
	position: absolute;
	left: 250px;
	z-index: 3;
}

#logo_banner {
	display: inline;
	float: left;
	margin: auto;
	width: 100px;
	height: 100px;
}

#Honey_comB {
	position: absolute;
	display: inline;
	font-size: 38pt;
	color: #fff;
	height: 100px;
}

#logo_a {
	text-decoration: none;
}

input[type=text] {
	height: 30px;
	border-radius: 5px 5px 5px 5px;
	font-size: 16px;
	padding-left: 10px;
	text-align: lift;
}

#member_check {
	position: relative;
	top: 30px;
	width: -50px;
	margin: auto;
}

td {
	text-align: center;
}

form {
	margin: auto;
}

.title {
	background: #344d91;
	color: white;
}

#title {
	table-layout: fixed;
	position: relative;
	margin: 0 auto;
}

#title>tbody {
	overflow-y: auto;
	overflow-x: hidden;
	max-height: 150px;
}

#title th {
	background: #344d91;
	color: white;
	font-size: 16px;
	letter-spacing: 1.5px;
	font-weight: bold;
	padding: 10px;
	text-align: center;
	color: white;
}

#text:nth-child(odd) {
	background-color: #e9ebee;
	color: black;
}

#text:hover {
	background-color: #A4A4A4;
	color: black;
}

#title_option tr {
	height: 31px;
}

td {
	vertical-align: middle;
}

#contain_memcheck {
	width: 70%;
	height: 89%;
	background: white;
	position: absolute;
	top: 11%;
	left: 250px;
}

body {
	background: #e9ebee;
}

tr {
	height: 40px;
}

td {
	height: 35px;
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

#memCheck_table {
	text-align: center;
	margin: auto;
}

input[type=text] {
	height: 30px;
	border-radius: 5px 5px 5px 5px;
	font-size: 16px;
	padding-left: 10px;
	text-align: lift;
}

#back_button_div {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

#button_center {
	margin: 0 auto;
	width: 100px;
}

.button {
	width: 100px;
	text-align: center;
	background-color: #4367b0;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	display: block;
	cursor: pointer;
	color: #fff;
	font-size: 15px;
	padding: 5px 10px;
	text-decoration: none;
	margin: 0 auto;
	margin-top: 10px;
	margin-right: 60px;
}

.button:hover {
	background-color: #344d91;
	color: white;
}

.button:active {
	position: relative;
	top: 1px;
}
</style>



<script type='text/javascript'>
	function filter(){
		
		
		if($('#com_name_search').val()==""){
			$("#memCheck_table tr").css('display','');			
			$("#visible_tr").css('display','');
		}
		else{
			
			$("#memCheck_table tr").css('display','none');
			$("#memCheck_table tr[name*='"+$('#com_name_search').val()+"']").css('display','');
			$("#visible_tr").css('display','');		
		}
		return false;
	}
</script>


<script>

function in_focus(){
	document.join_company.com_name_search.focus();
}

	
	function memberList(com_num) {

		url = "admin_comSearch?com_num=" + com_num;
		window.open(url, "post", "toolbar=no,width=1000,height=400,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
</script>
</head>
<body onload="in_focus()">


	<div id="home_banner">
		<div id="logo_wrapper">
			<img id="logo_banner" src="/HoneyComb_2_0/resources/img/logo.png"
				onclick="location.href='/HoneyComb_2_0/admin/admin_mainPage'">
			<a id="logo_a" href="/HoneyComb_2_0/admin/admin_mainPage"><p
					id="Honey_comB">HONEYCOMB</p></a>
		</div>
	</div>




	<div id='contain_memcheck'>
		<div id='h1_tag'>
			<br> Present Condition
			<hr>
		</div>
		<br> <br>
		<div id="member_check">
			<form name="join_company" align="center" method="post"
				action="/HoneyComb/memCheck/memCheck_ComSearch.mc">
				<input type="text" placeholder="COMPANY" id="com_name_search"
					onkeyup='{filter();return false}'
					onkeypress='javascript:if(event.keyCode==13){ filter(); return false;}'>
				<p>
					<br> <br>
					<c:if test="${ empty adminlist  }">
					<br> <br>
						<tr colspan="5">
							<center><p style="width: 680px; font-size: 20px;">등록된 회사가 없습니다</p></center>
						</tr>
					</c:if>
				<table border='1px' id="memCheck_table">
					<c:if test="${ !empty adminlist  }">
						<tr id='visible_tr'>
							<td style="width: 150px;" class="title" align="center">Company</td>
							<td style="width: 650px;" class="title" align="center">Address</td>
							<td style="width: 80px;" class="title" align="center">Affiliation</td>
							<td style="width: 120px;" class="title" align="center">PhoneNumber</td>
							<td style="width: 100px;" class="title" align="center">Detail</td>
						</tr>
						<c:forEach var="adminlist" items="${ adminlist }">
							<tr id="text" name="${ adminlist.com_name }">
								<td align="center">${ adminlist.com_name }</td>
								<td align="center">${ adminlist.com_add }</td>
								<td align="center">${ adminlist.com_aff }</td>
								<td align="center">${ adminlist.com_phone }</td>
								<td><input type="button" class="btn btn-primary btn-xs"
									value="memberList" onclick="memberList(${ adminlist.com_num })"></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<br> <br> <br> <br>
				<div id="back_button_div">
					<div id="button_center">
						<a href="/HoneyComb_2_0/admin/admin_mainPage" class="button">뒤로가기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>