FROM python:3.11-slim

RUN apt-get update \
 && apt-get install -y sudo tk tcl gcc curl

WORKDIR /app

COPY . .
COPY docker/entrypoint.sh ./entrypoint.sh

RUN sudo pip install --upgrade pip
RUN sudo pip install -e .
RUN sudo pip install litellm
RUN sudo pip install 'litellm[proxy]'

RUN curl https://ollama.ai/install.sh | sh
ENV OPENAI_API_BASE http://0.0.0.0:8032

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
