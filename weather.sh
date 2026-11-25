#!/bin/bash
set -eo pipefail

city="$1"

data=$(curl -fsS --max-time 30 "https://wttr.in/$city?format=j1")

temp=$(echo "$data" | jq -r '.current_condition[0].temp_C')
humidity=$(echo "$data" | jq -r '.current_condition[0].humidity')

echo '<meta charset="UTF-8">'
echo "<h1>City: $city</h1>"
echo "<p>Temperature: $temp °C</p>"
echo "<p>Humidity: $humidity%</p>"
echo "<p>Updated: $(date '+%d.%m.%Y %H:%M:%S')</p>"
