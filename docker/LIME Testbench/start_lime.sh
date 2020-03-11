xhost +
docker stop lime && docker rm lime 
docker run --name lime -it -d -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix lime:v0.1
docker exec -it lime bash
