#!/bin/sh
set -e  # Zatrzymuje skrypt, jeśli coś pójdzie nie tak

echo "🚀 Sprawdzam, czy serwer Ollama już działa..."
if pgrep -x "ollama" > /dev/null; then
    echo "⚠️ Ollama już działa. Zatrzymuję..."
    killall ollama || true
    sleep 2
fi

echo "🔍 Sprawdzam dostępne modele..."
if ! ollama list | grep -q "mistral"; then
    echo "⬇️ Model 'mistral' nie jest dostępny. Pobieram..."
    ollama pull mistral
else
    echo "✅ Model 'mistral' już jest pobrany."
fi

echo "🚀 Uruchamiam serwer Ollama..."
exec ollama serve  # Uruchamiamy Ollama w pierwszym planie
