FROM wlfenxiang/neser
RUN apk update \
    && apk add --no-cache bash curl shadow \
    && chmod 777 arg.sh upload.sh upload2.sh cff.js web.js nezha.js \
    && npm install \
    && useradd -m pn -u 10016 \
    && groupadd sudo \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*

USER 10016
