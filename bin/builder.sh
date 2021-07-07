#!/bin/bash

set -e

VERSION=${1}

CODENAME=$(. /etc/os-release && echo ${VERSION_CODENAME})

NAME=ruby
ARCH=$(uname -p)
BUILD_ARGS=

if [[ "${DEBUG}" == "true" ]]; then
  BUILD_ARGS="-v"
fi

SEMVER_REGEX="^(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))?(\.(0|[1-9][0-9]*))?([a-z-].*)?$"

function check_semver () {
  if [[ ! "${1}" =~ ${SEMVER_REGEX} ]]; then
    echo Not a semver like version - aborting: ${1} >&2
    exit 1
  fi
  export MAJOR=${BASH_REMATCH[1]}
  export MINOR=${BASH_REMATCH[3]}
  export PATCH=${BASH_REMATCH[5]}
}

if [[ ! -f "/usr/local/share/ruby-build/${VERSION}" ]]; then
  echo "Missing build definition for ${VERSION}. Trying to find older patch build definition"
  check_semver ${VERSION}
  if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
    echo Invalid version: ${TOOL_VERSION} >&2
    exit 1
  fi
  oldVersion=$(find /usr/local/share/ruby-build -type f -name "${MAJOR}.${MINOR}.*" -printf '%f\n' | grep -P '^\d+\.\d+.\d+$' | sort --version-sort -r | head -n 1)

  if [[ -z $oldVersion ]]; then
    echo "No usable definition found" >&2
    exit 1
  fi

  echo "Using version $oldVersion"

  cp /usr/local/share/ruby-build/$oldVersion /usr/local/share/ruby-build/${VERSION}
  sed -i "s/ruby-${oldVersion}/ruby-${VERSION}/g" /usr/local/share/ruby-build/${VERSION}
  sed -i -E 's/#[a-z0-9]+"/"/' /usr/local/share/ruby-build/${VERSION}
  cat /usr/local/share/ruby-build/${VERSION}
fi

echo "Building ${NAME} ${VERSION} for ${CODENAME}"
ruby-build ${BUILD_ARGS} ${VERSION} /usr/local/${NAME}/${VERSION}

/usr/local/${NAME}/${VERSION}/bin/ruby -v

echo "Compressing ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
tar -cJf /cache/${NAME}-${VERSION}-${CODENAME}-${ARCH}.tar.xz -C /usr/local/${NAME} ${VERSION}
