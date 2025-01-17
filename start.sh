#!/bin/sh
set -e  # Zatrzyma skrypt, jeśli coś pójdzie nie tak

# Pobierz model przed startem serwera
ollama pull mistral || echo "Błąd pobierania modelu mistral"

# Sprawdź, czy model jest poprawnie pobrany
ollama list || echo "Błąd: Model nie jest dostępny"

# Uruchom serwer Ollama
ollama serve
