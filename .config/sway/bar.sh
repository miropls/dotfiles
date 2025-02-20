while true
do
  date=$(date +'%A, %b %d')
  time=$(date +'%I:%M:%S %p')
  vol=$(pamixer --get-volume)

  echo "Vol: $vol% | $date | $time"

  sleep 1
done
