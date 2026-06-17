FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /MusicPlayer

COPY . .

RUN chmod +x startup.sh

CMD ["bash", "startup.sh"]
