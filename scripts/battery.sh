perc=$(exec upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep -o "[0-9].*%")
time=$(exec upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep -o "[0-9].*hours")

echo "battery: $perc, time left: $time"
