   
# python:3.8の公式 image をベースの image として設定
FROM python:3.8-slim

# バッファを無効化
ENV PYTHONUNBUFFERED 1 

# 作業ディレクトリの作成
RUN mkdir /app

# 作業ディレクトリの設定
WORKDIR /app

RUN apt-get update && apt-get install -y git \
gcc \
libgl1-mesa-glx \
libglib2.0-0 \
libgtk2.0-dev \
libmariadb-dev

COPY requirements.txt .

# pipでrequirements.txtに指定されているパッケージを追加する
RUN pip install -r requirements.txt

COPY . .

CMD ["bash"]