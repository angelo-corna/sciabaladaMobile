    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalada Mobile - Montepremi</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/dollar.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspMontepremi</H3W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>
		
		<table style="width:80%" align=center>
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr><td align="center"><H1O>Anno: ${currentYear}</H1O></td></tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr><td align="center"><H1O>Jackpot: ${jackpot}</H1O></td></tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
		</table>

		<table style="width:80%" align=center>
			
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
				
			<c:forEach var="jackpotWinner" items="${jackpotWinners}"> 
				<tr>
			    	<td align="center"><H1W>${jackpotWinner.winner}</H1W></td>
			    	<td align="center"><H1W>${jackpotWinner.jackpot}</H1W></td>
				</tr>
				<tr><td><H1O>&nbsp</H1O></td></tr>
			</c:forEach>
		</table>

	</body>
</html>


