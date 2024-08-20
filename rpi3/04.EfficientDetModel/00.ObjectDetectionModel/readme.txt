1. https://github.com/tensorflow/examples/tree/master/lite/examples/object_detection/raspberry_pi 접속

2. Download the example files 에 있는 내용대로 실행

3. Run the example 실행하면 에러가 발생함.
	3.1 # ImportError: libcblas.so.3: cannot open shared object file: No such file or directory
		# you can fix it by installing an OpenCV dependency that is missing on your Raspberry Pi.
		위에 에러가 나오면 아래 명령어 실행
		$sudo apt-get install libatlas-base-dev
		
	3.2 $python3 -m pip install tflite-support==0.4.3


