# Add to ~/.oh-my-zsh/custom/plugins/logout-user/logout-user.plugin.zsh
function logout-user() {
  # Show help if no arguments or help flag
  if [[ $# -eq 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Log out another macOS user session"
    echo "uses \`sudo launchctl bootout gui/\$uid\`"
    echo "Usage:   logout-user [username]"
    echo "Example: logout-user steve"
    echo "Options:"
    echo "  -n, --dry-run:  Dry run (show command only)"
    echo "  -h, --help:     Display this message"
    return 0
  fi

  local target_user=""
  local dry_run=false

  # Handle dry-run flag
  if [[ "$1" == "-n" ]] || [[ "$1" == "--dry-run" ]]; then
    dry_run=true
    target_user="$2"
  else
    target_user="$1"
  fi

  # Validate username is provided
  if [[ -z "$target_user" ]]; then
    echo "❌ Error: No username provided"
    return 1
  fi

  # Validate user exists
  if ! id -u "$target_user" >/dev/null 2>&1; then
    echo "❌ Error: User '$target_user' not found"
    return 1
  fi

  # Get UID and validate
  local uid=$(id -u "$target_user")
  if [[ $uid -eq 0 ]]; then
    echo "⛔️ Critical: Cannot log out root user" >&2
    return 2
  fi

  # Build command
  local cmd="sudo launchctl bootout gui/$uid"

  # Execute based on dry-run flag
  if $dry_run; then
    echo "DRY RUN: Would execute:"
    echo "$cmd"
  else
    echo "Logging out $target_user (UID: $uid)..."
    echo -n "Confirm logout? (y/N): "
    read -r REPLY
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      if $cmd; then
        echo "✅ Success - $target_user's session terminated"
      else
        echo "❌ Failed to log out $target_user - Check permissions (need admin rights)"
        return 1
      fi
    else
      echo "🛑 Operation cancelled"
    fi
  fi
}

# Add completion for usernames
compdef _users logout-user
