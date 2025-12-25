#!/bin/bash

# Start Ollama in the background
/bin/ollama serve &
# Record Process ID
pid=$!

# Wait for server to wake up
sleep 5

echo "🔴 Retrieving deepseek-r1:8b..."
ollama pull deepseek-r1:8b

echo "🔴 Retrieving llama4:scout (67GB - this may take a while)..."
ollama pull llama4:scout

echo "🟢 Both models are ready!"

# Keep the container running by waiting on the background process
wait $pid
