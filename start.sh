#!/bin/sh
set -e  # Zatrzymuje skrypt, jeśli coś pójdzie nie tak

echo "🚀 Uruchamiam serwer Ollama w tle..."
ollama serve &  # Startujemy serwer w tle

echo "⏳ Czekam na uruchomienie Ollama..."
sleep 5  # Czekamy chwilę, aby serwer się poprawnie uruchomił

echo "🔍 Sprawdzam dostępne modele..."
ollama list || echo "⚠️ Błąd: Nie można pobrać listy modeli"

echo "⬇️ Pobieram model mistral..."
until ollama pull mistral; do
  echo "❌ Nie udało się pobrać modelu. Ponawiam próbę za 5 sekund..."
  sleep 5
done

echo "✅ Model pobrany, oto lista dostępnych modeli:"
ollama list

echo "🎯 Restartuję serwer Ollama..."
killall ollama  # Wyłączamy Ollama uruchomionego w tle
exec ollama serve  # Restartujemy Ollama na pierwszym planie
