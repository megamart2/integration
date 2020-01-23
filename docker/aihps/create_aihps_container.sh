xhost +
docker run --name aihps -it -d -e DISPLAY=:0 -v /home/Xilinx:/opt/Xilinx -v /tmp/.X11-unix:/tmp/.X11-unix aihps:v0.1 bash
