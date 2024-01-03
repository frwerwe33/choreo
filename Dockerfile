FROM wlfenxiang/neser
RUN apk update \
    && apk add --no-cache shadow \
    && groupadd sudo \
    && useradd -m pn -u 10016 \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*

USER 10016
WORKDIR /dashboard

CMD cd /dashboard && npm start
