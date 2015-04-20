<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Offered Course - Autocomplete</title>
<link rel="stylesheet" href="CSS/jquery-ui.css">
<style>
	label{width:100px;display:inline-block}
	input{width:250px}
</style>
<script src="js/jquery-1.11.1.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script>
counter = 0;
offSearch = {
		course : {},
		teacher : {},
		section : []
	};
offeredCourse = [];

$(document).ready(function(){
	$("#course").autocomplete({
		source: "off-search.jsp?type=course",
		minLength: 1,
		select: function( event, ui ) {
			//console.log(ui.item);
			offSearch.course = ui.item;
		}, 
		close: function( event, ui ) {
		}
	})
	$("#teacher").autocomplete({
		source: "off-search.jsp?type=teacher",
		minLength: 1,
		select: function( event, ui ) {
			//console.log(ui.item);
			offSearch.teacher = ui.item;
		}, 
		close: function( event, ui ) {
		}
	})
	$("#section").autocomplete({
		source: "off-search.jsp?type=section",
		minLength: 1,
		select: function( event, ui ) {
			//console.log(ui.item);
			offSearch.section.push(ui.item);
			$("#secs").append("<li><button onclick='delSec("+ui.item.id+",this)'>X</button>"+ui.item.label+"</li>")
		}, 
		close: function( event, ui ) {
			$("#section")[0].value = "";
		}
	})	
});
delSec = function(idDel,secOb){
	se = secOb;
	for( var item in offSearch.section){
		if(offSearch.section[item].id === idDel){
			offSearch.section.splice(item,1);
			secOb.parentNode.remove();
			return;
		}
	}
	console.err(idDel+" Not Deleted");
}
delItem = function(idDel,courseObj){
	for( var item in offeredCourse){
		if(offeredCourse[item].courseid === idDel){
			courseObj.parentNode.parentNode.remove();
			offeredCourse.splice(item,1);
			return;
		}
	}		
}
addoffr = function(){
	if(offSearch.course.id !=undefined && offSearch.teacher.id && offSearch.section.length > 0){
		var concat = "";
		for (var i = offSearch.section.length - 1; i >= 0; i--) {
			sec = offSearch.section[i];
			concat += "["+sec.id+"]"+sec.label + ", ";
		};
		$("table").append("<tr>"+
				"<td><button onclick='delItem("+offSearch.course.id+",this)'>X</button></td>"+
				"<td>"+offSearch.course.id+"</td>"+
				"<td>"+offSearch.course.label+"</td>"+
				"<td>"+offSearch.teacher.id+"</td>"+
				"<td>"+offSearch.teacher.label+"</td>"+
				"<td>"+concat+"</td>"+
				+"</tr>")
		sec = [];
		for (var i = 0; i < offSearch.section.length; i++) {
			sec.push(offSearch.section[i].id);
		}
		console.log(sec);
		offeredCourse.push({"courseid":offSearch.course.id,"teacherid":offSearch.teacher.id, sectionDetails : sec});
		$(".items").html(++counter);
		
		$("#course")[0].value  = "";
		$("#teacher")[0].value = "";
		$("#section")[0].value = "";
		$("#secs").html("");
		offSearch = {
				course : {},
				teacher : {},
				section : []
			};
	}
}
insertQuery = function(){
	o = JSON.stringify(offeredCourse);
	console.log(o);
	$.ajax({
        type: "POST",
        url:"offered.jsp",
	    data: {"offeredCourses": o}
	})
	.done(function() {
	    console.log("success");
	})
	.fail(function() {
	    console.log("error");
	})
}
</script>
</head>
<body>
	<button onclick="confirm() ? insertQuery() : console.error('canceled')">Publish</button><br/><br/>
	<div>Items: <span class="items"></span></div><br/><hr/>
	<label>Course: </label><input type="text" id="course"><br/>
	<label>Teacher:</label><input type="text" id="teacher"><br/>
	<label>Section:</label><input type="text" id="section"><br/>
	<ul id="secs"></ul><br/>
	<button onclick="addoffr()">Add Offer</button>
	
	<table>
		<tr>
			<td></td>
			<td>cid</td>
			<td>Course</td>
			<td>tid</td>
			<td>Teacher</td>
			<td>Section(s)</td>
		</tr>
	</table>
</body>
</html>