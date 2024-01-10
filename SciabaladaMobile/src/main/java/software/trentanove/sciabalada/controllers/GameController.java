package software.trentanove.sciabalada.controllers;   

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import software.trentanove.sciabalada.beans.Game;
import software.trentanove.sciabalada.beans.Prediction;
import software.trentanove.sciabalada.dao.GameDao;  

@Controller  
public class GameController {  
    @Autowired  
    GameDao dao;//will inject dao from xml file  

    @Value("${token}") private String tokenValue;
    @Value("${chatId}") private String chatIdValue;
      
    @RequestMapping("/newGame")  
    public String showform(Model m){  
    	m.addAttribute("command", new Game());
    	return "newGame"; 
    }  
    
    @RequestMapping(value="/save",method = RequestMethod.POST)  
    public String save(@ModelAttribute("game") Game game){  
        dao.saveGame(game);  
        dao.sendTelegramNotification(game, tokenValue, chatIdValue);
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
    
    @RequestMapping("/aiPrediction")  
    public String aiPrediction(Model m){  
        List<Prediction> predictionList=dao.getPrediction();  
        m.addAttribute("predictionList",predictionList);
        return "aiPrediction";  
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
    
    @RequestMapping("/covid19")  
    public String covid19(Model m){
    	List<Game> codGames = new ArrayList<Game>();
    	Map <String, Float> gamersMap = new HashMap<String, Float>();

    	codGames = dao.getCovid19Data();  
    	
    	for(Game codGame : codGames) {
	    	Float bet = codGame.getBet();
	    	String gamers = codGame.getGamers();
	    	String winner = codGame.getWinner();
	    	
	    	String[] gamersP = gamers.split(",");
	    	for(int i=0; i < gamersP.length; i++) {

	    		Float cash = bet;
    			String gamer = gamersP[i];
    			if(!gamer.equals(winner)) {
    				cash = bet * -1;
    			} else {
    				cash = bet * (gamersP.length - 1);
    			}
	    		if(gamersMap.containsKey(gamer)) {
	    			Float gamerCash = gamersMap.get(gamer);
	    			Float newGamerCash = gamerCash + cash;
	    			gamersMap.put(gamer, newGamerCash);
	    		}else{
	    			gamersMap.put(gamer,cash);
	    		}
	    		
	    	}
	    }
    	
    	Map<String, Float> sortedGamersMap = sortByComparator(gamersMap, false);
    	
    	List<String[]> gamersCovid19 = new ArrayList<String[]>();
    	//String[] gamersCovid19[];
    	
		Iterator<Entry<String, Float>> it = sortedGamersMap.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Float> pair = (Map.Entry<String, Float>) it.next();
			String[] gamerCovid19 = new String[]{ pair.getKey(), String.valueOf(pair.getValue()) }; 
			gamersCovid19.add(gamerCovid19);
		}

        m.addAttribute("gamersCovid19",gamersCovid19);
        m.addAttribute("gamesNumber",codGames.size());
        return "covid19";  
    } 
    
    private static Map<String, Float> sortByComparator(Map<String, Float> unsortMap, final boolean order)
    {

        List<Entry<String, Float>> list = new LinkedList<Entry<String, Float>>(unsortMap.entrySet());

        // Sorting the list based on values
        Collections.sort(list, new Comparator<Entry<String, Float>>()
        {
            public int compare(Entry<String, Float> o1,
                    Entry<String, Float> o2)
            {
                if (order)
                {
                    return o1.getValue().compareTo(o2.getValue());
                }
                else
                {
                    return o2.getValue().compareTo(o1.getValue());

                }
            }
        });

        // Maintaining insertion order with the help of LinkedList
        Map<String, Float> sortedMap = new LinkedHashMap<String, Float>();
        for (Entry<String, Float> entry : list)
        {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }

}  

