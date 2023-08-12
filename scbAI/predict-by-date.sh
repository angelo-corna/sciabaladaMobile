#!/bin/bash 

. /root/.bashrc

. /home/pi/scbai-venv/bin/activate
cd /home/pi/scbAI
python3 predict-by-date.py $1