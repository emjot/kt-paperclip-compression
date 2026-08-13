# Changelog

## Unreleased
  * **Change:** drops support for EOL 32-bit platforms (macOS 32bit, Linux x86, Windows win32). None of these are usable on current OS releases (Apple removed 32-bit app support entirely in Catalina; mainstream Linux distros and Windows are 64-bit only now). `bin/osx/64bit/` is renamed to `bin/osx/` since it's the only remaining macOS variant, and `command_path` in `lib/paperclip-compression/base.rb` no longer branches on OS bit-width/version.
  * **Change:** rebuilds every bundled `jpegtran`/`optipng` binary (macOS universal arm64+x86_64, Linux x64, Windows x64) as fully static executables against current upstream — libjpeg-turbo 3.2.0 and OptiPNG 7.9.1 — replacing binaries that ranged from 2014–2017-era to outright broken. See the "Supported platforms & bundled binaries" section in the README.
  * **Bug Fix:** the macOS `jpegtran` binary was dynamically linked against `@loader_path/libjpeg.dylib`, but that dylib was never committed, so it crashed on every current macOS (`Library not loaded: @loader_path/libjpeg.dylib`). Now statically linked.
  * **Bug Fix:** `bin/win64/optipng.exe` didn't exist in the repo at all — PNG compression on 64-bit Windows always failed with `CommandNotFoundError`. Now bundled.
  * **Bug Fix:** `command_path` in `lib/paperclip-compression/base.rb` never appended `.exe` on Windows, so it resolved to a nonexistent file (e.g. `bin/win64/jpegtran` instead of `bin/win64/jpegtran.exe`) — meaning JPEG compression on Windows never actually worked either. Fixed, and a `windows-latest` CI job was added so this doesn't regress silently again.
  * **Change:** bumps `actions/checkout` to `v7` in all CI jobs (was `v2`/`master`).

## emjot-2.0.0
  * **Security:** upgrades bundler dependency to >= 2.2.10
  * **Feature:** adds Ruby 2.6 & 2.7 support ([Soren Hedegaard](https://github.com/sorenwiz))
  * **Change:** drops Ruby 2.1 & 2.2 support

## 1.2.2 (August 27, 2021)
  * **Change:** loosen kt-paperclip dependency to also allow > 6

## 1.2.1 (August 24, 2021)
  * **Bug Fix:** Update catalina support for newer rubies beyond 2.7.1

## 1.2.0 (March 02, 2021)
  * **Change:** Compatibility with kt-paperclip (replaces paperclip)

## 1.1.1 (March 15, 2020)
  * **Security:** upgrades rake dependency to ~> 12.3.3

## 1.1.0 (January 18, 2020)
  * **Feature:** adds Catalina support

## 1.0.2 (October 14, 2019)
  * **Bug Fix:** fixes uninitialized constant Cocaine error

## 1.0.1 (February 2, 2018)
  * **Bug Fix:** removes wrong png extension for tmp files
  * **Security:** upgrades paperclip dependency to >= 5.2.1

## 1.0.0 (November 28, 2017)
  * **Feature:** adds `command` option
  * **Improvement:** upgrades os dependency to 1.0.0
  * No backward incompitable changes, safe to upgrade

## 0.3.16 (November 27, 2016)
  * **Improvement:** loosen paperclip dependency

## 0.3.15 (April 4, 2016)
  * **Bug Fix:** For accurate file info, re-open output file after compressing ([Zee](https://github.com/zspencer))

## 0.3.14 (March 23, 2016)
  * **Security:** upgrade paperclip dependency

## 0.3.13 (October 31, 2015)
  * **Bug Fix:** returns tempfile when processor is disabled

## 0.3.12 (October 25, 2015)
  * **Improvement:** removes ruby-imagespec dependency ([Uilton Dutra](https://github.com/uiltondutra))
  * **Improvement:** upgrades paperclip dependency to >= 4.3.0

## 0.3.11 (September 15, 2015)
  * **Improvement:** upgrades ruby-imagespec to 0.4.1
  * **Improvement:** runs optipng in quiet mode

## 0.3.10 (August 2, 2015)
  * **Bug Fix:** "File used by other process" error fix (Maciek Partyka)

## 0.3.9 (July 13, 2015)
  * **Improvement:** loosen paperclip dependency

## 0.3.8 (July 13, 2015)
  * **Security:** upgrade paperclip dependency

## 0.3.7 (February 12, 2015)
  * **Bug Fix:** detecting freebsd

## 0.3.6 (April 16, 2014)
  * **Improvement:** update jpegtran and optipng binaries

## 0.3.5 (February 14, 2014)
  * **Improvement:** change dependencies to allow paperclip 4 ([Jarosław Rzeszótko](https://github.com/jaroslawr))

## 0.3.4 (August 22, 2013)
  * **Bug Fix:** Support for all the paperclip IO adapter's ([Oscar Esgalha](https://github.com/oesgalha))
  * MIT license added

## 0.3.3 (June 27, 2013)
  * **Bug Fix:** detecting content type if first processor is paperclip-compression

## 0.3.2 (June 26, 2013)
  * **Bug Fix:** use ImageSpec to detect image types

## 0.3.1 (June 18, 2013)
  * **Feature:** take paperclip defaults into account

## 0.3.0 (June 15, 2013)
  * **Improvement:** add jpegtran and optipng binaries

## 0.2.3 (June 9, 2013)
  * **Improvement:** fix README

## 0.2.2 (June 9, 2013)
  * **Bug Fix:** fix filenames with spaces

## 0.2.1 (May 4, 2013)
  * **Improvement:** fix gem release date

## 0.2.0 (May 4, 2013)
  * **Feature:** compression options added

## 0.1.1 (November 24, 2011)
  * **Bug Fix:** gem requirements and dependencies added

## 0.1.0 (November 24, 2011)
  * initial release
