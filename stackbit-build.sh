#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e82e6cf889cc0001b1c33ae/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e82e6cf889cc0001b1c33ae
curl -s -X POST https://api.stackbit.com/project/5e82e6cf889cc0001b1c33ae/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e82e6cf889cc0001b1c33ae/webhook/build/publish > /dev/null
