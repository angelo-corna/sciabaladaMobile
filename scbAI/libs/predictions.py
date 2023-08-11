import db    
from datetime import date, datetime

import ai as ai 
import biorhythms as bio

def calculate_prediction( gamer, predictionDate):

    #create training dataset
    training_ds = db.create_training_dataset( gamer ) 

    #training 
    w1, w2, w3, w4, b = ai.training(training_ds, gamer)

    #calculate prediction
    # calculate predictionDate biorhythms
    biorhythmP = bio.calculate_biorhythms( gamer, predictionDate, 'P' )
    biorhythmE = bio.calculate_biorhythms( gamer, predictionDate, 'E' )
    biorhythmI = bio.calculate_biorhythms( gamer, predictionDate, 'I' )     
    # calculate dayOfTheWeek predictionDate
    #dt = datetime.fromisoformat(predictionDate.isoformat())
    dt = datetime.strptime(predictionDate.isoformat(), "%Y-%m-%d")
    dayOfTheWeek = dt.weekday() * 0.1

    prediction = biorhythmP * w1 + biorhythmE *w2 + biorhythmI *w3 + dayOfTheWeek * w4 + b
    return prediction, biorhythmP, biorhythmE, biorhythmI, dayOfTheWeek
    