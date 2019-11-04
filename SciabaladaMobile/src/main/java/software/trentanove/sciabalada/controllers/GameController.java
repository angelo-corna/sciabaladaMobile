package software.trentanove.sciabalada.controllers;   

import java.util.ArrayList;
import java.util.List;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import software.trentanove.sciabalada.beans.Game;
import software.trentanove.sciabalada.dao.GameDao;  

@Controller  
public class GameController {  
    @Autowired  
    GameDao dao;//will inject dao from xml file  
      
    @RequestMapping("/newGame")  
    public String showform(Model m){  
    	m.addAttribute("command", new Game());
    	return "newGame"; 
    }  
    
    @RequestMapping(value="/save",method = RequestMethod.POST)  
    public String save(@ModelAttribute("game") Game game){  
        dao.saveGame(game);  
        return "redirect:/winner;"; 
    }  
    
    @RequestMapping("/winner")  
    public String viewWinner(Model m){  
        Game lastGame=dao.getLastGame();  
        m.addAttribute("lastGame",lastGame);
        return "winner";  
    }  
    
    @RequestMapping("/listYearsView")  
    public String listYearsView(Model m){  
        List<String> yearsList=dao.getYears();  
        m.addAttribute("yearList",yearsList);
        return "listYearsView";  
    } 
    
    @RequestMapping("/listGamesByYear/{year}")  
    public String listGamesByYear(@PathVariable String year, Model m){  
        List<Game> gamesByYearList=dao.getGamesByYear(year);  
        m.addAttribute("gamesByYearList",gamesByYearList);
        return "listGamesByYear";  
    }
    
    @RequestMapping("/gameDetails/{id}")  
    public String gameDetails(@PathVariable int id, Model m){  
        Game game=dao.getGameById(id);  
        m.addAttribute("game",game);
        return "gameDetails";  
    } 
    
    @RequestMapping(value="/deleteGame",method = RequestMethod.GET)  
    public String delete(@RequestParam(value = "id", required = true) int id, @RequestParam(value = "year", required = true) String year) {  
        dao.deleteGame(id);  
        return "redirect://listGamesByYear/"+year;  
    }   
    
    @RequestMapping("/listYearsViewStatistics")  
    public String listYearsViewStatistics(Model m){  
        List<String> yearsListStatistics=dao.getYears();  
        m.addAttribute("yearsListStatistics",yearsListStatistics);
        return "listYearsViewStatistics";  
    } 
    
    @RequestMapping("/balanceChart/{year}")  
    public String balanceChart(@PathVariable String year, Model m){
    	List<Game> balanceGames = new ArrayList<Game>();
    	if(year.equals("Overall")) {
    		balanceGames = dao.getChartGames();  	
    	}else {
        	balanceGames = dao.getChartGamesByYear(year);  
    	}
    	float lossAngelo = 0;
    	float balanceAngelo = 0;
    	float balanceCo = 0;
    	float balanceKatia = 0;
    	float balanceMario = 0;
    	float balanceMauro = 0;
    	float balanceRenzo = 0;
    	float balanceKarmen = 0;
    	float balanceOthers = 0;
    	for(Game balanceGame : balanceGames) {
    		
    		//add jackpot
    		String winner = balanceGame.getWinner();
    		switch(winner){
	    		case "Angelo":
	    			balanceAngelo = balanceAngelo + balanceGame.getJackpot();
	    			break;
	    		case "Co":
	    			balanceCo = balanceCo + balanceGame.getJackpot();
	    			break;
	    		case "Katia":
	    			balanceKatia = balanceKatia + balanceGame.getJackpot();
	    			break;
	    		case "Mario":
	    			balanceMario = balanceMario + balanceGame.getJackpot();
	    			break;
	    		case "Mauro":
	    			balanceMauro = balanceMauro + balanceGame.getJackpot();
	    			break;
	    		case "Renzo":
	    			balanceRenzo = balanceRenzo + balanceGame.getJackpot();
	    			break;
	    		case "Karmen":
	    			balanceKarmen = balanceKarmen + balanceGame.getJackpot();
	    			break;
	    		default:
	    			balanceOthers = balanceOthers + balanceGame.getJackpot();
    		}
    		
    		//remove loss
    		String gamers = balanceGame.getGamers();
    		String[] gamersP = gamers.split(",");
    		for(int z = 0; z < gamersP.length; z++){
    			String gamer = gamersP[z];
        		switch(gamer){
	        		case "Angelo":
	        			balanceAngelo = balanceAngelo - balanceGame.getBet() - (balanceGame.getReentersAngelo() * balanceGame.getReentry());
	        			break;
	        		case "Co":
	        			balanceCo = balanceCo - balanceGame.getBet() - (balanceGame.getReentersCo() * balanceGame.getReentry());
	        			break;
	        		case "Katia":
	        			balanceKatia = balanceKatia - balanceGame.getBet() - (balanceGame.getReentersKatia() * balanceGame.getReentry());
	        			break;
	        		case "Mario":
	        			balanceMario = balanceMario - balanceGame.getBet() - (balanceGame.getReentersMario() * balanceGame.getReentry());
	        			break;
	        		case "Mauro":
	        			balanceMauro = balanceMauro - balanceGame.getBet() - (balanceGame.getReentersMauro() * balanceGame.getReentry());
	        			break;
	        		case "Renzo":
	        			balanceRenzo = balanceRenzo - balanceGame.getBet() - (balanceGame.getReentersRenzo() * balanceGame.getReentry());
	        			break;
	        		case "Karmen":
	        			balanceKarmen = balanceKarmen - balanceGame.getBet() - (balanceGame.getReentersKarmen() * balanceGame.getReentry());
	        			break;
	        		case "Guest1":
	        			balanceOthers = balanceOthers - balanceGame.getBet() - (balanceGame.getReentersGuest1() * balanceGame.getReentry());
	        			break;
	        		case "Guest2":
	        			balanceOthers = balanceOthers - balanceGame.getBet() - (balanceGame.getReentersGuest2() * balanceGame.getReentry());
	        			break;
	        		case "Guest3":
	        			balanceOthers = balanceOthers - balanceGame.getBet() - (balanceGame.getReentersGuest3() * balanceGame.getReentry());
	        			break;
	        		}
    		}
    	}
    	
		List<String> balance = new ArrayList<String>();
		balance.add("'Nome', 'Saldo'");
		if(balanceAngelo != 0 ) {
			balance.add("'Angelo', " + balanceAngelo);
		}
		if(balanceCo != 0 ) {
			balance.add("'Co', " + balanceCo);
		}
		if(balanceKarmen != 0 ) {
			balance.add("'Karmen', " + balanceKarmen);	
		}
		if(balanceKatia != 0 ) {
			balance.add("'Katia', " + balanceKatia);
		}
		if(balanceMario != 0 ) {
			balance.add("'Mario', " + balanceMario);	
		}
		if(balanceMauro != 0 ) {
			balance.add("'Mauro', " + balanceMauro);	
		}
		if(balanceRenzo != 0 ) {
			balance.add("'Renzo', " + balanceRenzo);	
		}
		if(balanceOthers != 0 ) {
			balance.add("'Others', " + balanceOthers);	
		}

        m.addAttribute("balance",balance);
        return "balanceChart";  
    }  

    @RequestMapping("/wonGamesChart/{year}")  
    public String wonGamesChart(@PathVariable String year, Model m){
    	List<Game> wonGames = new ArrayList<Game>();
    	if(year.equals("Overall")) {
    		wonGames = dao.getChartGames();  	
    	}else {
        	wonGames = dao.getChartGamesByYear(year);  
    	}
    	
    	int wonAngeloN = 0;
    	int wonAngeloR = 0;
    	int wonCoN = 0;
    	int wonCoR = 0;
    	int wonKatiaN = 0;
    	int wonKatiaR = 0;
    	int wonMarioN = 0;
    	int wonMarioR = 0;
    	int wonMauroN = 0;
    	int wonMauroR = 0;
    	int wonRenzoN = 0;
    	int wonRenzoR = 0;
    	int wonKarmenN = 0;
    	int wonKarmenR = 0;
    	int wonOthersN = 0;
    	int wonOthersR = 0;
    	for(Game wonGame : wonGames) {
    		String winner = wonGame.getWinner();
    		switch(winner){
    		case "Angelo":
    			if(wonGame.getKind().equals("N")) {
    				wonAngeloN++;	
    			} else {
    				wonAngeloR++;    				
    			}
    			break;
    		case "Co":
    			if(wonGame.getKind().equals("N")) {
    				wonCoN++;	
    			} else {
    				wonCoR++;    				
    			}
    			break;
    		case "Katia":
    			if(wonGame.getKind().equals("N")) {
    				wonKatiaN++;	
    			} else {
    				wonKatiaR++;    				
    			}
    			break;
    		case "Mario":
    			if(wonGame.getKind().equals("N")) {
    				wonMarioN++;	
    			} else {
    				wonMarioR++;    				
    			}
    			break;
    		case "Mauro":
    			if(wonGame.getKind().equals("N")) {
    				wonMauroN++;	
    			} else {
    				wonMauroR++;    				
    			}    			
    			break;
    		case "Renzo":
    			if(wonGame.getKind().equals("N")) {
    				wonRenzoN++;	
    			} else {
    				wonRenzoR++;    				
    			}
    			break;
    		case "Karmen":
    			if(wonGame.getKind().equals("N")) {
    				wonKarmenN++;	
    			} else {
    				wonKarmenR++;    				
    			}
    			break;
    		default:
    			if(wonGame.getKind().equals("N")) {
    				wonOthersN++;	
    			} else {
    				wonOthersR++;    				
    			}
    		}
    	}
    	
    	List<String> won = new ArrayList<String>();
    	won.add("'Nome', 'Normale', 'Rientri'");
		if((wonAngeloN + wonAngeloR) != 0 ) {
			won.add("'Angelo', " + wonAngeloN + "," + wonAngeloR);
		}
		if((wonCoN + wonCoR) != 0 ) {
			won.add("'Co', " + wonCoN + "," + wonCoR);
		}
		if((wonKarmenN + wonKarmenR) != 0 ) {
			won.add("'Karmen', " + wonKarmenN + "," + wonKarmenR);	
		}
		if((wonKatiaN + wonKatiaR) != 0 ) {
			won.add("'Katia', " + wonKatiaN + "," + wonKatiaR);
		}
		if((wonMarioN + wonMarioR) != 0 ) {
			won.add("'Mario', " + wonMarioN + "," + wonMarioR);	
		}
		if((wonMauroN + wonMauroR) != 0 ) {
			won.add("'Mauro', " + wonMauroN + "," + wonMauroR);	
		}
		if((wonRenzoN + wonRenzoR) != 0 ) {
			won.add("'Renzo', " + wonRenzoN + "," + wonRenzoR);	
		}
		if((wonOthersN + wonOthersR) != 0 ) {
			won.add("'Others', " + wonOthersN + "," + wonOthersR);	
		}
    	
        m.addAttribute("won",won);
        return "wonGamesChart";  
    }     

}  

