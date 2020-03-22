#!/usr/bin/env bash
if pgrep dunst > /dev/null; then
    notify-send \
      --icon="rss" \
      --app-name="newsboat" \
      "newsboat" "$@"
fi
