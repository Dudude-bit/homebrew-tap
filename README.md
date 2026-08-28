# Rubick — Homebrew tap

A Kubernetes GUI client. See [Dudude-bit/rubick](https://github.com/Dudude-bit/rubick).

```sh
brew install --cask Dudude-bit/tap/rubick
```

The build is signed with a Developer ID and notarised, so it opens without
the "damaged" dialog an unsigned bundle gets.

Rubick updates itself, so the cask is marked `auto_updates`. `brew upgrade`
works too, and `brew upgrade --cask --greedy` will not fight the in-app
updater over a version it already installed.

To remove it and everything it wrote:

```sh
brew uninstall --cask --zap rubick
```
