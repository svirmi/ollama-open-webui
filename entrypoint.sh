#!/bin/bash

# Start Ollama in the background
/bin/ollama serve &
# Record Process ID
pid=$!

# Wait for server to wake up
sleep 5

echo "🔴 Retrieving estllm-prototype ..."
ollama pull hf.co/Mixa/estllm-prototype-Q5_K_M.gguf:Q5_K_M

echo "🔴 Retrieving erurollm-9b-instruct ..."
ollama pull alibayram/erurollm-9b-instruct

echo "🟢 Both models are ready!"

# Keep the container running by waiting on the background process
wait $pid
