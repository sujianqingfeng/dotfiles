# 在 /usr/lib/systemd/system 下新建服务脚本

# 添加或修改配置文件后，需要重新加载
systemctl daemon-reload

# 设置自启动

systemctl enable kmonad.service
