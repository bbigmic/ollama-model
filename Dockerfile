# Pobranie oficjalnego obrazu Ollama
FROM ollama/ollama

# Skopiowanie skryptu startowego
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Eksponowanie portu Ollama
ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434


# Użycie skryptu startowego
ENTRYPOINT ["/start.sh"]
