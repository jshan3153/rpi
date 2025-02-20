#_*_ coding: utf-8 _x_
#_*_ codnign:euc-kr _x_

from flask import Flask, request, jsonify, render_template, Response, jsonify
import os, ntpath
import json
import subprocess
import time
import signal
import sys

lat1 = 0.0
lon1 = 0.0

lat2 = 0.0
lon2 = 0.0

dist1 = 0.0
dist2 = 0.0
diff = 0.0
dir = ''

spd = 0
bat = 0.0
rpm = 0
cnt = 0

app = Flask(__name__)

# 서버 종료 시 발생할 신호 처리
def handle_exit_signal(signal, frame):
    print("Shutting down gracefully...")
    sys.exit(0)

signal.signal(signal.SIGINT, handle_exit_signal)  # SIGINT (Ctrl+C) 시 처리

# 업로드될 파일의 저장 경로 설정
UPLOAD_FOLDER = 'uploads'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def generate_unique_filename(filename):
    #print(f"{filename}")
    # 파일 확장자 추출
    name, ext = os.path.splitext(filename)
    counter = 1
    
    # 중복된 파일 이름 처리 (이미 같은 이름의 파일이 있으면 번호를 붙임)
    new_filename = filename
    while os.path.exists(os.path.join(app.config['UPLOAD_FOLDER'], new_filename)):
        new_filename = f"{name}({counter}){ext}"
        counter += 1
    
    #print(f"{new_filename}")
    return new_filename

# 파일 수신 및 저장을 위한 엔드포인트
@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    
    # 텍스트 파일만 받기 위해 확장자 검사
    if not file.filename.endswith('.txt'):
        return jsonify({'error': 'Only text files are allowed'}), 400
    
    # 고유한 파일 이름 생성
    unique_filename = generate_unique_filename(file.filename)
    #print(f"new-{new_filename}")
    # 파일 저장
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
    file.save(file_path)
    
    return jsonify({'message': 'File successfully uploaded', 'file': unique_filename}), 200

@app.route('/stream_obd')
def stream_obd():
    def generate():
        while True:
            obd_data = f"SPEED: {spd}[km/h], BAT: {bat:.2f}[V], RPM: {rpm}[rpm] CNT: {cnt}[times]"
            yield f"data: {obd_data}\n\n"
            time.sleep(1)
    return Response(generate(), mimetype='text/event-stream')

@app.route('/obd_monitor')
def obd_monitor():
    return render_template('obd_monitor1.html')

@app.route('/pos1', methods = ['POST'])
def pos1():
    data = request.json
    global lat1
    global lon1
    lat1 = float(data['lat'])
    lon1 = float(data['lon'])

    print ("lat %f, lon %f" % (lat1, lon1))
    
    return 'SET lat&lon1'

@app.route('/pos2', methods = ['POST'])
def pos2():
    data = request.json
    global lat2
    global lon2
    lat2 = float(data['lat'])
    lon2 = float(data['lon'])

    print ("lat %f, lon %f" % (lat2, lon2))
    
    return 'SET lat&lon2'

@app.route('/getobd', methods = ['GET', 'POST'])
def getobd():
    if request.method == 'GET':
        return "SPEED: %d[km/h], BAT: %.2f[V], RPM: %d[rpm] CNT: %d[times]" %(spd, bat, rpm, cnt)

@app.route('/obd', methods = ['POST'])
def obd():
    data = request.json
    global spd
    spd = int(data['spd'])
    global bat 
    bat = float(data['bat'])
    global rpm
    rpm = int(data['rpm'])
    global cnt
    cnt = int(data['cnt'])
    return "ok" #"SPEED: %d[km/h], ACC: %d[%%], RPM: %d[rpm]" %(spd, acc, rpm)

@app.route('/getdist', methods = ['GET', 'POST'])
def getdist():
    if request.method == 'GET':
        return "DIST1: %.2f[m], DIST2: %.2f[m], DIFF: %.2f[m], DIR: %s" %(dist1, dist2, diff, dir)

@app.route('/dist', methods = ['POST'])
def dist():
    data = request.json
    global dist1
    dist1 = float(data['dist1'])
    global dist2
    dist2 = float(data['dist2'])
    global diff
    diff = float(data['diff'])
    global dir
    dir = data['dir']
    return "ok"

def set_gps(pos):
    global gps_pos
    gps_pos = pos
    print(gps_pos, pos)
    return 'set_gps'
    
def get_gps():
   # print('get_pos %f %f %f %f' %(lat1, lon1, lat2, lon2))
    print("get_pos:",format(lat1, ".1f"))
    return lat1, lon1, lat2, lon2

def clr_gps():
    global lat1
    global lon1
    global lat2
    global lon2
    
    lat1 = 0.0
    lon1 = 0.0

    lat2 = 0.0
    lon2 = 0.0
    
    return 'clear.'

def clr_obd():
    global spd
    global bat
    global rpm
    global cnt
    
    spd = 0
    bat = 0.0
    rpm = 0
    cnt = 0
    
    return 'clear.'

@app.route('/getpos', methods = ['GET', 'POST'])
def readSensors1():
    if request.method == 'GET':
        return '@%0.8f,%0.8f,%0.8f,%0.8f,'%(lat1,lon1,lat2,lon2)
   

@app.route('/clrpos', methods = ['GET', 'POST'])
def clrSensors():
    if request.method == 'POST':
        return clr_gps()

@app.route('/clrobd', methods = ['GET', 'POST'])
def clrOBDSensors():
    if request.method == 'POST':
        return clr_obd()

@app.route('/') #Default Web Address Access Page
def welcome():
    return 'Welcome Web Server'


@app.route('/index1') #template html
def index1():
    return render_template('index1.html')

@app.route('/index2') #template html
def index2():
    return render_template('index2/index2.html')

if __name__=='__main__': #Run Web Server
    app.run(host='0.0.0.0', port=5000, debug=True)
    # run_simple에서 SO_REUSEADDR 설정
    #run_simple('0.0.0.0', 5000, app, use_reloader=True, threaded=True, options={'SO_REUSEADDR': 1})


