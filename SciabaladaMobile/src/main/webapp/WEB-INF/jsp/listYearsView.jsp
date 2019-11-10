    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalata Mobile - Partite Giocate</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/list.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspPartite Giocate</H3W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:80%" align=center>
				
			    	<c:forEach var="year" items="${yearList}"> 
						<tr><td><H1O>&nbsp</H1O></td></tr>
						<tr>
			    			<td align="center"><a href="listGamesByYear/${year}"><H1O>${year}</H1O></a></td>
						</tr>
			    	</c:forEach>
		</table>

	</body>
</html>


