# Pobranie oficjalnego obrazu Ollama
FROM ollama/ollama

# Pobranie modelu przed uruchomieniem
RUN ollama pull mistral

# Eksponowanie portu Ollama
EXPOSE 11434

# Uruchomienie serwera Ollama
CMD ["ollama", "serve"]
