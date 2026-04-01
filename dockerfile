# Stage 1: FFmpeg estático
FROM mwader/static-ffmpeg:8.0 AS ffmpeg

# Stage 2: n8n
FROM n8nio/n8n:latest

USER root
COPY --from=ffmpeg /ffmpeg /usr/local/bin/
COPY --from=ffmpeg /ffprobe /usr/local/bin/
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe
USER node

