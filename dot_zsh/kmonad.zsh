function disable_laptop(){
  nohup sudo kmonad /home/hens/.config/kmonad/disable_laptop.kbd 2>&1 &
  echo "disable laptop keyboard"
}

funciton enable_laptop(){
  ps -aux | grep 'kmonad/disable_laptop.kbd' | awk '{print $2}'|xargs sudo  kill -9
  echo "enable laptop keyborad"
}

