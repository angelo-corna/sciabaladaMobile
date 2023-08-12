    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalada Mobile - Previsione AI</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/ai.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspPrevisione AI</H3W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>
		
		<table style="width:80%" align=center>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td align="center"><H4O>Data Previsione: ${predictionList.get(0).predictionDate}</H4O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
		</table>

		<table style="width:80%" align=center>
			<tr bgcolor="#000000">
				<td align="center"><H4O></H4O></td>
				<td align="center"><H4O>Previsione</H4O></td>
				<td align="center"><H4O>F</H4O></td>
				<td align="center"><H4O>E</H4O></td>
				<td align="center"><H4O>I</H4O></td>
			</tr>
			
			<tr><td><H5O>&nbsp</H5O></td></tr>
				
			<c:forEach var="prediction" items="${predictionList}"> 
				<tr>
			    	<td align="center"><H4W>${prediction.gamer}</H4W></td>
			    	<td align="center"><H4W>${prediction.predictionPerc}%</H4W></td>
			    	<td align="center"><H5W>${prediction.biorhythmP}%</H5W></td>
			    	<td align="center"><H5W>${prediction.biorhythmE}%</H5W></td>
			    	<td align="center"><H5W>${prediction.biorhythmI}%</H5W></td>
				</tr>
				<tr><td><H1O>&nbsp</H1O></td></tr>
			</c:forEach>
		</table>

	</body>
</html>


