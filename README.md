# Rpi-cpu-temps-influxdb
Send Raspberry pi cpu temps to influxdb every 60 seconds

Place 'temps.sh' in your home directory, '/home/user/temps.sh'

Then make executable with 'chmod +x temps.sh'

Now open a terminal andd type 'sudo nano /etc/rc.local' and add the line '/home/user/temps.sh' just above the line 'exit 0'

reboot and the script will run every 60 seconds.
