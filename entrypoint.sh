#!/bin/bash

# Start Ollama in the background
/bin/ollama serve &
# Record Process ID
pid=$!

# Wait for server to wake up
sleep 5

echo "🔴 Retrieving deepseek-r1:8b..."
ollama pull deepseek-r1:8b

echo "🔴 Retrieving alibayram/erurollm-9b-instruct ..."
ollama pull alibayram/erurollm-9b-instruct

echo "🟢 Both models are ready!"

# Keep the container running by waiting on the background process
wait $pid
