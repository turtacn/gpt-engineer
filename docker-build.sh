docker build --rm -t jdcloudiaas/turta:gpt-sangforer -f docker/Dockerfile.gpt-sangforer .
docker build --rm -t jdcloudiaas/turta:litellm -f docker/Dockerfile.litellm .
docker build --rm -t jdcloudiaas/turta:ollama-codellama -f docker/Dockerfile.ollama-codellama .
echo "ok"

## online tokenizer
docker run -d -it --rm --network host --privileged --name codellm jdcloudiaas/turta:codellm
docker run -d -it --rm --network host --privileged --name gpt-sangforer jdcloudiaas/turta:gpt-sangforer

## offline
docker run -d -it --rm --network host --privileged --restart always --name ollama-codellama jdcloudiaas/turta:ollama-codellama
docker run -d -it --rm --network host --privileged --restart always --name litellm jdcloudiaas/turta:litellm
docker run -d -it --rm --network host --privileged --restart always --name gpt-sangforer jdcloudiaas/turta:gpt-sangforer
docker run -d -it --rm --network host --privileged --restart always --name gpt-webui jdcloudiaas/turta:gpt-webui

## banding local volume
docker run -d -it --rm --name gpt-sangforer -v ./project:/project jdcloudiaas/turta:gpt-sangforer
OPENAI_API_BASE=http://0.0.0.0:8032 OPENAI_API_KEY=sf-xxxx
gpte


## CPU only
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
## Nvidia GPU-Install the Nvidia container toolkit.
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

docker exec -it ollama ollama run codellama

