# !/bin/bash
read int < aknomber.txt #< akno.txt
echo "$int"
#read int  >> akno.txt
echo 'OK'
case $int in
  1 | 1-1)      x=1  ; lim=49  ;;
  2 | 1-2)     x=49  ; lim=99  ;;
  3 | 2-1)       x=99 ; lim=149  ;;
  4 | 2-2)     x=149  ; lim=199 ;;
  5 | 3-1)        x=199 ; lim=249  ;;
  6 | 3-2)     x=249 ; lim=299 ;;
  7 | 4-1)        x=299 ; lim=349  ;;
  8 | 4-2)     x=349 ; lim=399 ;;
  9 | 5-1)        x=399 ; lim=449  ;;
  10 | 5-2)      x=449  ; lim=499 ;;
  11 | 5-11)      x=500  ; lim=549 ;;
  *)
    echo -e "Ne vveden/Ne korekten nomer AKKA \n"
    ./badfix.sh
    ;;
esac


i=1
while [ $i -le 5 ]
do
x=$(( $x + 1 ))
echo "schetchekSA: $x"
rclone backend set osnova1: -o service_account_file="/root/AutoRclone/accounts/$(( $x )).json";
fusermount -uz /osnova1
screen -dmS mount1 rclone mount osnova1: /osnova1 --allow-non-empty --daemon 
sleep 3600

if [ $x = $lim ]; then x=$(( $x - 49 )) ; fi
done
 
