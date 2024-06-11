# Dockerfile
FROM python:3.9-slim

# 安装 cron
RUN apt-get update && \
    apt-get install -y cron && \
    rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 复制启动脚本到工作目录
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# 复制并安装依赖
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# 运行启动脚本
CMD ["/app/start.sh"]