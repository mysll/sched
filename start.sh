#!/bin/bash

# 将 crontab 配置复制到系统 crontab 目录
cp /app/config/crontab /etc/cron.d/sched-cron

# 给予 crontab 文件执行权限
chmod 0644 /etc/cron.d/sched-cron

# 应用 crontab 文件
crontab /etc/cron.d/sched-cron

# 创建日志文件
touch /var/log/cron.log

# 启动 cron 服务并输出日志
cron && tail -f /var/log/cron.log