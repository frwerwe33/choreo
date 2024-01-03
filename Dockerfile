FROM wlfenxiang/neser
RUN apk update \
    && apk add --no-cache shadow \
    && groupadd sudo \
    && useradd -m pn -u 10016 \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /dashboard
USER 10016
CMD node /dashboard/index.js
