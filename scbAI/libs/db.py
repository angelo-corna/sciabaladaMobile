import mysql.connector
from jproperties import Properties
import os
from sqlalchemy import create_engine

def get_connection():
    # get database data
    configs = Properties()
    with open('config/db.properties', 'rb') as config_file:
        configs.load(config_file)
    db_hostname = configs.get("HOSTNAME").data    
    db_port = configs.get("PORT").data  
    db_name = configs.get("DBNAME").data  
    db_username = configs.get("USERNAME").data  
    db_password = os.getenv('SCB_DB_PASSWORD')
    # create connection
    cnx = mysql.connector.connect(user=db_username, password=db_password, host=db_hostname,port=db_port, database=db_name)
    return cnx

def save_data_to_db( predictionDtaFrame ):
    # get database data
    configs = Properties()
    with open('config/db.properties', 'rb') as config_file:
        configs.load(config_file)
    db_hostname = configs.get("HOSTNAME").data    
    db_port = configs.get("PORT").data  
    db_name = configs.get("DBNAME").data  
    db_username = configs.get("USERNAME").data  
    db_password = os.getenv('SCB_DB_PASSWORD')
    # create engine
    engine = create_engine("mysql+pymysql://{user}:{pw}@{hostname}:{port}/{db}"
        .format(user=db_username,
            pw=db_password,
            hostname=db_hostname,
            port=db_port,
            db=db_name))
    #save data to db
    predictionDtaFrame.to_sql( 'dailyPrediction', engine, if_exists='replace', index = False )

def get_cursor(cnx):
    #create cursor
    cursor = cnx.cursor()
    return cursor

def close_cursor( cursor ):    
    #close cursor
    cursor.close()

def close_connection(cnx):
    # close connection
    cnx.close()

def create_training_dataset( gamer ):
    training_ds = []
    cnx = get_connection()
    cursor = get_cursor( cnx )
    query = "select date,count(date) as games,sum(case winner when '" + gamer + "' then 1 else 0 end) winned from games where gamers like '%" + gamer + "%' and kind='N' and date > '2023-01-01' group by date;";
    cursor.execute(query)
    for (date, games, winned) in cursor:
        winPerc = (winned/games)*100;
        training_ds_entry=[date, winPerc]
        training_ds.append( training_ds_entry )
    close_cursor(cursor)
    close_connection(cnx)
    return training_ds 

def create_training_dataset_all( gamer ):
    training_ds = []
    cnx = get_connection()
    cursor = get_cursor( cnx )
    #query = "select date,count(date) as games,sum(case winner when '" + gamer + "' then 1 else 0 end) winned from games where gamers like '%" + gamer + "%' and kind='N' and date > '2022-01-01' group by date;";
    query = "select date,count(date) as games,sum(case winner when '" + gamer + "' then 1 else 0 end) winned from games \
    where gamers like '%" + gamer + "%' and kind='N' and gamers not like '%Guest1%' and gamers not like '%Guest2%' \
    and gamers not like '%Guest3%' and gamers not like '%Karmen%' group by date"
    cursor.execute(query)
    for (date, games, winned) in cursor:
        winPerc = (winned/games)*100;
        if ( str(date) != "None"):
            #print(str(date) + " - " + str(winPerc))
            training_ds_entry=[date, winPerc]
            training_ds.append( training_ds_entry )
    close_cursor(cursor)
    close_connection(cnx)
    return training_ds 


