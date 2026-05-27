#!/bin/bash
# 🔧 Reassemble parts back to original file
PARTS_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_FILE="${PARTS_DIR}/part_000"
echo "🔄 Reassembling parts into: $OUTPUT_FILE"
cat "${PARTS_DIR}"/part_* > "$OUTPUT_FILE"
echo "✅ Done. File size: $(stat -c%s "$OUTPUT_FILE") bytes"
