    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalada Mobile - Partite Giocate</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="../images/sciabalada.ico">
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
		
		

	
		<script type="text/javascript">
	
			
	    var game= {
	    		"id"    			: "${game.id}",
	    		"date"  			: "${game.gameDate}",
	            "kind"  			: "${game.kind}",
	            "bet"				: "${game.bet}",
	            "reentry"			: "${game.reentry}",
	            "ongoing"			: "${game.ongoing}",
	            "gamers"			: "${game.gamers}",
	            "reentersAngelo"	: "${game.reentersAngelo}",
	            "reentersCo"		: "${game.reentersCo}",
	            "reentersKatia"		: "${game.reentersKatia}",
	            "reentersMario"		: "${game.reentersMario}",
	            "reentersMauro"		: "${game.reentersMauro}",
	            "reentersRenzo"		: "${game.reentersRenzo}",
	            "reentersKarmen"	: "${game.reentersKarmen}",
	            "reentersGuest1"	: "${game.reentersGuest1}",
	            "reentersGuest2"	: "${game.reentersGuest2}",
	            "reentersGuest3" 	: "${game.reentersGuest3}",
	            "jackpot"			: "${game.jackpot}",
	            "winner"			: "${game.winner}"
	     };
	    
		//document.writeln("<H5O><br></H5O>");
	    document.writeln("<center><H4O>&nbsp&nbsp&nbspData: </H4O><H4W>" + game.date + "<br></H4W>");
	    var kindExt = "Normale";
		if (game.kind == "R"){
			kindExt = "Rientri";
		}	
		document.writeln("<H5O><br></H5O>");
		document.writeln("<H4O>&nbsp&nbsp&nbspTipo Partita: </H4O><H4W>" + kindExt + "<br></H4W>");
		document.writeln("<H5O><br></H5O>");
		document.writeln("<H4O>&nbsp&nbsp&nbspGiocata: </H4O><H4W>" + game.bet + " euro<br></H4W>");
		if(game.kind == "R"){
			document.writeln("<H5O><br></H5O>");
			document.writeln("<H4O>&nbsp&nbsp&nbspRientro: </H4O><H4W>" + game.reentry + " euro<br></H$4>");	
		}
		var onGoingExt = "No";
		if(game.ongoing == "true"){
			onGoingExt = "Sì";	
		}
		document.writeln("<H5O><br></H5O>");
		document.writeln("<H4O>&nbsp&nbsp&nbspIn Corso: </H4O><H4W>" + onGoingExt + "<br></H4W>");	
		
		if(onGoingExt == "No"){
			document.writeln("<H5O><br></H5O>");
			document.writeln("<H4O>&nbsp&nbsp&nbspJackpot: </H4O><H4W>" + game.jackpot + " euro<br></H4W>");
			document.writeln("<H5O><br></H5O>");
			document.writeln("<H4O>&nbsp&nbsp&nbspWinner: </H4O><H4W>" + game.winner + "<br></H4W><center>");	
		}
		
		document.writeln("<H5O><br></H5O>");
		document.writeln("<table style=\"width:80%\" align=\"center\">");
		document.writeln("<tr bgcolor=\"#000000\">");
		document.writeln("<td align=\"center\"><H3O>Giocatori<H3O></td>");
		if(game.kind == "R"){
			document.writeln("<td align=\"center\"><H3O>Rientri<H3O></td>");
		}
		document.writeln("</tr>");
		
		var gamers = game.gamers.split(",");
		for (var i = 0; i < gamers.length; i++) {
			
			if(game.kind == "R"){
				var reenters = 0;
				
				switch(gamers[i]) {
			  	case "Angelo":
			    	reenters = game.reentersAngelo;
			    	break;
			  	case "Co":
			    	reenters = game.reentersCo;
			    	break;
			  	case "Katia":
			    	reenters = game.reentersKatia;
			    	break;
				case "Mario":
			    	reenters = game.reentersMario;
			    	break;
				case "Mauro":
			    	reenters = game.reentersMauro;
			    	break;
				case "Renzo":
			    	reenters = game.reentersRenzo;
			    	break;
				case "Guest1":
			    	reenters = game.reentersGuest1;
			    	break;
				case "Guest2":
			    	reenters = game.reentersGuest2;
			    	break;		
			    case "Guest3":
				    reenters = game.reentersGuest3;
				    break;
				}
				document.writeln("<tr>");
				document.writeln("<td align=\"center\"><H3W>"+gamers[i]+"</H3W></td>");
				document.writeln("<td align=\"center\"><H3W>"+reenters+"</H3W></td>");
				document.writeln("</tr>");
			}else{
				document.writeln("<tr>");
				document.writeln("<td align=\"center\"><H3W>"+gamers[i]+"</H3W></td>");
				document.writeln("</tr>");
			}
		}
		document.writeln("</table>");

		
		</script>
	</body>
</html>
