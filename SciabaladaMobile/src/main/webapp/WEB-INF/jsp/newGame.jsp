<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalada Mobile - Nuova Partita</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/plus.png"></td>
		  		<td align="left"><h3w>&nbsp&nbsp&nbspNuova Partita</h3w></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>
		
		<form:form method="post" action="save" accept-charset="utf-8" > 
		
		<br><br><br>
		
		<table style="width:80%" align=center>
			<tr>
				<td align="center"><H3O>Data</H3O></td>
			</tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr>					
				<td align="center"><form:input type="date" path="gameDate" id="gameDate" min="2008-01-01" max="2100-12-31"/></td>
			</tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><hr></td></tr>
			
			
			<tr>
				<td align="center">
					<br>
					<H3O>Tipo Partita</H3O>
					<table align=center>
						<tr><td><H5O>&nbsp</H5O></td></tr>
						<tr>
							<td><form:radiobutton path="kind" value="N" label=" Normale" id="standard" checked="checked"/></td>
						</tr>
						<tr>
							<td><form:radiobutton path="kind" value="R" label=" Rientri" id="atReentry"/></td>
						</tr>
					</table>
					<tr><td><H5O>&nbsp</H5O></td></tr>
					<tr><td><hr></td></tr>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<br>
					<H3O>Giocata</H3O>
					<table>
						<tr><td><H5O>&nbsp</H5O></td></tr>
						<tr>
							<td><h3W>Puntata&nbsp&nbsp&nbsp</H3W></td>
							<td><form:input path="bet" type="number" id="bet" min="1" max="20" value="3"/></td>
						</tr>
						<tr>
							<td>&nbsp</td>
						</tr>
						<tr>
							<td><H3W>Rientro</H3W></td>
							<td><form:input path="reentry" type="number" id="reentry" min="1" max="10" value="1" disabled="true"/></td>
						</tr>
					</table>
					<tr><td><H5O>&nbsp</H5O></td></tr>
					<tr><td><hr></td></tr>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<br>
					<H3O>Tavolo</H3O>
					<table>
						<tr>
							<tr><td><H5O>&nbsp</H5O></td></tr>
							<td align="left"></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><H4W>Rientri</H4W></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Angelo" label=" Angelo" id="angelo"/> </td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersAngelo" type="number" id="reentersAngelo" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Angelo" label=" Winner" id="winAngelo" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Co" label=" Co" id="co"/>  </td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersCo" type="number" id="reentersCo" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Co" label=" Winner" id="winCo" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Katia" label=" Katia" id="katia"/>   </td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersKatia" type="number" id="reentersKatia" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Katia" label=" Winner" id="winKatia" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Mario" label=" Mario" id="mario"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersMario" type="number" id="reentersMario" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Mario" label=" Winner" id="winMario" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Mauro" label=" Mauro" id="mauro"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersMauro" type="number" id="reentersMauro" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Mauro" label=" Winner" id="winMauro" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Renzo" label=" Renzo" id="renzo"/></td> 
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersRenzo" type="number" id="reentersRenzo" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Renzo" label=" Winner" id="winRenzo" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Guest1" label=" Guest1" id="guest1"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersGuest1" type="number" id="reentersGuest1" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Guest1" label=" Winner" id="winGuest1" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Guest2" label=" Guest2" id="guest2"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersGuest2" type="number" id="reentersGuest2" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Guest2" label=" Winner" id="winGuest2" disabled="true"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="gamers" value="Guest3" label=" Guest3" id="guest3"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="center"><form:input path="reentersGuest3" type="number" id="reentersGuest3" min="0" max="100" value="0" disabled="true"/></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
							<td align="right"><form:radiobutton path="winner" value="Guest3" label=" Winner" id="winGuest3" disabled="true"/></td>
						</tr>
					</table>
					<tr><td><H5O>&nbsp</H5O></td></tr>
					<tr><td><hr></td></tr>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<br>
					<H3O>Jackpot</H3O>
				</td>
			</tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr>	
				<td align="center">	
					<form:input path="jackpot" type="number" id="jackpot" value="0" style="pointer-events: none;"/>
				</td>	

			</tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr>
				<td align="center">
					<input type="submit" class="button" value="Salva la Partita" id="saveButton" disabled="true">
				</td>
			</tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>

		</table>
	</form:form> 
</body>


<script type="text/javascript">

	//document.writeln(document.getElementById('atReentry').checked);
	
	var date = new Date();
	
	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();
	
	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;
	
	var today = year + "-" + month + "-" + day;       
	document.getElementById("gameDate").value = today;

	var standard = document.getElementById('standard');
	var atReentry = document.getElementById('atReentry');

	var bet = document.getElementById('bet');
	var reentry = document.getElementById('reentry');
	
	var angelo = document.getElementById('angelo');
	var reentersAngelo = document.getElementById('reentersAngelo');
	var winAngelo = document.getElementById('winAngelo');
	
	var co = document.getElementById('co');
	var reentersco = document.getElementById('reentersCo');
	var winCo = document.getElementById('winCo');
	
	var katia = document.getElementById('katia');
	var reentersKatia = document.getElementById('reentersKatia');
	var winKatia = document.getElementById('winKatia');

	var mario = document.getElementById('mario');
	var reentersMario = document.getElementById('reentersMario');
	var winMario = document.getElementById('winMario');
	
	var mauro = document.getElementById('mauro');
	var reentersMauro = document.getElementById('reentersMauro');
	var winMauro = document.getElementById('winMauro');

	var renzo = document.getElementById('renzo');
	var reentersRenzo = document.getElementById('reentersRenzo');
	var winRenzo = document.getElementById('winRenzo');

	var guest1 = document.getElementById('guest1');
	var reentersGuest1 = document.getElementById('reentersGuest1');
	var winGuest1 = document.getElementById('winGuest1');

	var guest2 = document.getElementById('guest2');
	var reentersGuest2 = document.getElementById('reentersGuest2');
	var winGuest2 = document.getElementById('winGuest2');

	var guest3 = document.getElementById('guest3');
	var reentersGuest3 = document.getElementById('reentersGuest3');
	var winGuest3 = document.getElementById('winGuest3');

	var jackpot = document.getElementById('jackpot');

	var saveButton = document.getElementById('saveButton');

	standard.onchange = function(){
		if(this.checked){
			reentry.disabled = true;
			reentry.value = "1";
			reentersAngelo.disabled = true;
			reentersAngelo.value = "0";
			reentersCo.disabled = true;
			reentersCo.value = "0";
			reentersKatia.disabled = true;
			reentersKatia.value = "0";
			reentersMario.disabled = true;
			reentersMario.value = "0";
			reentersMauro.disabled = true;
			reentersMauro.value = "0";
			reentersRenzo.disabled = true;
			reentersRenzo.value = "0";
			reentersGuest1.disabled = true;
			reentersGuest1.value = "0";
			reentersGuest2.disabled = true;
			reentersGuest2.value = "0";
			reentersGuest3.disabled = true;
			reentersGuest3.value = "0";
		} else {
			reentry.disabled = false;
		}
		getJackpot();
	}
	
	atReentry.onchange = function(){
		if(this.checked){
			reentry.disabled = false;
			if(angelo.checked){
				reentersAngelo.disabled = false;
			}
			if(co.checked){
				reentersCo.disabled = false;
			}
			if(katia.checked){
				reentersKatia.disabled = false;
			}
			if(mario.checked){
				reentersMario.disabled = false;
			}
			if(mauro.checked){
				reentersMauro.disabled = false;
			}
			if(renzo.checked){
				reentersRenzo.disabled = false;
			}
			if(guest1.checked){
				reentersGuest1.disabled = false;
			}
			if(guest2.checked){
				reentersGuest2.disabled = false;
			}
			if(guest3.checked){
				reentersGuest3.disabled = false;
			}
		} else {
			reentry.disabled = true;
		}
		getJackpot();
	}
		
	bet.onchange = function(){
		getJackpot();
	}
	
	reentry.onchange = function(){
		getJackpot();
	}

	angelo.onchange = function(){
		if(this.checked){
			winAngelo.disabled = false;
			if(atReentry.checked){
				reentersAngelo.disabled = false;
			}
		} else {
			winAngelo.disabled = true;
			reentersAngelo.disabled = true;
			reentersAngelo.value = "0";
			winAngelo.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}

	reentersAngelo.onchange = function(){
		getJackpot();
	}

	winAngelo.onchange = function(){
		manageSaveButton();
	}

	co.onchange = function(){
		if(this.checked){
			winCo.disabled = false;
			if(atReentry.checked){
				reentersCo.disabled = false;
			}
		} else {
			winCo.disabled = true;
			reentersCo.disabled = true;
			reentersCo.value = "0";
			winCo.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}

	reentersCo.onchange = function(){
		getJackpot();
	}

	winCo.onchange = function(){
		manageSaveButton();
	}

	katia.onchange = function(){
		if(this.checked){
			winKatia.disabled = false;
			if(atReentry.checked){
				reentersKatia.disabled = false;
			}
		} else {
			winKatia.disabled = true;
			reentersKatia.disabled = true;
			reentersKatia.value = "0";
			winKatia.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersKatia.onchange = function(){
		getJackpot();
	}

	winKatia.onchange = function(){
		manageSaveButton();
	}

	mario.onchange = function(){
		if(this.checked){
			winMario.disabled = false;
			if(atReentry.checked){
				reentersMario.disabled = false;
			}
		} else {
			winMario.disabled = true;
			reentersMario.disabled = true;
			reentersMario.value = "0";
			winMario.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersMario.onchange = function(){
		getJackpot();
	}

	winMario.onchange = function(){
		manageSaveButton();
	}
	
	mauro.onchange = function(){
		if(this.checked){
			winMauro.disabled = false;
			if(atReentry.checked){
				reentersMauro.disabled = false;
			}
		} else {
			winMauro.disabled = true;
			reentersMauro.disabled = true;
			reentersMauro.value = "0";
			winMauro.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersMauro.onchange = function(){
		getJackpot();
	}

	winMauro.onchange = function(){
		manageSaveButton();
	}

	renzo.onchange = function(){
		if(this.checked){
			winRenzo.disabled = false;
			if(atReentry.checked){
				reentersRenzo.disabled = false;
			}
		} else {
			winRenzo.disabled = true;
			reentersRenzo.disabled = true;
			reentersRenzo.value = "0";
			winRenzo.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersRenzo.onchange = function(){
		getJackpot();
	}

	winRenzo.onchange = function(){
		manageSaveButton();
	}

	guest1.onchange = function(){
		if(this.checked){
			winGuest1.disabled = false;
			if(atReentry.checked){
				reentersGuest1.disabled = false;
			}
		} else {
			winGuest1.disabled = true;
			reentersGuest1.disabled = true;
			reentersGuest1.value = "0";
			winGuest1.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersGuest1.onchange = function(){
		getJackpot();
	}

	winGuest1.onchange = function(){
		manageSaveButton();
	}
	
	guest2.onchange = function(){
		if(this.checked){
			winGuest2.disabled = false;
			if(atReentry.checked){
				reentersGuest2.disabled = false;
			}
		} else {
			winGuest2.disabled = true;
			reentersGuest2.disabled = true;
			reentersGuest2.value = "0";
			winGuest2.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersGuest2.onchange = function(){
		getJackpot();
	}

	winGuest2.onchange = function(){
		manageSaveButton();
	}

	guest3.onchange = function(){
		if(this.checked){
			winGuest3.disabled = false;
			if(atReentry.checked){
				reentersGuest3.disabled = false;
			}
		} else {
			winGuest3.disabled = true;
			reentersGuest3.disabled = true;
			reentersGuest3.value = "0";
			winGuest3.checked = false;
		}
		getJackpot();
		manageSaveButton();
	}
	
	reentersGuest3.onchange = function(){
		getJackpot();
	}

	winGuest3.onchange = function(){
		manageSaveButton();
	}
	
	function getJackpot() {
		
		var jackpotValue = parseInt(0);
		var betValue = parseInt(bet.value);
		var reentryValue = parseInt(reentry.value);
		
		if(angelo.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersAngelo.value);
		}
		
		if(co.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersCo.value);
		}
		
		if(katia.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersKatia.value);
		}

		if(mario.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersMario.value);
		}

		if(mauro.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersMauro.value);
		}

		if(renzo.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersRenzo.value);
		}

		if(guest1.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersGuest1.value);
		}

		if(guest2.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersGuest2.value);
		}
		
		if(guest3.checked){
			jackpotValue = jackpotValue + betValue + reentryValue * parseInt(reentersGuest3.value);
		}

		jackpot.value = jackpotValue;
	}
	
	function manageSaveButton() {
		var numGamers = 0;
		var numWinners = 0;
		
		if(angelo.checked){numGamers++;}
		if(co.checked){numGamers++;}
		if(katia.checked){numGamers++;}
		if(mario.checked){numGamers++;}
		if(mauro.checked){numGamers++;}
		if(renzo.checked){numGamers++;}
		if(guest1.checked){numGamers++;}
		if(guest2.checked){numGamers++;}
		if(guest3.checked){numGamers++;}
		
		if(winAngelo.checked){numWinners++;}
		if(winCo.checked){numWinners++;}
		if(winKatia.checked){numWinners++;}
		if(winMario.checked){numWinners++;}
		if(winMauro.checked){numWinners++;}
		if(winRenzo.checked){numWinners++;}
		if(winGuest1.checked){numWinners++;}
		if(winGuest2.checked){numWinners++;}
		if(winGuest3.checked){numWinners++;}

		if(numGamers > 1 && numWinners == 1){
			saveButton.disabled = false;	
		}else{
			saveButton.disabled = true;	
		}
		
	}

</script>

 