#!/usr/bin/env bash
# =============================================================================
# Obsidian Learning Path Setup Script
# Usage: bash setup.sh /path/to/obsidian-vault [--update]
# =============================================================================

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VAULT_DIR="$1"
MODE="${2:-install}"

# ─── Colors ───────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { echo -e "${BLUE}→${RESET} $1"; }
success() { echo -e "${GREEN}✓${RESET} $1"; }
warn()    { echo -e "${YELLOW}⚠${RESET} $1"; }
error()   { echo -e "${RED}✗${RESET} $1" >&2; exit 1; }
header()  { echo -e "\n${BOLD}$1${RESET}"; }

# ─── Validate args ────────────────────────────────────────────────────────────
[[ -z "$VAULT_DIR" ]] && error "Usage: bash setup.sh /path/to/obsidian-vault [--update]"
[[ ! -d "$VAULT_DIR" ]] && error "Vault directory not found: $VAULT_DIR"
[[ ! -d "$VAULT_DIR/.obsidian" ]] && error "No .obsidian folder found at $VAULT_DIR — is this an Obsidian vault?"

echo ""
echo -e "${BOLD}Obsidian Learning Path — Setup${RESET}"
echo "Vault: $VAULT_DIR"
echo "Mode:  ${MODE/--/}"
echo ""

# ─── Prompt for subject (only on fresh install) ───────────────────────────────
if [[ "$MODE" != "--update" ]]; then
  header "Configure Your Learning Path"

  read -rp "  Subject name (e.g. 'Rust', 'Linear Algebra', 'C Programming'): " SUBJECT
  [[ -z "$SUBJECT" ]] && error "Subject name cannot be empty"

  read -rp "  Learning folder name in vault [Learning]: " LEARN_FOLDER
  LEARN_FOLDER="${LEARN_FOLDER:-Learning}"

  read -rp "  What is your learning goal? (one sentence): " GOAL
  [[ -z "$GOAL" ]] && error "Goal cannot be empty"

  echo ""
  info "You can add your resources later by editing CLAUDE.md in the vault"
else
  # In update mode, detect existing config
  LEARN_FOLDER="Learning"
  SUBJECT=""
  # Try to find existing subject folder
  if ls "$VAULT_DIR/$LEARN_FOLDER/" &>/dev/null; then
    for d in "$VAULT_DIR/$LEARN_FOLDER"/*/; do
      [[ -f "$d/CLAUDE.md" ]] && SUBJECT=$(basename "$d") && break
    done
  fi
  [[ -z "$SUBJECT" ]] && error "Could not detect existing subject folder. Run without --update for a fresh install."
  info "Updating existing setup for subject: $SUBJECT"
fi

# ─── Derived paths ────────────────────────────────────────────────────────────
OBSIDIAN_DIR="$VAULT_DIR/.obsidian"
PLUGINS_DIR="$OBSIDIAN_DIR/plugins"
TEMPLATES_DIR="$VAULT_DIR/$LEARN_FOLDER/Templates"
SUBJECT_DIR="$VAULT_DIR/$LEARN_FOLDER/$SUBJECT"
COMMANDS_DIR="$SUBJECT_DIR/.claude/commands"

# ─── Create folder structure ──────────────────────────────────────────────────
header "Creating Folder Structure"

mkdir -p \
  "$TEMPLATES_DIR" \
  "$SUBJECT_DIR/Concept Notes" \
  "$SUBJECT_DIR/Feynman" \
  "$SUBJECT_DIR/Flashcards" \
  "$SUBJECT_DIR/Weekly Reviews" \
  "$COMMANDS_DIR" \
  "$PLUGINS_DIR"

# Create resource folders if not updating
if [[ "$MODE" != "--update" ]]; then
  mkdir -p \
    "$SUBJECT_DIR/Resources" \
    "$SUBJECT_DIR/.claude"
fi

success "Folder structure created"

# ─── Install plugins ──────────────────────────────────────────────────────────
header "Installing Obsidian Plugins"

install_plugin() {
  local id="$1"
  local repo="$2"
  local dir="$PLUGINS_DIR/$id"
  mkdir -p "$dir"
  info "Downloading $id..."
  curl -sL "https://github.com/$repo/releases/latest/download/main.js" -o "$dir/main.js"
  curl -sL "https://github.com/$repo/releases/latest/download/manifest.json" -o "$dir/manifest.json"
  curl -sL "https://github.com/$repo/releases/latest/download/styles.css" -o "$dir/styles.css" 2>/dev/null || true
  success "$id installed ($(wc -c < "$dir/main.js" | tr -d ' ') bytes)"
}

install_plugin "templater-obsidian"         "SilentVoid13/Templater"
install_plugin "dataview"                   "blacksmithgu/obsidian-dataview"
install_plugin "obsidian-spaced-repetition" "st3v3nmw/obsidian-spaced-repetition"

# Enable plugins
cat > "$OBSIDIAN_DIR/community-plugins.json" \
  '["templater-obsidian","dataview","obsidian-spaced-repetition"]'

# Configure templates folder
cat > "$OBSIDIAN_DIR/templates.json" \
  "{\"folder\": \"$LEARN_FOLDER/Templates\"}"

# Enable core properties plugin
if [[ -f "$OBSIDIAN_DIR/core-plugins.json" ]]; then
  # Enable properties if disabled
  sed -i '' 's/"properties": false/"properties": true/g' "$OBSIDIAN_DIR/core-plugins.json" 2>/dev/null || true
fi

success "Plugins enabled in .obsidian"

# ─── Copy templates ───────────────────────────────────────────────────────────
header "Installing Templates"

cp -f "$REPO_DIR/templates/"*.md "$TEMPLATES_DIR/"
success "Templates copied to $TEMPLATES_DIR"

# ─── Copy Claude commands ──────────────────────────────────────────────────────
header "Installing Claude Commands"

cp -f "$REPO_DIR/.claude/commands/"*.md "$COMMANDS_DIR/"
success "Claude commands copied to $COMMANDS_DIR"

# ─── Copy Dashboard ───────────────────────────────────────────────────────────
header "Installing Dashboard"

if [[ ! -f "$SUBJECT_DIR/Dashboard.md" ]] || [[ "$MODE" == "--update" ]]; then
  # Substitute subject name into dashboard
  sed "s/\[SUBJECT\]/$SUBJECT/g" "$REPO_DIR/vault/Dashboard.md" > "$SUBJECT_DIR/Dashboard.md"
  success "Dashboard installed"
else
  warn "Dashboard.md already exists — skipping (use --update to overwrite)"
fi

# ─── Write CLAUDE.md ─────────────────────────────────────────────────────────
header "Configuring CLAUDE.md"

if [[ "$MODE" == "--update" ]]; then
  warn "CLAUDE.md not overwritten in update mode — your configuration is preserved"
else
  sed \
    -e "s|\[SUBJECT\]|$SUBJECT|g" \
    -e "s|\[GOAL\]|$GOAL|g" \
    -e "s|\[LEARN_FOLDER\]|$LEARN_FOLDER|g" \
    "$REPO_DIR/CLAUDE.md" > "$SUBJECT_DIR/CLAUDE.md"
  success "CLAUDE.md written with your configuration"
fi

# ─── Write .claude/settings.local.json ───────────────────────────────────────
if [[ ! -f "$SUBJECT_DIR/.claude/settings.local.json" ]]; then
  cat > "$SUBJECT_DIR/.claude/settings.local.json" <<EOF
{
  "permissions": {
    "allow": [
      "Read($VAULT_DIR/**)"
    ]
  }
}
EOF
  success "Claude permissions configured"
fi

# ─── Summary ──────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}Setup Complete${RESET}"
echo ""
echo "  Vault:     $VAULT_DIR"
echo "  Subject:   $SUBJECT"
echo "  Dashboard: $SUBJECT_DIR/Dashboard.md"
echo "  CLAUDE.md: $SUBJECT_DIR/CLAUDE.md"
echo ""
echo -e "${BOLD}Next steps:${RESET}"
echo "  1. Restart Obsidian"
echo "  2. Settings → Community Plugins → enable Templater, Dataview, Spaced Repetition"
echo "  3. Settings → Templater → set template folder to: $LEARN_FOLDER/Templates"
echo "  4. Edit $SUBJECT_DIR/CLAUDE.md → add your learning resources"
echo "  5. Run Claude from $SUBJECT_DIR:"
echo ""
echo "     cd \"$SUBJECT_DIR\""
echo "     claude"
echo ""
echo "  6. Type /study-session to begin"
echo ""
