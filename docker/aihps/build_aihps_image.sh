#Download Vivado 
echo 'Download Vivado 2017.4 for Linux from this link: https://www.xilinx.com/member/forms/download/xef-vivado.html?filename=Xilinx_Vivado_SDK_Web_2017.4_1216_1_Lin64.bin'
echo 'You need to register within the XILINX site before getting access to the download page'
echo 'Save the download file in the same directory you are executing this script'
read -n 1 -s -r -p 'Press any key to continue once the downloading has finished'

docker build -t aihps:v0.1 .
