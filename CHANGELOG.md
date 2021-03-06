# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.5.3] - 2017-10-28
### Fixed
- Fixed an issue where development pods would cause a crash.

## [0.5.2] - 2017-10-28
### Added
- Now dependencyswapper prints in console the directory where the development pod was installed.

## [0.5.1] - 2017-10-25
### Added
- Fix issue with install message

## [0.5.0] - 2017-10-25
### Added
- Support for tags. Now when we pull a dependency as test or dev, we will make sure to pull the right version defined in the Podfile.lock
- Added a CHANGELOG

[0.5.0]: https://github.com/pkrmf/dependencyswapper/tree/tag/v0.5.0
[0.5.1]: https://github.com/pkrmf/dependencyswapper/tree/tag/v0.5.1
[0.5.2]: https://github.com/pkrmf/dependencyswapper/tree/tag/v0.5.2
[0.5.3]: https://github.com/pkrmf/dependencyswapper/tree/tag/v0.5.3
