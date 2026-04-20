#!/bin/bash

# ===== CONFIG =====
REPO_PATH="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$REPO_PATH/daily-log.md"
README_FILE="$REPO_PATH/README.md"

# Commit messages pool
MESSAGES=(
  "minor update"
  "daily progress"
  "small improvements"
  "code cleanup"
  "routine commit"
  "keeping things consistent 🚀"
  "tiny tweak"
  "refinement"
)

# Quotes (optional but makes it look human)
QUOTES=(
  "Consistency beats intensity."
  "Ship small, ship often."
  "Keep going."
  "Another day, another commit."
  "Progress over perfection."
)

# ===== RANDOMIZATION =====

# Random delay (0–10 mins)
#sleep $((RANDOM % 600))

# Pick random message & quote
MSG=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}
QUOTE=${QUOTES[$RANDOM % ${#QUOTES[@]}]}

# Timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# ===== MAIN LOGIC =====

cd "$REPO_PATH" || exit 1

# Create log file if not exists
touch "$LOG_FILE"

# Append entry
echo "$TIMESTAMP - $MSG - \"$QUOTE\"" >> "$LOG_FILE"

# Update README streak counter
COUNT=$(wc -l < "$LOG_FILE")

cat <<EOF > "$README_FILE"
# 🔥 GitHub Streak Tracker

Total Days: $COUNT

Last Update: $TIMESTAMP
EOF

# Git operations
git add .
git commit -m "$MSG"
git push

# ===== DONE =====
echo "✅ Commit pushed at $TIMESTAMP"
