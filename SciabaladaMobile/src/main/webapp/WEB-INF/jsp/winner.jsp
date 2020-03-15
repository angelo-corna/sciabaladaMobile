    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
	<head>
		<title>Sciabalada Mobile - And The Winners is ....</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/plus.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspNuova Partita</H3W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:100%">
			<tr>
				<td><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<H1O>and the winner is .....</H1O>
				</td>
			</tr>
			<tr>
				<td align="center">
					<H1O>${lastGame.winner}</H1O>
				</td>
			</tr>	
		
			<tr>
				<td align="center" colspan="2"><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center"><img src="images/gamers/${lastGame.winner}.jpg"></td>
			</tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr>
				<td align="center"><H1O>Jackpot vinto ${lastGame.jackpot} euro</H1O></td>
			</tr>
		</table>		  

	
	
	
	<!-- a href="index.jsp">Exit</a-->


	</body>
</html>
 
	