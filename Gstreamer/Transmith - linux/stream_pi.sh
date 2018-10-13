#!/bin/bash
clear
gst-launch-1.0 -v v4l2src device=/dev/video0 ! omxh264enc ! h264parse ! rtph264pay ! udpsink host=192.168.1.2 port=7000



