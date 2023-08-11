import math as mt 
from datetime import date, datetime

def calculate_biorhythms( gamer, date, kind):
    birthDate = get_gamer_birthDate ( gamer )
    delta = date - birthDate
    days = delta.days
    if ( kind == 'P'):
        cycle = 23
    elif ( kind == 'E'):
        cycle = 28
    elif ( kind == 'I'):
        cycle = 33
    biorhythms = mt.sin( mt.radians(360 * (days / cycle)));
    return biorhythms

def get_gamer_birthDate ( gamer ):
    if (gamer == "Angelo"):
        birthDateString = "30-06-1968";
    elif (gamer == "Co"):
        birthDateString = "07-01-1971";
    elif (gamer == "Katia"):
        birthDateString = "10-07-1971";
    elif (gamer == "Mario"):
         birthDateString = "26-05-1968";
    elif (gamer == "Mauro"):
        birthDateString = "22-05-1968";
    elif (gamer == "Renzo"):
        birthDateString = "18-10-1964";
    birthDate = get_date_from_string(birthDateString)
    return birthDate

def get_date_from_string( dateString ):
    day, month, year = map(int, dateString.split('-'))
    date = datetime(year, month, day).date()
    return date


