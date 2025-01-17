#!/bin/sh
set -e  # Zatrzymuje skrypt w razie błędu

echo "🔍 Sprawdzam dostępne modele..."
ollama list || echo "⚠️ Błąd: Nie można pobrać listy modeli"

echo "⬇️ Pobieram model mistral..."
until ollama pull mistral; do
  echo "❌ Nie udało się pobrać modelu. Ponawiam próbę za 5 sekund..."
  sleep 5
done

echo "✅ Model pobrany, oto lista dostępnych modeli:"
ollama list

echo "🚀 Uruchamiam serwer Ollama..."
exec ollama serve
