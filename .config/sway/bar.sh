while true
do
  date=$(date +'%A, %x')
  time=$(date +'%H:%M:%S %p')
  vol=$(pamixer --get-volume)

  echo "Vol: $vol% | $date | $time"

  sleep 1
done
