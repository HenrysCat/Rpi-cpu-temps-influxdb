# Rpi-cpu-temps-influxdb
Send Raspberry pi cpu temps to influxdb every 60 seconds
Place temps.sh in your home directory, /home/user/temps.sh
Then make executable with chmod +x temps.sh
Next type sudo nano /etc/rc.local and the line /home/user/temps.sh just above the line exit 0
