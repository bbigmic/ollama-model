# Pobranie oficjalnego obrazu Ollama
FROM ollama/ollama

# Eksponowanie portu Ollama
EXPOSE 11434

# Skrypt startowy: najpierw uruchamiamy Ollama, potem pobieramy model
ENTRYPOINT ["/bin/sh", "-c", "
    ollama serve &  # Start serwera w tle
    sleep 2         # Poczekaj, aż serwer się uruchomi
    ollama pull mistral  # Pobierz model
    wait -n         # Czekaj, aż którykolwiek proces się zakończy
"]
