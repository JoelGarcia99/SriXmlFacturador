FROM python:3.9.19-slim-bullseye

WORKDIR /app

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . .
COPY entrypoint.sh ./

EXPOSE 8000

RUN chmod +x /app/entrypoint.sh

# CMD ["uvicorn","main:app","--reload"]

ENTRYPOINT ["/app/entrypoint.sh"]
