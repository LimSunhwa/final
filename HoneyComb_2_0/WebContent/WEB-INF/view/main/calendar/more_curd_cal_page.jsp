<%@page import="org.apache.jasper.tagplugins.jstl.core.Param" pageEncoding="utf-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${param.title }</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">



<script type="text/javascript">
function deleteCal() {
	<%
	String number = request.getParameter("num");
	request.setAttribute("calnum", number); 
	%>
	var cc = true;
	var url = "del_cal.cal?number="+<%=request.getParameter("num")%>;
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=550,height=400");

	

	
	
}
function delCal(num) {

	var out = confirm("삭제하시겠습니까?");

	if (out) {
		location.href = "/HoneyComb_2_0/cal/del_cal.do?num="+num;
	} else {
		return false;
	}
	
}




</script>

<style type="text/css">
#form_title{
display: inline;
width:420px;
position: absolute;
top:20px;
left:30px;
}
#form_title p{
display: inline;
width: auto;
}
#form_title input{
display: inline;
width: 250px;
}


#form_date{
display: inline;
width:420px;
position: absolute;
top:80px;
left:30px;
}

#form_date p{
display: inline;

}
 
#form_date input{
display: inline;
width: 155px;
}
 
#form_contents{

display: inline;
width:420px;
position: absolute;
top:140px;
left:30px;

} 
 
#form_contents textarea{
position: relative;

display: inline;
width: 355px;
}
#form_contents p{
position:relative;
top:-60px;
display: inline;

} 

#form_button{
position: absolute;
top: 225px;
left:308px;

}

 
</style>




</head>
<body style="background: #e9ebee">
	<form method="post" action="modify" >
	
	
<div id = "form_title">		<p>제목 :</p> <input type="text"  name="subject" placeholder="SUBJECT" value="${cal_subject }" class="form-control"/>
	</div>		 
 <div id = "form_date">	<p>	시작 :</p> <input type="date"	 name="start" placeholder="일" value="${cal_start}" class="form-control"/> 
	<p>	종료 : </p> <input type="date"	 name="end" placeholder="일" value="${cal_end}" class="form-control"/>
			 </div>
			 
			 
<div id = "form_contents">		<p>내용 :</p> <textarea rows="3"  cols="30" name="contents" placeholder="CONTENTS"  class="form-control">${cal_contents}</textarea>
			 </div>
			 
		
<div id= 'form_button'>
			 
			 <input type="submit" class="btn btn-primary btn-xs" id="modify" value="수정"/>
			 <input type="button" class="btn btn-primary btn-xs" id ="del" value = "삭제"  onclick="delCal('${cal_num}');return false;"/>
			 
			 
			 <input type="button" class="btn btn-primary btn-xs" value="닫기" onclick="window.close()">
	</div>		 
			 
			  <input type="hidden"  name = "num" value="${cal_num}">
			 
</form>








</body>
</html>