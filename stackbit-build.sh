#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5da892cfa08759001ca46fff/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5da892cfa08759001ca46fff
curl -s -X POST https://api.stackbit.com/project/5da892cfa08759001ca46fff/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5da892cfa08759001ca46fff/webhook/build/publish > /dev/null
