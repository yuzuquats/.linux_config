#!/usr/bin/env bash

# Exit on error
set -o errexit
# Exit when script uses undeclared variables
set -o nounset
# Return the exit status of th elast command that threw a non-zero exit code
set -o pipefail
# Uncomment to trace what gets executed
#set -o xtrace

# /Users/jameskao/personal/calendar
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# /Users/jameskao/personal/calendar/build.sh
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
# build
__base="$(basename ${__file} .sh)"
# /Users/jameskao/personal
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

__wasmax="${HOME}/whatsapp/smax"
__wacommon="${HOME}/whatsapp/common"
__wacf="${HOME}/whatsapp/cf"

echo $__wasmax
echo $__wacommon
echo $__wacf

# Clean Binary
rm -rf "$__wasmax/smaxc"

# Make
cd $__wasmax
make wamsys-install
make smaxc
cp smaxc "$__wacommon/smax/bin"

# Clean old smax generated files
# NOTE(jameskao): wildcard commands (*) must be outside of quotes
rm -rf "$__wacommon/smax/Generated/wa-msys/Dev"/*
rm -rf "$__wacf/src/wa-msys/src/WhatsAppCoreSMAXGenerated"/*

# Generate smax test files
cd "$__wasmax"
./smaxc c WCS "$__wacf/test/wa-msys/WhatsAppCoreSMAXGenerated" \
   TestSchemas/shared.xml \
   TestSchemas/all_features.xml \
   TestSchemas/mixins.xml \
   TestSchemas/rpc.xml

# Generate smax files
cd "$__wacommon/smax"
./wamsys.sh Dev 1

# Copy smax generated files to
#cp "$__wacommon/smax/Generated/wa-msys/Dev/*" ~/fbsource/xplat/wa-msys/src/WhatsAppCoreSMAXGenerated
cp "$__wacommon/smax/Generated/wa-msys/Dev/"* "$__wacf/src/wa-msys/src/WhatsAppCoreSMAXGenerated"

exit 0
