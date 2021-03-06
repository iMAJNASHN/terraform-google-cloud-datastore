#!/usr/bin/env bash

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

if [[ $# -lt 3 ]]; then
  echo "usage: destroy-indexes.sh <credentials> <project> <indexes_file>" 1>&2
  exit 1
fi

CREDENTIALS=$1
PROJECT=$2
INDEXES_FILE=$3

export CLOUDSDK_AUTH_CREDENTIAL_FILE_OVERRIDE="$CREDENTIALS"

gcloud datastore indexes cleanup "$INDEXES_FILE" --project="$PROJECT" --quiet
