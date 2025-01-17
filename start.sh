#!/bin/sh
set -e  # Zatrzymuje skrypt, jeśli coś pójdzie nie tak

echo "🚀 Uruchamiam serwer Ollama w tle..."
ollama serve &  # Startujemy serwer w tle

echo "⏳ Czekam na uruchomienie Ollama..."
sleep 5  # Czekamy chwilę, aby serwer się poprawnie uruchomił

echo "🔍 Sprawdzam dostępne modele..."
AVAILABLE_MODELS=$(ollama list | grep "mistral" || true)

if [ -z "$AVAILABLE_MODELS" ]; then
  echo "⬇️ Model 'mistral' nie jest dostępny. Pobieram..."
  ollama pull mistral
else
  echo "✅ Model 'mistral' już jest pobrany."
fi

echo "🎯 Restartuję serwer Ollama..."
killall ollama || true  # Wyłączamy Ollama uruchomionego w tle, jeśli istnieje
exec ollama serve  # Restartujemy Ollama na pierwszym planie
