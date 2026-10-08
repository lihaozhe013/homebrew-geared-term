# homebrew-geared-term

Self-hosted Homebrew tap for [Geared Term](https://github.com/lihaozhe013/geared-term) nightly
builds.

The Homebrew formula is generated from the versioned macOS arm64 command-line archive and its
SHA-256 checksum. The Geared Term nightly release job updates it after publishing. This tap also
checks the nightly checksum manifest hourly so a missing cross-repository push is recovered
automatically.

## Install

```sh
brew install --formula lihaozhe013/geared-term/geared-term
geared-term
```

Geared Term starts from a trusted terminal and returns to the shell. Close its window to leave it
available from the Dock. After quitting or restarting macOS, run `geared-term` again.

## Upgrade

```sh
brew upgrade --formula geared-term
```

## Migrate from the previous cask

Quit Geared Term before removing the old cask. The uninstall command keeps the existing user
configuration:

```sh
brew uninstall --cask geared-term
brew update
brew install --formula lihaozhe013/geared-term/geared-term
```

The formula becomes available after the first nightly release containing the macOS command-line
archive. User configuration remains at
`~/Library/Application Support/@geared-term/desktop` across the migration and upgrades.