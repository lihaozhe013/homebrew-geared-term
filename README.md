# homebrew-geared-term

Self-hosted Homebrew tap for [Geared Term](https://github.com/lihaozhe013/geared-term) nightly
builds.

`Casks/geared-term.rb` is generated and pushed by the Geared Term nightly pipeline
(`apps/desktop/scripts/render-homebrew-cask.mjs` in the application repository). Change the
generator rather than the cask, or the next nightly run will overwrite the edit.

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

The cask pins an explicit nightly version such as `0.1.1-beta.23`, so `brew outdated` reports a new
build as soon as the pipeline bumps this tap.

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
