# tor-official

Minimal Debian-trixie-based image that installs `tor` directly from the
Tor Project's own apt repository (`deb.torproject.org`), instead of a
distro-packaged build that can lag behind security releases. SocksPort is
bound to `0.0.0.0:9050` inside the container so it works correctly behind
Docker's port publishing.

## Build schedule

Rebuilt automatically every **Tuesday** via GitHub Actions (also on every
push to `main`, and manually via workflow_dispatch), published to
`ghcr.io/alru78/tor-official:latest` and a dated tag.

Deployed via Watchtower on the Pi, which polls weekly on **Wednesdays** —
one day after the build, so the new image is always ready before
Watchtower looks for it.

For an urgent fix (e.g. a same-week Tor security release), trigger the
workflow manually from the Actions tab rather than waiting for the next
Tuesday, then either wait for Wednesday's Watchtower pull or update the
Pi immediately:

    docker pull ghcr.io/alru78/tor-official:latest
    docker compose up -d tor-proxy
