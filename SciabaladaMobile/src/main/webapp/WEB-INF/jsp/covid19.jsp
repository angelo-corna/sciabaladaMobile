    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalada Mobile - Saldo COVID-19</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/virus.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspSaldo COVID-19</H3W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:80%" align=center>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td align="center"><H3O>Totale Partite Giocate: ${gamesNumber}</H3O></td></tr>
		</table>

		<table style="width:80%" align=center>
			    	<c:forEach var="gamerCovid19" items="${gamersCovid19}"> 
						<tr><td><H1O>&nbsp</H1O></td></tr>
						<tr>
			    			<td align="right"><H3W>${gamerCovid19[0]}:</H3W></a></td>
			    			<td><H3W>&nbsp</H3W>
			    			<td align="left"><H3W>${gamerCovid19[1]} euro</H3W></a></td>
						</tr>
			    	</c:forEach>
		</table>

	</body>
</html>


