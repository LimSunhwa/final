<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type='text/javascript'
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script>

function view_resume(mem_num, com_dept_num, com_pos_num) {

	if(com_dept_num == 2 || com_pos_num <= 3) {
	/* "final_test/mem_resume.do?mem_num=" + mem_num */
	window.open("/HoneyComb_2_0/dept/mem_resume?mem_num=" + mem_num, "", "toolbar=no,location=no,status=no,menubar=no scrollbars=no,resizable=no,left=600, top=20,width=700,height=920");
	} else {
		alert("조회 권한이 없습니다");
		return false;
	}
}

</script>

<style>
body {
	width: 100%;
}

table, tr, th, td {
	margin: 0 auto;
	border-collapse: collapse;
	border: 1px solid white;
	cellpadding: 0;
	cellspacing: 0;
	font-size: 14px;
	padding: 10px;
}

tr, td {
	border: 1px solid white;
	text-align: center;
}

.title {
	background: #344d91;
	color: white;
}

#text {
	background: #e9ebee;
	color: black;
	cursor: pointer;
}

#text:HOVER {
	background-color: #A4A4A4;
	color: black;
}

#com_pos_name {
	width: 70px;
}

#name {
	width: 100px;
}

#phone_num {
	width: 130px;
}

#email {
	width: 210px;
}

#h2_title {
	font-size: 30px;
	text-align: center;
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

</head>
<body onselectstart="return false" ondragstart="return false">
	<br>
	<br>
	<br>
	<br>
	<h2 id="h2_title">${ com_dept_name }</h2>
	<br>
	<br>
	<br>
	<br>
	<table>
		<tr>
			<td class="title">직 급</td>
			<td class="title">성 명</td>
			<td class="title">전화번호</td>
			<td class="title">이메일</td>
		</tr>

		<c:if test="${ !empty dept_List }">
			<c:forEach var="dept_List" items="${ dept_List }">
				<tbody id="content_tbody">
					<tr id="text" onclick="view_resume(${ dept_List.mem_num }, ${ sessionScope.com_dept_num }, ${ sessionScope.com_pos_num })">
						<td id="com_pos_name">${ dept_List.com_pos_name }</td>
						<td id="name">${ dept_List.name }</td>
						<td id="phone_num">${ dept_List.phone_num }</td>
						<td id="email">${ dept_List.email }</td>
					</tr>
				</tbody>
			</c:forEach>
		</c:if>

		<c:if test="${ empty dept_List }">
			<tr>
				<td colspan="5">데이터 음슴</td>
			</tr>
		</c:if>

	</table>
	<br />
	<br />

	<div id="div_button">
		<div id="div_sub_button">
			<a href="/HoneyComb_2_0/dept/chart" class="button">뒤로가기</a>
		</div>
	</div>

</body>
</html>
