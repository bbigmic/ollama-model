# Pobranie oficjalnego obrazu Ollama
FROM ollama/ollama

# Skopiowanie skryptu startowego
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Eksponowanie portu Ollama
EXPOSE 11434

# Użycie skryptu startowego
ENTRYPOINT ["/start.sh"]
