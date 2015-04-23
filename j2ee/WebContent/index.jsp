<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="CSS/cubcake.css">
<title>Anwer</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script>
deleteEntry = function(tdOb){
	tof = tdOb;
	_schid = tdOb.getElementsByTagName('span');
	_schid = _schid[0].innerHTML;
	
	if(!confirm("schedule ID: "+_schid+"\nAre you sure?"))
		return;
	$.ajax({
        type: "POST",
        url:"update.jsp",//jsp,servlet,struts action
        data: {'_schid':_schid,'oper':'delete'}
	}).success(function(responseText){
		alert(_schid+"::Deleted")
		console.log(responseText);
			gen(CAMPUS);
	});
}
</script>

</head>
<body>
	<s:a>
		<s:param name="campus" value="90"></s:param>90</s:a>
	<s:a>
		<s:param name="campus" value="100"></s:param>100</s:a>
	<s:a>
		<s:param name="campus" value="154"></s:param>154</s:a>
	<br />
	<s:a>
		<s:param name="program" value="1"></s:param>
		<s:param name="slottype" value="1"></s:param> BABS</s:a>
	<s:a>
		<s:param name="program" value="3"></s:param>
		<s:param name="slottype" value="2"></s:param>BSCS</s:a>
	<s:a>
		<s:param name="program" value="2"></s:param>
		<s:param name="slottype" value="1"></s:param>BBA</s:a>
	<s:a>
		<s:param name="program" value="4"></s:param>
		<s:param name="slottype" value="2"></s:param>BEME</s:a>
	<s:a>
		<s:param name="program" value="5"></s:param>
		<s:param name="slottype" value="1"></s:param>BS MEDIA</s:a>
	<s:a>
		<s:param name="program" value="6"></s:param>
		<s:param name="slottype" value="2"></s:param>BS BIO</s:a>
	<s:a>
		<s:param name="program" value="7"></s:param>
		<s:param name="slottype" value="1"></s:param>BSSS</s:a>




<table border="1" class="tbl" width="1800px" style="position: absolute;">
<tbody>
	<tr>
		<td class="days"></td><!-- BLANK -->
		<td class="rooms ends" ></td><!-- BLANK -->
		<s:iterator value="slots">
			<td colspan="3" class="slots ends header">
			<s:property value="slotno"/> Time Slot</td>
		</s:iterator>	
	</tr>
	
	<tr>
		<td class="days"></td>
		<td class="rooms ends" ></td>
		<s:iterator value="slots">
			<td colspan="3" class="slots ends header">
			<s:property value="duration"/></td>
		</s:iterator>	
	</tr>
	
	<tr align="center">
		<td class="days">Days</td>
		<td class="rooms ends">Rooms</td>
		<s:iterator begin="0" end="3">
			<td class="slots" width="130">Teacher</td>
		    <td class="slots" width="130">Subject</td>
		    <td class="slots ends" width="130">Class</td>
		</s:iterator>
	</tr>
	<s:set var="rowspan" value="%{rooms.size}"></s:set>
	<s:iterator value="days">
		<s:iterator value="rooms">
			<tr class="rows" align="center">
			<td class="days"><s:property value="dayname"/></td>
			<td class="rooms ends"><s:property value="roomno"/></td>
						<!-- INNER -->
						<s:iterator value="slots">
							<s:set var="hashkey" value="dayid + '-' + roomid + '-' + slotno"></s:set>
<%-- 							<td><s:property value="hashkey"/>  </td> --%>
							<s:set  value="%{scheduleMap[hashkey]}"></s:set>
<%-- 							<s:if test="%{scheduleMap[hashkey] != undefined}"> --%>
								<s:if test="scheduleMap.get(#hashkey) != undefined">
								<s:set  value="scheduleMap[#hashkey].size()" name="sizecheck"></s:set>
								<s:if test ="#sizecheck == 1">
										<s:iterator value="scheduleMap.get(#hashkey)">
											<td class="slots" width="130" onclick="deleteEntry(this)"> <span style="display:none" ><s:property value="schid"/></span> <s:property value="teachername"/> </td>
											<td class="slots" width="130"><s:property value="title"/></td>
											<td class="slots ends" width="130"> <s:property value="sectionname"/> (<s:property value="duration"/> )</td>
										</s:iterator>
								</s:if>	
								<s:else>
								 		<!--else -->
								 		<td class="slots" width="130">
								    	<table width="100%" border="0">
								    	<s:iterator value="scheduleMap.get(#hashkey)">
												<tr height="20px">
													<td align="center"  onclick="deleteEntry(this)"> <span style="display:none"><s:property value="schid"/></span> <s:property value="teachername"/></td>
												</tr>
											</s:iterator>
										</table>
										
										</td>
								    	<td class="=slots" width="130">
										<table width="100%" border="0">
								    	<s:iterator value="scheduleMap.get(#hashkey)">
												<tr height="20px">
													<td align="center"><s:property value="title"/></td>
												</tr>
											</s:iterator>
										</table>
										
										</td>
										<td class="slots ends" width="130">
										<table width="100%" border="0">
								    		<s:iterator value="scheduleMap.get(#hashkey)">
												<tr height="20px">
													<td align="center" ><s:property value="sectionname"/>  (<s:property value="duration"/>)</td>
												</tr>
											</s:iterator>
										</table>
										</td>
										
										
								</s:else>
							</s:if>
							<s:else>
							<td class="slots" width="130"></td>
							<td class="slots" width="130"></td>
							<td class="slots ends" width="130"></td>
						</s:else>
				</s:iterator>
					</tr>
				</s:iterator>
				<tr><td colspan="14"><td></tr>
	</s:iterator>
</tbody>	
</table>
</body>
</html>