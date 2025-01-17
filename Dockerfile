# Pobranie oficjalnego obrazu Ollama
FROM ollama/ollama

# Eksponowanie portu Ollama
EXPOSE 11434

# Pobranie modelu przed startem serwera i uruchomienie Ollama
ENTRYPOINT ["sh", "-c", "ollama pull mistral && ollama serve"]
