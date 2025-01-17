#!/bin/sh
set -e  # Zatrzymuje skrypt, jeśli coś pójdzie nie tak

echo "🚀 Sprawdzam, czy Ollama już działa..."
if pgrep -x "ollama" > /dev/null; then
  echo "⚠️ Ollama już działa. Nie uruchamiam ponownie."
else
  echo "🚀 Uruchamiam serwer Ollama w tle..."
  ollama serve &  # Startujemy serwer w tle
  sleep 5  # Czekamy chwilę, aby serwer się poprawnie uruchomił
fi

echo "🔍 Sprawdzam dostępność modelu 'mistral'..."
if [ ! -f ~/.ollama_mistral_downloaded ]; then
  echo "⬇️ Model 'mistral' nie był wcześniej pobrany. Pobieram..."
  ollama pull mistral
  touch ~/.ollama_mistral_downloaded  # Tworzymy plik flagowy
  echo "✅ Model 'mistral' został pobrany i zapisany w systemie."
else
  echo "✅ Model 'mistral' był już wcześniej pobrany. Pomijam pobieranie."
fi

echo "🎯 Uruchamiam Ollama w trybie pierwszoplanowym..."
exec ollama serve  # Uruchamiamy Ollama na pierwszym planie
