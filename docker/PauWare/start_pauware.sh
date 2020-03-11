xhost +
docker rm pauware 
docker run --name pauware -it -d -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix pauware:v0.1
