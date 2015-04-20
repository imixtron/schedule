<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>jQuery UI Example Page</title>
<style type="text/css">
body {
	font: 62.5% "Trebuchet MS", sans-serif;
}
.flip { 
    width: 1px;
    -ms-transform: rotate(7deg); /* IE 9 */
    -webkit-transform: rotate(7deg); /* Chrome, Safari, Opera */
    transform: rotate(90deg);
}

</style>
<link href="css/jquery-ui.min.css" rel="stylesheet">
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/jquery-ui.min.js"></script>
<script type="text/javascript">
var insertQuery;
$(function(){
	
	$.ui.autocomplete.prototype._renderItem = function (ul, item) {
	    item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<b>$1</b>");
	    return $("<li></li>")
	            .data("item.autocomplete", item)
	            .append($("<a></a>").html(item.label))
	            .appendTo(ul);
		};
	});
	
function generateAutoComplete(name, sz){
	var id = $("input[name=cnt]").val();
	$('<input>').attr({ id: name+"-id", "name": name+"-id"}).css({width:"30px", border:"none", "text-align": "right"}).appendTo("#dyna");	
	$('<input>').attr({ id: name, "name": name, tabindex: id }).css({width:sz+"px"}).appendTo("#dyna");
	
	if(name == "slot"){
		$('<input>').attr({ id: "occupied", "name": "occupied" }).css({width:"30px"}).appendTo("#dyna");
	}
	
	$("#"+name).autocomplete({
		source: "search.jsp?type="+name,
		minLength: 1,
		select: function( event, ui ) {
			//console.log(ui.item);
			$("#"+name+"-id").val(ui.item.id);
			name=="slot"?$("#occupied").val(ui.item.occupied):"";
		
			tindex = parseInt($(this).attr("tabindex")) + 1;
			$(":input[tabindex='" + tindex + "']").focus();		
		}, 
		close: function( event, ui ) {
			if(name == "slot"){
				newRow();	
			}
		}
	});

	$("input[name=cnt]").val(parseInt(id)+1);
}

function newRow(){
	var tr = $("<tr></tr>").attr("id", "af-row");
	$("<td></td>").attr("id", "_offid").text($("#offcrs-id").val()).appendTo(tr);
	$("<td></td>").attr("id", "af-offcrs").text($("#offcrs").val()).appendTo(tr);
	$("<td></td>").attr("id", "_slotid").html($("#slot-id").val()).appendTo(tr);
	$("<td></td>").attr("id", "af-slot").html($("#slot").val()).appendTo(tr);
	$("<td></td>").attr("id", "_occupied").text($("#occupied").val()).appendTo(tr);
// 	$("<td></td>").attr("id", "txtroom-id").html($("#room-id").val()).appendTo(tr);
// 	$("<td></td>").attr("id", "af-room").html($("#room").val()).appendTo(tr);
	$("#tbl").append(tr);
	
	$("#offcrs-id").val("");
	$("#offcrs").val("");
	$("#slot-id").val("");
	$("#slot").val("");
	$("#room-id").val("");
	$("#room").val("");
	$("#occupied").val("")
	
	$("#offcrs").focus();
}
generateQuery = function(){
	insertQuery = "INSERT INTO `schedule`.`schedule` (`offid`, `slotid`, `occupied`) \n VALUES ";

	var _slotid = document.querySelectorAll("#_slotid");
	var _offid = document.querySelectorAll("#_offid");
	var _occupied = document.querySelectorAll("#_occupied");
	var length = _offid.length;
	
	if (length == 0){
		alert("No Items Found");
		insertQuery = null;
		return;
	}
	var valueCount = 0;
	for (var i = 0; i < length; i++) {
		if( _offid[i].innerHTML != "" && _slotid[i].innerHTML != ""  && _occupied[i].innerHTML != "" ){
			insertQuery += "\n('"+
			_offid[i].innerHTML+"', '"+
			_slotid[i].innerHTML+"', '"+
			_occupied[i].innerHTML+"')";
			insertQuery += (i+1 == length ) ? ";" : ",";
			valueCount++;
		}
		else{console.log("empty")}
	}
	if (valueCount == 0){
		alert("Incomplete Items found, to proceed insert atleast 1 complete item");
		insertQuery = null;
		return;
	}
	document.getElementById("que").value = insertQuery;
	document.getElementById("querty").style.display = "block";	
}
runQuery = function(){
	insertQuery = document.getElementById("que").value;

	$.ajax({
        type: "POST",
        url:"update.jsp",//jsp,servlet,struts action
        data: {"oper":"insert","query":insertQuery}
	}).success(function(responseText){
		alert("success");
		console.log(responseText);
	});
		
}
</script>
</head>
<body>
<div>
<div class="ui-widget">

<table id="tbl" border="1" style="border-collapse: collapse;" bordercolor="#d3d3d3">
</table>

<div id="dyna"></div>
<div class="flip">Monday</div>
	<!-- <label for="birds">Birds: </label> -->
<!-- 	
	<input id="birds-id" size="4">
	<input id="birds" style="width:300px;" >
 -->	
</div>
</div>
<input type="text" name="cnt" value="1" size="1">
<script type="text/javascript">
	generateAutoComplete("offcrs", 450);
	generateAutoComplete("slot", 300);
</script>

<a href="#" onclick="generateQuery()">Generate Query</a>
<div style="display:none;" id="querty">
	<textarea style="width: 700px;height: 200px;" id="que"></textarea>
	<span>Are you sure you want to insert the following values into the table?</span>
	<a href="#" onclick="runQuery()">Insert Items</a>
</div>

</body>
</html>