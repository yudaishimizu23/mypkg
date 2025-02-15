#1/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build

source $dir/.bashrc

timeout 10 ros2 launch mypkg1 talk_listen.launch.py > /tmp/mypkg1.log

cat /tmp/mypkg1.log |
grep 'Listen: 10' 
