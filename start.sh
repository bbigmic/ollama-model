#!/bin/bash

# Pobranie modelu mistral (jednorazowo przy pierwszym uruchomieniu)
ollama pull mistral

# Uruchomienie API Ollama
ollama serve
