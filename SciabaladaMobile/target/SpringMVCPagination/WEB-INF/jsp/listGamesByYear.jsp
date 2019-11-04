    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalata Mobile - Partite Giocate</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="../images/list.png"></td>
		  		<td align="left"><h3w>&nbsp&nbsp&nbspPartite Giocate</h3w></td>
		  		<td align="right"><a href="../index.jsp"><img src="../images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>
		
		<br>
		<table style="width:80%" align=center>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><H3O>Totale Partite Giocate: ${gamesByYearList.size()}</H3O></td></tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
		</table>
		
		<br>
		<table style="width:100%" align=center>
			<tr bgcolor="#000000">
				<td align="center"><H4O>Data</H4O></td>
				<td align="center"><H4O>Tipo</H4O></td>
				<td align="center"><H4O>Winner</H4O></td>
				<td align="center"><H4O>Jackpot</H4O></td>
				<td align="center"><H4O>&nbsp</H4O></td>
				<td align="center"><H4O>&nbsp</H4O></td>
			</tr>
			<c:forEach var="game" items="${gamesByYearList}"> 
		    	<tr>
					<td align="center"><H4W>${game.gameDate}</H4W></td>
					<td align="center"><H4W>${game.kind}</H4W></td>
					<td align="center"><H4W>${game.winner}</H4W></td>
					<td align="center" ><H4W>${game.jackpot}</H4W></td>
					<td align="center"><a href="../gameDetails/${game.id}"><img src="../images/details.png"></a></td>
					<td align="center"><a href="../deleteGame?id=${game.id}&year=${game.gameYearDate}"  onclick="return confirm('Sei sicuro di voler cancellare questa partita?')"><img src="../images/trash.png"></a></td>
				</tr>
		    </c:forEach> 
		</table>
    </body>
</html>    
