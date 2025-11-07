#!/usr/bin/env bash

# Exit early if jrnl isn't installed
command -v jrnl >/dev/null 2>&1 || {
  echo "❌ jrnl not found. Install it first: 'uv tool install jrnl'."
  exit 1
}

# Weekday check (Mon=1 .. Fri=5)
day_of_week=$(date +%u)
if ((day_of_week < 1 || day_of_week > 5)); then
  exit 0
fi

# Time check (07:00 <= time < 17:00)
hour=$(date +%H)
hour=$((10#$hour))
if ((hour < 7 || hour >= 17)); then
  exit 0
fi

# Cache directory and today's flag
cache_dir="$HOME/.cache/jrnl_daily"
mkdir -p "$cache_dir"
flag_file="$cache_dir/$(date +%F).lock"

# Clean up old locks
find "$cache_dir" -type f -name "*.lock" ! -newermt "$(date +%F)" -delete 2>/dev/null

# If today's lock exists, exit
if [[ -f "$flag_file" ]]; then
  exit 0
fi

# Prompt user for their plan
echo ""
echo "🗓️  Hi! What are you planning to do today?"
read -e -p "> " plan

# Only record non-empty input
if [[ -n "$plan" ]]; then
  jrnl "$plan"
  echo "✅ Saved today's plan to jrnl. Use jrnl -n 10 to see the last 10 entries."
  touch "$flag_file"
else
  echo "⚠️ Skipped empty journal entry."
fi
