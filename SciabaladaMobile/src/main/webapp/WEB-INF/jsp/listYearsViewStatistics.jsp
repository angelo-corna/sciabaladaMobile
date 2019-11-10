    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<html>
	<head>
		<title>Sciabalata Mobile - Statistiche</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/chart.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspStatistiche</H3W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:80%" align=center>
				
				    <c:forEach var="year" items="${yearsListStatistics}">
						<tr><td><H1O>&nbsp</H1O></td></tr>
						<tr><td align="center"><H1O>${year}</H1O></td></tr>
						<tr>
			    			<td align="center"><a href="balanceChart/${year}"><H3W>Saldo</H3W></a></td>
						</tr>
						<tr>
			    			<td align="center"><a href="wonGamesChart/${year}"><H3W>Partite Vinte</H3W></a></td>
						</tr>
			    	</c:forEach>
			    	<tr><td><H1O>&nbsp</H1O></td></tr>
					<tr><td align="center"><H1O>Overall</H1O></td></tr>
					<tr>
			    		<td align="center"><a href="balanceChart/Overall"><H3W>Saldo</H3W></a></td>
					</tr>
					<tr>
			    		<td align="center"><a href="wonGamesChart/Overall"><H3W>Partite Vinte</H3W></a></td>
					</tr>
		</table>

	</body>
</html>

