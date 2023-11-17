# 在 /usr/lib/systemd/system 下新建服务脚本

# 添加或修改配置文件后，需要重新加载
systemctl daemon-reload

# 设置自启动，实质就是在 /etc/systemd/system/multi-user.target.wants/ 添加服务文件的链接
systemctl enable xxxxx
