#!/bin/sh
set -e  # Zatrzymuje skrypt, jeśli coś pójdzie nie tak

echo "🚀 Uruchamiam serwer Ollama w tle..."
if pgrep -x "ollama" > /dev/null; then
  echo "⚠️ Ollama już działa. Nie uruchamiam ponownie."
else
  ollama serve &  # Startujemy serwer w tle
  sleep 5  # Czekamy chwilę na poprawne uruchomienie
fi

echo "🔍 Sprawdzam dostępne modele..."
if ! ollama list | grep -q "mistral"; then
  echo "⬇️ Model 'mistral' nie jest dostępny. Pobieram..."
  ollama pull mistral
else
  echo "✅ Model 'mistral' już jest pobrany."
fi

echo "🎯 Uruchamiam Ollama w trybie pierwszoplanowym..."
exec ollama serve  # Uruchamiamy Ollama na pierwszym planie
