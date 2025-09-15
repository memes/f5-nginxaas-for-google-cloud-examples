# F5 Google demo bootstrap template for Google Cloud

![GitHub release](https://img.shields.io/github/v/release/memes/terraform-google-f5-demo-bootstrap-template?sort=semver)
![Maintenance](https://img.shields.io/maintenance/yes/2025)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

This repository contains common settings and actions that are typical to my demo projects and is designed to be used
with the [bootstrap](https://github.com/memes/terraform-google-f5-demo-bootstrap) module as a starting point for
automated deployments.

## Setup

> NOTE: TODOs are sprinkled in the files and can be used to find where changes
> may be necessary.

1. Use as a template when creating a new GitHub repo, or copy the contents into
   a bare-repo directory.
2. Update `.pre-commit-config.yml` to add/remove plugins as necessary.
3. Modify README.md and CONTRIBUTING.md, change LICENSE as needed.
4. Review GitHub PR and issue templates.
5. If using `release-please` action, make these changes:
   1. In GitHub Settings:
      * _Settings_ > _Actions_ > _General_  > _Allow GitHub Actions to create and approve pull requests_ is checked
      * _Settings_ > _Secrets and Variables_ > _Actions_, and add `RELEASE_PLEASE_TOKEN` with PAT as a _Repository Secret_
   2. Modify [release-please action](.github/workflows/release-please.yml) to enable it
   3. Modify [release-please-config.json](release-please-config.json)] as needed
   4. Reset [.release-please-manifest.json](.release-please-manifest.json) to an empty file or starting version for package(s).
6. Remove all [CHANGELOG](CHANGELOG.md) entries.
7. Modify [pyproject.toml](pyproject.toml) name and dependencies, as needed, delete [uv.lock](uv.lock) and regenerate.
8. Modify [devcontainer](.devcontainer/devcontainer.json) name, etc., as needed, test.
9. Commit changes.
