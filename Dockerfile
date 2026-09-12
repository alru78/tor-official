FROM debian:trixie-slim
RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates wget gnupg && \
    wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor > /usr/share/keyrings/deb.torproject.org-keyring.gpg && \
    printf "Types: deb\nURIs: https://deb.torproject.org/torproject.org/\nSuites: trixie\nComponents: main\nSigned-By: /usr/share/keyrings/deb.torproject.org-keyring.gpg\n" > /etc/apt/sources.list.d/tor.sources && \
    apt-get update && apt-get install -y tor deb.torproject.org-keyring && \
    sed -i '/^SocksPort/d' /etc/tor/torrc && \
    echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 9050
CMD ["tor", "-f", "/etc/tor/torrc"]
