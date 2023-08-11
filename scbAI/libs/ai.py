import math as mt    
import random as rd   
import biorhythms as bio
from datetime import date, datetime

#definizione della rete neurale
def RN(m1,m2,m3,m4,w1,w2,w3,w4,b):
    t=m1*w1+m2*w2+b 
    return sigmoide(t)

#calcolo della funzione sigmoide di un valore
def sigmoide(t):
    return 1/(1+mt.exp(-t))

#calcolo della derivata della funzione sigmoide
def sigmoide_p(t):
    return sigmoide(t)*(1-sigmoide(t))

#training 

def training ( dataset, gamer ):
    #imposto la stessa sequenza di numeri casuali ad ogni avvio del training
    rd.seed(1)

    w1=rd.random()
    w2=rd.random()
    w3=rd.random()
    w4=rd.random()
    b=rd.random()

    #iterazioni = 100000
    #learning_rate = 0.1

    iterazioni = 100000
    learning_rate = 0.1


    for i in range(iterazioni):
        #prendo un valore random del mio dataset
        ri = rd.randint(0,len(dataset)-1)
        point = dataset[ri]
        date = point[0]
        target = float(point[1])

        # calculate biorhythms
        biorhythmP = bio.calculate_biorhythms( gamer, date, 'P' )
        biorhythmE = bio.calculate_biorhythms( gamer, date, 'E' )
        biorhythmI = bio.calculate_biorhythms( gamer, date, 'I' )

        # get day of the week
        #dt = datetime.fromisoformat(date.isoformat())
        dt = datetime.strptime(date.isoformat(), "%Y-%m-%d")
        
        dayOfTheWeek = dt.weekday() * 0.1

        #calcolo la previsione in base ai due input (forward propagation)
        z = biorhythmP * w1 + biorhythmE *w2 + biorhythmI *w3 + dayOfTheWeek * w4 + b
        pred = sigmoide(z) 
        
        #calcolo l'errore quadratico
        cost = (pred -target)**2    
        
        #formula per il calcolo della derivata del costo rispetto a w1
        # [delta]costo/[delta]w1 = [delta]costo/[delta]p * [delta]p/[delta]t * [delta]t/[delta]w1
        # [delta]costo/[delta]p = 2(sigmoide([input1]w1+[input2]w2+[input3]w3+[input4]w4+b)-t) 
        # [delta]p/[delta]t = sigmoide([input1]w1+input2]w2+input3]w3+input4]w4+b)(1-sigmoide([input1]w1+input2]w2+input3]w3+input4]w4+b)) 
        # [delta]t/[delta]w1 = [input1]

        #calcolo la derivata del costo rispetto alla previsione
        # [delta]costo/[delta]p = 2(sigmoide([input1]w1+input2]w2+b)-t) 
        dcost_dpred = 2 * (pred - target)

        #calcolo la derivata parziale della previsione rispetto a z
        # [delta]p/[delta]t = sigmoide([input1]w1+input1]w2+b)(1-sigmoide([input1]w1+input1]w2+b)) 
        dpred_dz = sigmoide_p(z) 

        #calcolo la derivata parziale di z rispetto a w1,w2,w3,w4 e b
        # [delta]t/[delta]w1 = [input1]
        dz_dw1 = biorhythmP
        # [delta]t/[delta]w2 = [input2]
        dz_dw2 = biorhythmE
        # [delta]t/[delta]w2 = [input3]
        dz_dw3 = biorhythmI
        # [delta]t/[delta]w2 = [input4]
        dz_dw4 = dayOfTheWeek
        # [delta]t/[delta]b = 1
        dz_db = 1

        #calcolo la derivata del costo rispetto a z con la regola della catena (pezzo comune)
        dcost_dz = dcost_dpred * dpred_dz

        #calcolo la derivata del costo rispetto a w1, w2, w3, w4 e b (sempre con la regola della catena)
        dcost_dw1 = dcost_dz * dz_dw1            
        dcost_dw2 = dcost_dz * dz_dw2
        dcost_dw3 = dcost_dz * dz_dw3            
        dcost_dw4 = dcost_dz * dz_dw4
        dcost_db = dcost_dz * dz_db        

        #aggiorno pesi e bias 
        w1 = w1 - learning_rate * dcost_dw1
        w2 = w2 - learning_rate * dcost_dw2
        w3 = w3 - learning_rate * dcost_dw3
        w4 = w4 - learning_rate * dcost_dw4
        b = b - learning_rate * dcost_db
    
    return w1, w2, w3, w4, b 

  


