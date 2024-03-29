package software.trentanove.sciabalada.dao;  
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import software.trentanove.sciabalada.beans.Game;
import software.trentanove.sciabalada.beans.JackpotWinner;
import software.trentanove.sciabalada.beans.Prediction;  
  
public class GameDao {  
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  

	public int saveGame(Game g){  
	    return template.update(
			"insert into games(date,kind,bet,reentry,ongoing,gamers,reentersAngelo,reentersCo,reentersKatia,"
			+ "reentersMario,reentersMauro,reentersRenzo,reentersKarmen,reentersGuest1,reentersGuest2,"
			+ "reentersGuest3,winner,jackpot)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
		    new Object[] {
		    	g.getGameDate(),
				g.getKind(),
				g.getBet(),
				g.getReentry(),
				false,
				g.getGamers(),
				g.getReentersAngelo(),
				g.getReentersCo(),
				g.getReentersKatia(),
				g.getReentersMario(),
				g.getReentersMauro(),
				g.getReentersRenzo(),
				0,
				g.getReentersGuest1(),
				g.getReentersGuest2(),
				g.getReentersGuest3(),
				g.getWinner(),
				g.getJackpot()
			}
		);
	}  
	
	public Game getLastGame(){  
	    String sql="select * from games order by id desc limit 1";  
	    return template.queryForObject(sql, null ,new BeanPropertyRowMapper<Game>(Game.class));  
	} 
	
	public List<String> getYears(){  
	    return template.query("select distinct(year(date)) as year from games order by 1 desc",new RowMapper<String>(){  
	        public String mapRow(ResultSet rs, int row) throws SQLException {  
	            return rs.getString(1);  
	        }  
	    });  
	}  
	
	public List<Game> getGamesByYear(String year){  
	    return template.query("select id,DATE_FORMAT(date, \"%d-%m-%Y\"),DATE_FORMAT(date, \"%Y\"),kind,jackpot,winner from games "
	    		+ "where year(date) = ? order by date desc,id desc",new Object[] {year},new RowMapper<Game>(){  
	        public Game mapRow(ResultSet rs, int row) throws SQLException {  
	        	Game g=new Game();  
	            g.setId(rs.getInt(1)); 
	            g.setGameDate(rs.getString(2)); 
	            g.setGameYearDate(rs.getString(3)); 
	            g.setKind(rs.getString(4)); 
	            g.setJackpot(rs.getFloat(5)); 
	            g.setWinner(rs.getString(6)); 
	            return g;  
	        }  
	    });  
	}  
	
	public List<Prediction> getPrediction(){  
	    return template.query("select DATE_FORMAT(date, \"%d-%m-%Y\"), gamer, prediction, biorhythmP, biorhythmE, biorhythmI, "
	    		+ "predictionPerc from dailyPrediction order by predictionPerc desc",new RowMapper<Prediction>(){  
	        public Prediction mapRow(ResultSet rs, int row) throws SQLException {  
	        	Prediction p=new Prediction();  
	            p.setPredictionDate(rs.getString(1)); 
	            p.setGamer(rs.getString(2)); 
	            p.setPrediction(Math.round(rs.getFloat(3)*100.0)/100.0); 
	            p.setBiorhythmP(Math.round((100*rs.getFloat(4))*100.0)/100.0); 
	            p.setBiorhythmE(Math.round((100*rs.getFloat(5))*100.0)/100.0); 
	            p.setBiorhythmI(Math.round((100*rs.getFloat(6))*100.0)/100.0); 
	            p.setPredictionPerc(Math.round(rs.getFloat(7)*100.0)/100.0); 
	            return p;  
	        }  
	    });  
	} 
	
	public Game getGameById(int id){  
	    String sql = "select id,DATE_FORMAT(date, \"%d-%m-%Y\") as gameDate, kind, bet, reentry, ongoing, gamers, "
	    		+ "reentersAngelo, reentersCo, reentersKatia, reentersMario, reentersMauro, reentersRenzo, reentersKarmen,"
	    		+ "reentersGuest1, reentersGuest2, reentersGuest3, winner, jackpot from games where id = ?";
	    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Game>(Game.class)); 
	}

	public int deleteGame(int id){  
	    String sql="delete from games where id="+id+"";  
	    return template.update(sql);  
	} 
	
	public List<Game> getChartGamesByYear(String year){  
		return template.query("select kind,bet,reentry,gamers,reentersAngelo,reentersCo,reentersKatia," 
				+ "reentersMario,reentersMauro,reentersRenzo,reentersKarmen,reentersGuest1,reentersGuest2," 
				+ "reentersGuest3,winner,jackpot from games where year(date) = ?",new Object[] {year},new RowMapper<Game>(){  
	        public Game mapRow(ResultSet rs, int row) throws SQLException {  
	        	Game g=new Game();  
	            g.setKind(rs.getString(1)); 
	            g.setBet(rs.getFloat(2)); 
	            g.setReentry(rs.getFloat(3)); 
	            g.setGamers(rs.getString(4)); 
	            g.setReentersAngelo(rs.getInt(5)); 
	            g.setReentersCo(rs.getInt(6)); 
	            g.setReentersKatia(rs.getInt(7)); 
	            g.setReentersMario(rs.getInt(8)); 
	            g.setReentersMauro(rs.getInt(9)); 
	            g.setReentersRenzo(rs.getInt(10)); 
	            g.setReentersKarmen(rs.getInt(11)); 
	            g.setReentersGuest1(rs.getInt(12)); 
	            g.setReentersGuest2(rs.getInt(13)); 
	            g.setReentersGuest3(rs.getInt(14)); 
	            g.setWinner(rs.getString(15)); 
	            g.setJackpot(rs.getFloat(16)); 
	            return g;  
	        }
	    });
	}  
	

	public List<Game> getChartGames(){  
		return template.query("select kind,bet,reentry,gamers,reentersAngelo,reentersCo,reentersKatia,"  
				+ "reentersMario,reentersMauro,reentersRenzo,reentersKarmen,reentersGuest1,reentersGuest2,"  
				+ "reentersGuest3,winner,jackpot from games",new RowMapper<Game>(){  
	        public Game mapRow(ResultSet rs, int row) throws SQLException {  
	        	Game g=new Game();  
	            g.setKind(rs.getString(1)); 
	            g.setBet(rs.getFloat(2)); 
	            g.setReentry(rs.getFloat(3)); 
	            g.setGamers(rs.getString(4)); 
	            g.setReentersAngelo(rs.getInt(5)); 
	            g.setReentersCo(rs.getInt(6)); 
	            g.setReentersKatia(rs.getInt(7)); 
	            g.setReentersMario(rs.getInt(8)); 
	            g.setReentersMauro(rs.getInt(9)); 
	            g.setReentersRenzo(rs.getInt(10)); 
	            g.setReentersKarmen(rs.getInt(11)); 
	            g.setReentersGuest1(rs.getInt(12)); 
	            g.setReentersGuest2(rs.getInt(13)); 
	            g.setReentersGuest3(rs.getInt(14)); 
	            g.setWinner(rs.getString(15)); 
	            g.setJackpot(rs.getFloat(16)); 
	            return g;  
	        }
	    });
	}  
	
	public void sendTelegramNotification(Game g, String tokenValue, String chatIdValue){  
		
    	String urlString = "https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s";

    	String apiToken = tokenValue;
    	String chatId = chatIdValue;
    	String winner = g.getWinner();
    	if(winner.equals("Angelo")){
    		winner = "The King";
    	}
    	String sciabaladaURL = ServletUriComponentsBuilder.fromCurrentRequest().toUriString().replace("/save","");
    	String text = "Nuova Partita Registrata%0AData: " + g.getGameDate() + "%0AWinner: " + winner + "%0AJackpot: " + g.getJackpot() + " euro%0A" + sciabaladaURL +"/listGamesByYear/" + g.getGameDate().substring(0,4);

    	urlString = String.format(urlString, apiToken, chatId, text);

        try {
            URL url = new URL(urlString);
            URLConnection conn = url.openConnection();
            InputStream is = new BufferedInputStream(conn.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	public List<Game> getCovid19Data(){  
//		return template.query("select bet,gamers,winner from games where date > '2020-03-02'",new RowMapper<Game>(){  
		return template.query("(select bet,gamers,winner from games where date > '2020-03-02' and date < '2020-06-19') "
				+ "union all "
				+ "(select bet,gamers,winner from games where date > '2020-06-18' and (bet = 1 or bet = 2 or bet =4))",new RowMapper<Game>(){  	
			
	        public Game mapRow(ResultSet rs, int row) throws SQLException {  
	        	Game g=new Game();  
	            g.setBet(rs.getFloat(1)); 
	            g.setGamers(rs.getString(2)); 
	            g.setWinner(rs.getString(3)); 
	            return g;  
	        }
	    });
	}  

}  