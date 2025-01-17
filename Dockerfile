# Pobranie oficjalnego obrazu Ollama
FROM ollama/ollama:latest

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie skryptu startowego
COPY start.sh /app/start.sh

# Nadanie uprawnień do wykonywania skryptu
RUN chmod +x /app/start.sh

# Uruchomienie skryptu przez sh
CMD ["sh", "/app/start.sh"]
