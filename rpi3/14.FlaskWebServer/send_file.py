import requests


file_path = 'textfile1.txt'
url = 'http://192.168.0.107:5000/upload'

# 텍스트 파일 열기
with open(file_path, 'rb') as f:
    files = {'file': (file_path, f)}
    
    # 서버로 파일 업로드 요청
    response = requests.post(url, files=files)
    print(response.json())

'''
def send_text_file(file_path, server_url):
    with open(file_path, 'r') as file:
        file_content = file.read()
    
    files = {'file': ('textfile.txt', file_content)}
    response = requests.post(server_url, files=files)
    
    if response.status_code == 200:
        print("파일이 성공적으로 전송되었습니다.")
    else:
        print("파일 전송 실패:", response.status_code)

# 예시 사용
server_url = 'http://192.168.0.107:5000/upload'
file_path = 'textfile.txt'
send_text_file(file_path, server_url)

'''
