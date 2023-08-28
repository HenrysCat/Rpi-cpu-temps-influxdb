#!/bin/bash

# InfluxDB settings
INFLUXDB_URL="http://your-influxdb-server:8086"
TOKEN="your-influxdb-token"
ORG="your-organization"
BUCKET="your-bucket-name"

while true; do
    # Get CPU temperature
    temperature=$(vcgencmd measure_temp | sed 's/temp=\(.*\)'\''C/\1/')

    # Prepare data point in InfluxDB line protocol format
    data="cpu_temperature,host=raspberry-pi temperature=$temperature"

    # Send data to InfluxDB
    response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$INFLUXDB_URL/api/v2/write?org=$ORG&bucket=$BUCKET" \
                -H "Authorization: Token $TOKEN" -H "Content-Type: text/plain" --data "$data")

    if [[ $response -eq 204 ]]; then
        echo "Temperature: ${temperature}°C | Data sent to InfluxDB"
    else
        echo "Error sending data to InfluxDB. Response code: $response"
    fi

    sleep 60  # Send data every 60 seconds
done
