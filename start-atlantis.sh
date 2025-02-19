#!/bin/sh
set -e #This ensures that the script terminates once a command fails

. ./atlantis.var

echo $REPO_CONFIG

./atlantis server \
--atlantis-url="$URL" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST" \
--repo-config="$REPO_CONFIG" 