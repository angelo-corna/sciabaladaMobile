import sys
from datetime import date, datetime
import pandas as pd


sys.path.append('libs')
import libs.predictions as pred 
import libs.biorhythms as bio 
import libs.db as db 

#get parameters
script_name, predictionDate = sys.argv
if (predictionDate.lower() == "current"):
    date = date.today()
else:
    date = bio.get_date_from_string( predictionDate )

print("\nStarting infusing AI on sciabalada");

predictionsList = []

for i in range(6):
    if ( i == 0 ):    
        gamer = "Angelo"
    elif ( i == 1 ):    
        gamer = "Co"
    elif ( i == 2 ):    
        gamer = "Katia"
    elif ( i == 3 ):    
        gamer = "Mario"
    elif ( i == 4 ):    
        gamer = "Mauro"
    elif ( i == 5 ):    
        gamer = "Renzo"

    print('\nCalculating ' + gamer + ' Winning Percentage Predictions for ' + date.strftime("%d %b %Y") )
    prediction, biorhythmP, biorhythmE, biorhythmI, dayOfTheWeek = pred.calculate_prediction( gamer, date )
    print('Prediction: ' + str(prediction) + ' P:' + str(round(100*biorhythmP,2)) + '% E:' + str(round(100*biorhythmE,2)) 
          + '% I:' + str(round(100*biorhythmI,2)) + '% day: ' + str(round(dayOfTheWeek,2)) )
    predictionsList.append([date, gamer, prediction, biorhythmP, biorhythmE, biorhythmI ])

predictionDtaFrame = pd.DataFrame(predictionsList, columns=['date', 'gamer', 'prediction', 'biorhythmP', 'biorhythmE', 'biorhythmI' ])


predictionTotal = predictionDtaFrame[predictionDtaFrame['prediction']>0]['prediction'].sum()
predictionDtaFrame['predictionPerc'] = ( 100 * predictionDtaFrame['prediction']/predictionTotal ).where( predictionDtaFrame['prediction'] > 0, 0 )

print( predictionDtaFrame.sort_values(by=['prediction'], ascending=False) )

#save data yo db
db.save_data_to_db ( predictionDtaFrame )

