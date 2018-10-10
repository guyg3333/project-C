#!/bin/bash
clear

gst-launch-1.0 udpsrc port=5000 ! application/x-rtp, clock-rate=90000,payload=96 ! rtph263pdepay  ! ffdec_h264 ! xvimagesink


gst-inspect-1.0

gst-launch-1.0 v4l2src ! xvimagesink //test the camera



device=/dev/video0

qv4l2 --device=/dev/video0 //test the camera


sudo gst-launch-1.0 v4l2src ! autovideosink


//-----//
sudo gst-launch-1.0 udpsrc port=5000 ! "application/x-rtp,media=(string)video,clock-rate=(int)90000,encoding-name=(string)H264" ! rtpjitterbuffer mode=slave latency=200 drop-on-latency=true ! rtph264depay ! video/x-h264,width=640,height=480, framerate=30/1 ! avdec_h264 ! videoconvert ! glimagesink 


//--test---//
gst-launch-1.0 udpsrc port=5000 !  multiudpsink clients=127.0.0.1:5000,127.0.0.1:5004,192.168.2.15:2000
 




//--------
ssh pi@192.168.0.1

python -m serial.tools.list_ports

python -m serial.tools.list_ports -v


iptables -t nat -A PREROUTING -p udp -i eth0 -d 192.168.1.2 --dport 1003 -j DNAT --to-destination 192.168.1.2:1004



