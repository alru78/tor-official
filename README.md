# tor-official

Minimal Debian-trixie-based image that installs `tor` directly from the
Tor Project's own apt repository (`deb.torproject.org`), instead of a
distro-packaged build that can lag behind security releases.

Rebuilt automatically every day via GitHub Actions, published to
`ghcr.io/<owner>/tor-official:latest`.
