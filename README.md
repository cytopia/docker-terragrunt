# Docker image for `terragrunt`

[![Tag](https://img.shields.io/github/tag/cytopia/docker-terragrunt.svg)](https://github.com/cytopia/docker-terragrunt/releases)
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--terragrunt-red.svg)](https://github.com/cytopia/docker-terragrunt "github.com/cytopia/docker-terragrunt")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

[![lint](https://github.com/cytopia/docker-terragrunt/workflows/lint/badge.svg)](https://github.com/cytopia/docker-terragrunt/actions?query=workflow%3Alint)
[![build](https://github.com/cytopia/docker-terragrunt/workflows/build/badge.svg)](https://github.com/cytopia/docker-terragrunt/actions?query=workflow%3Abuild)
[![nightly](https://github.com/cytopia/docker-terragrunt/workflows/nightly/badge.svg)](https://github.com/cytopia/docker-terragrunt/actions?query=workflow%3Anightly)


> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Docker images
>
> [ansible-lint][alint-git-lnk] **•**
> [ansible][ansible-git-lnk] **•**
> [awesome-ci][aci-git-lnk] **•**
> [bandit][bandit-git-lnk] **•**
> [black][black-git-lnk] **•**
> [checkmake][cm-git-lnk] **•**
> [eslint][elint-git-lnk] **•**
> [file-lint][flint-git-lnk] **•**
> [gofmt][gfmt-git-lnk] **•**
> [goimports][gimp-git-lnk] **•**
> [golint][glint-git-lnk] **•**
> [jsonlint][jlint-git-lnk] **•**
> [kubeval][kubeval-git-lnk] **•**
> [linkcheck][linkcheck-git-lnk] **•**
> [mypy][mypy-git-lnk] **•**
> [php-cs-fixer][pcsf-git-lnk] **•**
> [phpcbf][pcbf-git-lnk] **•**
> [phpcs][pcs-git-lnk] **•**
> [phplint][plint-git-lnk] **•**
> [pycodestyle][pycs-git-lnk] **•**
> [pydocstyle][pyds-git-lnk] **•**
> [pylint][pylint-git-lnk] **•**
> [terraform-docs][tfdocs-git-lnk] **•**
> [terragrunt-fmt][tgfmt-git-lnk] **•**
> [terragrunt][tg-git-lnk] **•**
> [yamlfmt][yfmt-git-lnk] **•**
> [yamllint][ylint-git-lnk]

View **[Dockerfiles](https://github.com/cytopia/docker-terragrunt/blob/master/Dockerfiles/)** on GitHub.


**Available Architectures:**  `amd64`, `i386`, `arm64`

Tiny Alpine-based multistage-build dockerized version of [Terragrunt](https://github.com/gruntwork-io/terragrunt)<sup>[1]</sup>
and its compatible version of [Terraform](https://github.com/hashicorp/terraform)<sup>[2]</sup>.

* <sub>[1] Official project: https://github.com/gruntwork-io/terragrunt</sub>
* <sub>[2] Official project: https://github.com/hashicorp/terraform</sub>


## :whale: Available Docker image versions

[![](https://img.shields.io/docker/pulls/cytopia/terragrunt.svg)](https://hub.docker.com/r/cytopia/terragrunt)
[![Docker](https://badgen.net/badge/icon/:latest?icon=docker&label=cytopia/terragrunt)](https://hub.docker.com/r/cytopia/terragrunt)

#### Rolling releaess

The following Docker image tags are rolling releases and are built and updated every night.

[![nightly](https://github.com/cytopia/docker-terragrunt/workflows/nightly/badge.svg)](https://github.com/cytopia/docker-terragrunt/actions?query=workflow%3Anightly)


| Docker Tag  | Git Ref   | Terraform     | Terragrunt   | Available Architectures                      |
|-------------|-----------|---------------|--------------|----------------------------------------------|
| `latest`    | master    | latest        | latest       | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `1.5-0.47`  | master    | **`1.5.x`**   | **`0.47.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.46`  | master    | **`1.5.x`**   | **`0.46.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.45`  | master    | **`1.5.x`**   | **`0.45.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.44`  | master    | **`1.5.x`**   | **`0.44.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `1.4-0.47`  | master    | **`1.4.x`**   | **`0.47.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.46`  | master    | **`1.4.x`**   | **`0.46.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.45`  | master    | **`1.4.x`**   | **`0.45.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.44`  | master    | **`1.4.x`**   | **`0.44.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `1.3-0.47`  | master    | **`1.3.x`**   | **`0.47.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.46`  | master    | **`1.3.x`**   | **`0.46.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.45`  | master    | **`1.3.x`**   | **`0.45.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.44`  | master    | **`1.3.x`**   | **`0.44.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.43`  | master    | **`1.3.x`**   | **`0.43.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.42`  | master    | **`1.3.x`**   | **`0.42.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.41`  | master    | **`1.3.x`**   | **`0.41.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.40`  | master    | **`1.3.x`**   | **`0.40.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.39`  | master    | **`1.3.x`**   | **`0.39.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `1.2-0.39`  | master    | **`1.2.x`**   | **`0.39.x`** | `amd64`, `i386`, `arm64`                     |
| `1.2-0.38`  | master    | **`1.2.x`**   | **`0.38.x`** | `amd64`, `i386`, `arm64`                     |
| `1.2-0.37`  | master    | **`1.2.x`**   | **`0.37.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `1.1-0.38`  | master    | **`1.1.x`**   | **`0.38.x`** | `amd64`, `i386`, `arm64`                     |
| `1.1-0.37`  | master    | **`1.1.x`**   | **`0.37.x`** | `amd64`, `i386`, `arm64`                     |
| `1.1-0.36`  | master    | **`1.1.x`**   | **`0.36.x`** | `amd64`, `i386`, `arm64`                     |
| `1.1-0.35`  | master    | **`1.1.x`**   | **`0.35.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `1.0-0.38`  | master    | **`1.0.x`**   | **`0.38.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.37`  | master    | **`1.0.x`**   | **`0.37.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.36`  | master    | **`1.0.x`**   | **`0.36.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.35`  | master    | **`1.0.x`**   | **`0.35.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.34`  | master    | **`1.0.x`**   | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.33`  | master    | **`1.0.x`**   | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.32`  | master    | **`1.0.x`**   | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.31`  | master    | **`1.0.x`**   | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `0.15-0.34` | master    | **`0.15.x`**  | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.33` | master    | **`0.15.x`**  | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.32` | master    | **`0.15.x`**  | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.31` | master    | **`0.15.x`**  | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.30` | master    | **`0.15.x`**  | **`0.30.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.29` | master    | **`0.15.x`**  | **`0.29.x`** | `amd64`, `i386`, `arm64`                     |
|             |           |               |              |                                              |
| `0.14-0.34` | master    | **`0.14.x`**  | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.33` | master    | **`0.14.x`**  | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.32` | master    | **`0.14.x`**  | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.31` | master    | **`0.14.x`**  | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.30` | master    | **`0.14.x`**  | **`0.30.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.29` | master    | **`0.14.x`**  | **`0.29.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.28` | master    | **`0.14.x`**  | **`0.28.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.27` | master    | **`0.14.x`**  | **`0.27.x`** | `amd64`, `i386`                              |
|             |           |               |              |                                              |
| `0.13-0.34` | master    | **`0.13.x`**  | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.33` | master    | **`0.13.x`**  | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.32` | master    | **`0.13.x`**  | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.31` | master    | **`0.13.x`**  | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.30` | master    | **`0.13.x`**  | **`0.30.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.29` | master    | **`0.13.x`**  | **`0.29.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.28` | master    | **`0.13.x`**  | **`0.28.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.27` | master    | **`0.13.x`**  | **`0.27.x`** | `amd64`, `i386`                              |
| `0.13-0.26` | master    | **`0.13.x`**  | **`0.26.x`** | `amd64`, `i386`                              |
| `0.13-0.25` | master    | **`0.13.x`**  | **`0.25.x`** | `amd64`, `i386`                              |
|             |           |               |              |                                              |
| `0.12-0.24` | master    | **`0.12.x`**  | **`0.24.x`** | `amd64`, `i386`                              |
| `0.12-0.23` | master    | **`0.12.x`**  | **`0.23.x`** | `amd64`, `i386`                              |
| `0.12-0.22` | master    | **`0.12.x`**  | **`0.22.x`** | `amd64`, `i386`                              |
| `0.12-0.21` | master    | **`0.12.x`**  | **`0.21.x`** | `amd64`, `i386`                              |
| `0.12-0.20` | master    | **`0.12.x`**  | **`0.20.x`** | `amd64`, `i386`                              |
| `0.12-0.19` | master    | **`0.12.x`**  | **`0.19.x`** | `amd64`, `i386`                              |
|             |           |               |              |                                              |
| `0.11-0.18` | master    | **`0.11.x`**  | **`0.18.x`** | `amd64`, `i386`                              |


#### Point in time releases

The following Docker image tags are built once and can be used for reproducible builds. Its version never changes so you will have to update tags in your pipelines from time to time in order to stay up-to-date.

[![build](https://github.com/cytopia/docker-terragrunt/workflows/build/badge.svg)](https://github.com/cytopia/docker-terragrunt/actions?query=workflow%3Abuild)

| Docker Tag        | Git Ref      | Terraform     | Terragrunt   | Available Architectures                      |
|-------------------|--------------|---------------|--------------|----------------------------------------------|
| `latest-<tag>`    | tag: `<tag>` | latest        | latest       | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `1.5-0.48-<tag>`  | tag: `<tag>` | **`1.5.x`**   | **`0.48.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.47-<tag>`  | tag: `<tag>` | **`1.5.x`**   | **`0.47.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.46-<tag>`  | tag: `<tag>` | **`1.5.x`**   | **`0.46.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.45-<tag>`  | tag: `<tag>` | **`1.5.x`**   | **`0.45.x`** | `amd64`, `i386`, `arm64`                     |
| `1.5-0.44-<tag>`  | tag: `<tag>` | **`1.5.x`**   | **`0.44.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `1.4-0.48-<tag>`  | tag: `<tag>` | **`1.4.x`**   | **`0.48.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.47-<tag>`  | tag: `<tag>` | **`1.4.x`**   | **`0.47.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.46-<tag>`  | tag: `<tag>` | **`1.4.x`**   | **`0.46.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.45-<tag>`  | tag: `<tag>` | **`1.4.x`**   | **`0.45.x`** | `amd64`, `i386`, `arm64`                     |
| `1.4-0.44-<tag>`  | tag: `<tag>` | **`1.4.x`**   | **`0.44.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `1.3-0.48-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.48.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.47-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.47.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.46-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.46.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.45-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.45.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.44-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.44.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.43-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.43.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.42-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.42.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.41-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.41.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.40-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.40.x`** | `amd64`, `i386`, `arm64`                     |
| `1.3-0.39-<tag>`  | tag: `<tag>` | **`1.3.x`**   | **`0.39.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `1.2-0.39-<tag>`  | tag: `<tag>` | **`1.2.x`**   | **`0.39.x`** | `amd64`, `i386`, `arm64`                     |
| `1.2-0.38-<tag>`  | tag: `<tag>` | **`1.2.x`**   | **`0.38.x`** | `amd64`, `i386`, `arm64`                     |
| `1.2-0.37-<tag>`  | tag: `<tag>` | **`1.2.x`**   | **`0.37.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `1.1-0.38-<tag>`  | tag: `<tag>` | **`1.1.x`**   | **`0.38.x`** | `amd64`, `i386`, `arm64`                     |
| `1.1-0.37-<tag>`  | tag: `<tag>` | **`1.1.x`**   | **`0.37.x`** | `amd64`, `i386`, `arm64`                     |
| `1.1-0.36-<tag>`  | tag: `<tag>` | **`1.1.x`**   | **`0.36.x`** | `amd64`, `i386`, `arm64`                     |
| `1.1-0.35-<tag>`  | tag: `<tag>` | **`1.1.x`**   | **`0.35.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `1.0-0.38-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.38.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.37-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.37.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.36-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.36.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.35-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.35.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.34-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.33-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.32-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `1.0-0.31-<tag>`  | tag: `<tag>` | **`1.0.x`**   | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `0.15-0.34-<tag>` | tag: `<tag>` | **`0.15.x`**  | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.33-<tag>` | tag: `<tag>` | **`0.15.x`**  | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.32-<tag>` | tag: `<tag>` | **`0.15.x`**  | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.31-<tag>` | tag: `<tag>` | **`0.15.x`**  | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.30-<tag>` | tag: `<tag>` | **`0.15.x`**  | **`0.30.x`** | `amd64`, `i386`, `arm64`                     |
| `0.15-0.29-<tag>` | tag: `<tag>` | **`0.15.x`**  | **`0.29.x`** | `amd64`, `i386`, `arm64`                     |
|                   |              |               |              |                                              |
| `0.14-0.34-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.33-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.32-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.31-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.30-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.30.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.29-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.29.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.28-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.28.x`** | `amd64`, `i386`, `arm64`                     |
| `0.14-0.27-<tag>` | tag: `<tag>` | **`0.14.x`**  | **`0.27.x`** | `amd64`, `i386`                              |
|                   |              |               |              |                                              |
| `0.13-0.34-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.34.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.33-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.33.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.32-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.32.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.31-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.31.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.30-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.30.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.29-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.29.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.28-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.28.x`** | `amd64`, `i386`, `arm64`                     |
| `0.13-0.27-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.27.x`** | `amd64`, `i386`                              |
| `0.13-0.26-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.26.x`** | `amd64`, `i386`                              |
| `0.13-0.25-<tag>` | tag: `<tag>` | **`0.13.x`**  | **`0.25.x`** | `amd64`, `i386`                              |
|                   |              |               |              |                                              |
| `0.12-0.24-<tag>` | tag: `<tag>` | **`0.12.x`**  | **`0.24.x`** | `amd64`, `i386`                              |
| `0.12-0.23-<tag>` | tag: `<tag>` | **`0.12.x`**  | **`0.23.x`** | `amd64`, `i386`                              |
| `0.12-0.22-<tag>` | tag: `<tag>` | **`0.12.x`**  | **`0.22.x`** | `amd64`, `i386`                              |
| `0.12-0.21-<tag>` | tag: `<tag>` | **`0.12.x`**  | **`0.21.x`** | `amd64`, `i386`                              |
| `0.12-0.20-<tag>` | tag: `<tag>` | **`0.12.x`**  | **`0.20.x`** | `amd64`, `i386`                              |
| `0.12-0.19-<tag>` | tag: `<tag>` | **`0.12.x`**  | **`0.19.x`** | `amd64`, `i386`                              |
|                   |              |               |              |                                              |
| `0.11-0.18-<tag>` | tag: `<tag>` | **`0.11.x`**  | **`0.18.x`** | `amd64`, `i386`                              |

Where `<tag>` refers to the chosen git tag from this repository.


## :open_file_folder: Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted to your local filesystem where your Terragrant project resides.
(See [Examples](#examples) for mount location usage.)


## :computer: Usage

```bash
docker run --rm -v $(pwd):/data cytopia/terragrunt terragrunt <ARGS>
docker run --rm -v $(pwd):/data cytopia/terragrunt terraform <ARGS>
```

## :capital_abcd: Environment variables

The following environment variables will ease your life when mounting directories into the docker container by maintaining file system permissions.

| Variables      | Default | Description |
|----------------|---------|-------------|
| `RUN_NON_ROOT` | `0`     | Set to `1` to run commands as user instead of root. |
| `UID`          | `1000`  | Set to the uid of your local user (`id -u`) if you want to run as non root. |
| `GID`          | `1000`  | Set to the gid of your local user (`id -g`) if you want to run as non root. |


## :information_source: Examples

### 1. Simple: Provision single sub-project on AWS

#### 1.1 Project overview
Let's assume your Terragrunt project setup is as follows:
```bash
/my/tf                                              # Terragrunt project root
├── backend-app
│   ├── main.tf
│   └── terragrunt.hcl
├── frontend-app
│   ├── main.tf
│   └── terragrunt.hcl
├── mysql                                           # MySQL sub-project directory
│   ├── main.tf
│   └── terragrunt.hcl
├── redis
│   ├── main.tf
│   └── terragrunt.hcl
└── vpc
    ├── main.tf
    └── terragrunt.hcl
```
The **MySQL** sub-project you want to provision is at the releative path `mysql/`.

#### 1.2 To consider
1. Mount the terragrunt root project dir (`/my/tf/`) into `/data/` into the container
2. Use the workding dir (`-w` or `--workdir`) to point to your project inside the container
3. Add AWS credentials from your environment to the container

#### 1.3 Docker commands
```bash
# Initialize the MySQL project
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -u $(id -u):$(id -g) \
  -v /my/tf:/data \
  -w /data/mysql \
  cytopia/terragrunt terragrunt init

# Plan the MySQL project
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -u $(id -u):$(id -g) \
  -v /my/tf:/data \
  -w /data/mysql \
  cytopia/terragrunt terragrunt plan

# Apply the MySQL project
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -u $(id -u):$(id -g) \
  -v /my/tf:/data \
  -w /data/mysql \
  cytopia/terragrunt terragrunt --terragrunt-non-interactive apply
```
<!-- #### 1.4 Makefile integration -->

### 2. Complex: Provision single sub-project on AWS

#### 2.1 Project overview
Let's assume your Terragrunt project setup is as follows:
```bash
/my/tf                                              # Terragrunt project root
└── envs
    └── aws
        ├── dev
        │   ├── eu-central-1
        │   │   ├── infra
        │   │   │   └── vpc-k8s                     # VPC sub-project directory
        │   │   │       ├── terraform.tfvars
        │   │   │       └── terragrunt.hcl
        │   │   ├── microservices
        │   │   │   └── api-gateway
        │   │   │       ├── terraform.tfvars
        │   │   │       └── terragrunt.hcl
        │   │   └── region.tfvars
        │   ├── global
        │   │   └── region.tfvars
        │   └── terragrunt.hcl
        └── _provider_include
            └── include_providers.tf
```
The **VPC** sub-project you want to provision is at the relative path `envs/aws/dev/eu-centra-1/infra/vpc-k8s/`.

#### 2.2 To consider
1. Mount the terragrunt root project dir (`/my/tf/`) into `/data/` into the container
2. Use the workding dir (`-w` or `--workdir`) to point to your project inside the container
3. Add AWS credentials from your environment to the container

#### 2.3 Docker commands
```bash
# Initialize the VPC project
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -u $(id -u):$(id -g) \
  -v /my/tf:/data \
  -w /data/envs/aws/dev/eu-central-1/infra/vpc-k8s \
  cytopia/terragrunt terragrunt init

# Plan the VPC project
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -u $(id -u):$(id -g) \
  -v /my/tf:/data \
  -w /data/envs/aws/dev/eu-central-1/infra/vpc-k8s \
  cytopia/terragrunt terragrunt plan

# Apply the VPC project
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -u $(id -u):$(id -g) \
  -v /my/tf:/data \
  -w /data/envs/aws/dev/eu-central-1/infra/vpc-k8s \
  cytopia/terragrunt terragrunt --terragrunt-non-interactive apply
```

<!-- #### 2.4 Makefile integration -->


## :arrows_counterclockwise: Related [#awesome-ci](https://github.com/topics/awesome-ci) projects

### Docker images

Save yourself from installing lot's of dependencies and pick a dockerized version of your favourite
linter below for reproducible local or remote CI tests:

| GitHub | DockerHub | Type | Description |
|--------|-----------|------|-------------|
| [awesome-ci][aci-git-lnk]        | [![aci-hub-img]][aci-hub-lnk]         | Basic      | Tools for git, file and static source code analysis |
| [file-lint][flint-git-lnk]       | [![flint-hub-img]][flint-hub-lnk]     | Basic      | Baisc source code analysis |
| [linkcheck][linkcheck-git-lnk]   | [![linkcheck-hub-img]][flint-hub-lnk] | Basic      | Search for URLs in files and validate their HTTP status code |
| [ansible][ansible-git-lnk]       | [![ansible-hub-img]][ansible-hub-lnk] | Ansible    | Multiple versions and flavours of Ansible |
| [ansible-lint][alint-git-lnk]    | [![alint-hub-img]][alint-hub-lnk]     | Ansible    | Lint Ansible |
| [gofmt][gfmt-git-lnk]            | [![gfmt-hub-img]][gfmt-hub-lnk]       | Go         | Format Go source code **<sup>[1]</sup>** |
| [goimports][gimp-git-lnk]        | [![gimp-hub-img]][gimp-hub-lnk]       | Go         | Format Go source code **<sup>[1]</sup>** |
| [golint][glint-git-lnk]          | [![glint-hub-img]][glint-hub-lnk]     | Go         | Lint Go code |
| [eslint][elint-git-lnk]          | [![elint-hub-img]][elint-hub-lnk]     | Javascript | Lint Javascript code |
| [jsonlint][jlint-git-lnk]        | [![jlint-hub-img]][jlint-hub-lnk]     | JSON       | Lint JSON files **<sup>[1]</sup>** |
| [kubeval][kubeval-git-lnk]       | [![kubeval-hub-img]][kubeval-hub-lnk] | K8s        | Lint Kubernetes files |
| [checkmake][cm-git-lnk]          | [![cm-hub-img]][cm-hub-lnk]           | Make       | Lint Makefiles |
| [phpcbf][pcbf-git-lnk]           | [![pcbf-hub-img]][pcbf-hub-lnk]       | PHP        | PHP Code Beautifier and Fixer |
| [phpcs][pcs-git-lnk]             | [![pcs-hub-img]][pcs-hub-lnk]         | PHP        | PHP Code Sniffer |
| [phplint][plint-git-lnk]         | [![plint-hub-img]][plint-hub-lnk]     | PHP        | PHP Code Linter **<sup>[1]</sup>** |
| [php-cs-fixer][pcsf-git-lnk]     | [![pcsf-hub-img]][pcsf-hub-lnk]       | PHP        | PHP Coding Standards Fixer |
| [bandit][bandit-git-lnk]         | [![bandit-hub-img]][bandit-hub-lnk]   | Python     | A security linter from PyCQA
| [black][black-git-lnk]           | [![black-hub-img]][black-hub-lnk]     | Python     | The uncompromising Python code formatter |
| [mypy][mypy-git-lnk]             | [![mypy-hub-img]][mypy-hub-lnk]       | Python     | Static source code analysis |
| [pycodestyle][pycs-git-lnk]      | [![pycs-hub-img]][pycs-hub-lnk]       | Python     | Python style guide checker |
| [pydocstyle][pyds-git-lnk]       | [![pyds-hub-img]][pyds-hub-lnk]       | Python     | Python docstyle checker |
| [pylint][pylint-git-lnk]         | [![pylint-hub-img]][pylint-hub-lnk]   | Python     | Python source code, bug and quality checker |
| [terraform-docs][tfdocs-git-lnk] | [![tfdocs-hub-img]][tfdocs-hub-lnk]   | Terraform  | Terraform doc generator (TF 0.12 ready) **<sup>[1]</sup>** |
| [terragrunt][tg-git-lnk]         | [![tg-hub-img]][tg-hub-lnk]           | Terraform  | Terragrunt and Terraform |
| [terragrunt-fmt][tgfmt-git-lnk]  | [![tgfmt-hub-img]][tgfmt-hub-lnk]     | Terraform  | `terraform fmt` for Terragrunt files **<sup>[1]</sup>** |
| [yamlfmt][yfmt-git-lnk]          | [![yfmt-hub-img]][yfmt-hub-lnk]       | Yaml       | Format Yaml files **<sup>[1]</sup>** |
| [yamllint][ylint-git-lnk]        | [![ylint-hub-img]][ylint-hub-lnk]     | Yaml       | Lint Yaml files |

> **<sup>[1]</sup>** Uses a shell wrapper to add **enhanced functionality** not available by original project.

[aci-git-lnk]: https://github.com/cytopia/awesome-ci
[aci-hub-img]: https://img.shields.io/docker/pulls/cytopia/awesome-ci.svg
[aci-hub-lnk]: https://hub.docker.com/r/cytopia/awesome-ci

[flint-git-lnk]: https://github.com/cytopia/docker-file-lint
[flint-hub-img]: https://img.shields.io/docker/pulls/cytopia/file-lint.svg
[flint-hub-lnk]: https://hub.docker.com/r/cytopia/file-lint

[linkcheck-git-lnk]: https://github.com/cytopia/docker-linkcheck
[linkcheck-hub-img]: https://img.shields.io/docker/pulls/cytopia/linkcheck.svg
[linkcheck-hub-lnk]: https://hub.docker.com/r/cytopia/linkcheck

[jlint-git-lnk]: https://github.com/cytopia/docker-jsonlint
[jlint-hub-img]: https://img.shields.io/docker/pulls/cytopia/jsonlint.svg
[jlint-hub-lnk]: https://hub.docker.com/r/cytopia/jsonlint

[ansible-git-lnk]: https://github.com/cytopia/docker-ansible
[ansible-hub-img]: https://img.shields.io/docker/pulls/cytopia/ansible.svg
[ansible-hub-lnk]: https://hub.docker.com/r/cytopia/ansible

[alint-git-lnk]: https://github.com/cytopia/docker-ansible-lint
[alint-hub-img]: https://img.shields.io/docker/pulls/cytopia/ansible-lint.svg
[alint-hub-lnk]: https://hub.docker.com/r/cytopia/ansible-lint

[kubeval-git-lnk]: https://github.com/cytopia/docker-kubeval
[kubeval-hub-img]: https://img.shields.io/docker/pulls/cytopia/kubeval.svg
[kubeval-hub-lnk]: https://hub.docker.com/r/cytopia/kubeval

[gfmt-git-lnk]: https://github.com/cytopia/docker-gofmt
[gfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/gofmt.svg
[gfmt-hub-lnk]: https://hub.docker.com/r/cytopia/gofmt

[gimp-git-lnk]: https://github.com/cytopia/docker-goimports
[gimp-hub-img]: https://img.shields.io/docker/pulls/cytopia/goimports.svg
[gimp-hub-lnk]: https://hub.docker.com/r/cytopia/goimports

[glint-git-lnk]: https://github.com/cytopia/docker-golint
[glint-hub-img]: https://img.shields.io/docker/pulls/cytopia/golint.svg
[glint-hub-lnk]: https://hub.docker.com/r/cytopia/golint

[elint-git-lnk]: https://github.com/cytopia/docker-eslint
[elint-hub-img]: https://img.shields.io/docker/pulls/cytopia/eslint.svg
[elint-hub-lnk]: https://hub.docker.com/r/cytopia/eslint

[cm-git-lnk]: https://github.com/cytopia/docker-checkmake
[cm-hub-img]: https://img.shields.io/docker/pulls/cytopia/checkmake.svg
[cm-hub-lnk]: https://hub.docker.com/r/cytopia/checkmake

[pcbf-git-lnk]: https://github.com/cytopia/docker-phpcbf
[pcbf-hub-img]: https://img.shields.io/docker/pulls/cytopia/phpcbf.svg
[pcbf-hub-lnk]: https://hub.docker.com/r/cytopia/phpcbf

[pcs-git-lnk]: https://github.com/cytopia/docker-phpcs
[pcs-hub-img]: https://img.shields.io/docker/pulls/cytopia/phpcs.svg
[pcs-hub-lnk]: https://hub.docker.com/r/cytopia/phpcs

[plint-git-lnk]: https://github.com/cytopia/docker-phplint
[plint-hub-img]: https://img.shields.io/docker/pulls/cytopia/phplint.svg
[plint-hub-lnk]: https://hub.docker.com/r/cytopia/phplint

[pcsf-git-lnk]: https://github.com/cytopia/docker-php-cs-fixer
[pcsf-hub-img]: https://img.shields.io/docker/pulls/cytopia/php-cs-fixer.svg
[pcsf-hub-lnk]: https://hub.docker.com/r/cytopia/php-cs-fixer

[bandit-git-lnk]: https://github.com/cytopia/docker-bandit
[bandit-hub-img]: https://img.shields.io/docker/pulls/cytopia/bandit.svg
[bandit-hub-lnk]: https://hub.docker.com/r/cytopia/bandit

[black-git-lnk]: https://github.com/cytopia/docker-black
[black-hub-img]: https://img.shields.io/docker/pulls/cytopia/black.svg
[black-hub-lnk]: https://hub.docker.com/r/cytopia/black

[mypy-git-lnk]: https://github.com/cytopia/docker-mypy
[mypy-hub-img]: https://img.shields.io/docker/pulls/cytopia/mypy.svg
[mypy-hub-lnk]: https://hub.docker.com/r/cytopia/mypy

[pycs-git-lnk]: https://github.com/cytopia/docker-pycodestyle
[pycs-hub-img]: https://img.shields.io/docker/pulls/cytopia/pycodestyle.svg
[pycs-hub-lnk]: https://hub.docker.com/r/cytopia/pycodestyle

[pyds-git-lnk]: https://github.com/cytopia/docker-pydocstyle
[pyds-hub-img]: https://img.shields.io/docker/pulls/cytopia/pydocstyle.svg
[pyds-hub-lnk]: https://hub.docker.com/r/cytopia/pydocstyle

[pylint-git-lnk]: https://github.com/cytopia/docker-pylint
[pylint-hub-img]: https://img.shields.io/docker/pulls/cytopia/pylint.svg
[pylint-hub-lnk]: https://hub.docker.com/r/cytopia/pylint

[tfdocs-git-lnk]: https://github.com/cytopia/docker-terraform-docs
[tfdocs-hub-img]: https://img.shields.io/docker/pulls/cytopia/terraform-docs.svg
[tfdocs-hub-lnk]: https://hub.docker.com/r/cytopia/terraform-docs

[tg-git-lnk]: https://github.com/cytopia/docker-terragrunt
[tg-hub-img]: https://img.shields.io/docker/pulls/cytopia/terragrunt.svg
[tg-hub-lnk]: https://hub.docker.com/r/cytopia/terragrunt

[tgfmt-git-lnk]: https://github.com/cytopia/docker-terragrunt-fmt
[tgfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/terragrunt-fmt.svg
[tgfmt-hub-lnk]: https://hub.docker.com/r/cytopia/terragrunt-fmt

[yfmt-git-lnk]: https://github.com/cytopia/docker-yamlfmt
[yfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/yamlfmt.svg
[yfmt-hub-lnk]: https://hub.docker.com/r/cytopia/yamlfmt

[ylint-git-lnk]: https://github.com/cytopia/docker-yamllint
[ylint-hub-img]: https://img.shields.io/docker/pulls/cytopia/yamllint.svg
[ylint-hub-lnk]: https://hub.docker.com/r/cytopia/yamllint


### Makefiles

Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for dependency-less, seamless project integration and minimum required best-practice code linting for CI.
The provided Makefiles will only require GNU Make and Docker itself removing the need to install anything else.


## :page_facing_up: License


**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
