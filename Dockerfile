# Pobieramy oficjalny obraz Ollama
FROM ollama/ollama:latest

# Ustawiamy zmienną środowiskową, aby Ollama działał na wszystkich interfejsach
ENV OLLAMA_HOST=0.0.0.0:11434

# Pobieramy domyślny model (np. mistral)
RUN ollama pull mistral

# Kopiujemy plik startowy
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Otwieramy port do nasłuchiwania API
EXPOSE 11434

# Uruchamiamy startowy skrypt
CMD ["/start.sh"]
