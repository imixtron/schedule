<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/cubcake.css">
<title>Programs</title>
</head>
<body>
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
		<s:param name="slottype" value="1"></s:param> BBBB</s:a>
	<s:a>
		<s:param name="program" value="3"></s:param>
		<s:param name="slottype" value="2"></s:param>BBBB</s:a>
	<s:a>
		<s:param name="program" value="2"></s:param>
		<s:param name="slottype" value="1"></s:param>BBA</s:a>



	<table border="1" class="tbl" width="2800px"
		style="position: absolute;">
		<tbody>
			<tr class="rows" align="center">
				<td class="days">Days</td>
				<td class="days">Time slots</td>
				<!-- BLANK -->
				<s:iterator value="sections">
					<td class="days" width="150"><s:property value="sectionname" />
					</td>
				</s:iterator>
			</tr>


			<s:iterator value="days">
				<s:iterator value="slots">
					<tr class="rows" align="center">
						<td class="days"><s:property value="dayname" /></td>
						<td class="slots ends header" width="100"><s:property
								value="duration" /></td>

						<s:iterator value="sections">
							<s:set var="hashkey" value="dayid + '-' + slotno + '-' + secid"></s:set>
							<td class="slots " width="150">
							<s:iterator value="scheduleMap.get(#hashkey)">
								<s:if test="scheduleMap.get(#hashkey) != undefined">
										<s:property value="title" /><br /> 
										<s:property value="teachername" /><br /> 
 										Room <s:property value="roomno" /><br/>
 										Campus <s:property value="campus"/>
								</s:if>
<%-- 								<s:if test="scheduleMap.get(#hashkey) == null"> --%>
<%-- 									<td class="slots" width="130"><s:property value="#hashkey" /></td> --%>
<%-- 								</s:if> --%>
							</s:iterator>
							</td>
						</s:iterator>
					</tr>

				</s:iterator>
				<tr>
					<td colspan="14">
					<td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>