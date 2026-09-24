# homebrew-geared-term

Self-hosted Homebrew tap for [Geared Term](https://github.com/lihaozhe013/geared-term) nightly
builds.

`Casks/geared-term.rb` is generated, never edited by hand: change
`apps/desktop/scripts/render-homebrew-cask.mjs` in the application repository instead, or the next
sync overwrites the edit. Two paths keep the cask current:

- the Geared Term nightly release job pushes it immediately after publishing, when the
  `TAP_PUSH_TOKEN` secret is configured in the application repository;
- `.github/workflows/sync-cask.yml` in this repository re-renders it hourly from the nightly
  checksum manifest with its own `GITHUB_TOKEN`, so no cross-repository secret is needed.

## Install

```sh
brew install --cask lihaozhe013/geared-term/geared-term
```

Homebrew 6 and newer only load non-official taps that you explicitly trust, and the fully qualified
name above trusts just this cask. To use the short name afterwards:

```sh
brew tap lihaozhe013/geared-term
brew trust --cask lihaozhe013/geared-term/geared-term
```

## Upgrade

```sh
brew update
brew outdated --cask geared-term
brew upgrade --cask geared-term
```

The cask pins an explicit nightly version such as `0.1.1-beta.25` and downloads the immutable
`geared-term-mac-arm64-<version>.dmg` asset, so the checksum cannot drift while the rolling nightly
release is replaced. `brew outdated` reports a new build as soon as either sync path bumps this tap.

## Uninstall

```sh
brew uninstall --cask geared-term        # keeps user data
brew uninstall --zap --cask geared-term  # also removes settings, themes, and logs
```

## Caveats

Nightly bundles carry an ad-hoc signature only: no Developer ID signing and no notarization. macOS
blocks the first launch until the app is allowed in System Settings → Privacy & Security → Open
Anyway, and because the ad-hoc signature changes with every build, macOS may ask again after each
upgrade.
