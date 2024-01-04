FROM daxia2023/doc:ndjs-neser-cho
ENV FLIE_PATH="${FLIE_PATH:-/tmp}"
RUN apk update \
    && apk add --no-cache shadow \
    && useradd -m pn -u 10016 \
    && groupadd sudo \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*
USER 10016
