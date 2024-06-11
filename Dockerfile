# Dockerfile
FROM python:3.9-slim-bullseye

# 安装 cron
RUN apt-get update && apt-get install -y cron vim

# 创建工作目录
WORKDIR /app

# 复制启动脚本到工作目录
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# 复制并安装依赖
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
RUN sed -i 's/session\s*required\s*pam_loginuid\.so/#session required pam_loginuid\.so/g' /etc/pam.d/cron
# 运行启动脚本
CMD ["/app/start.sh"]