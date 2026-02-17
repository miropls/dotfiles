# disable greeting #
set -U fish_greeting

# basics #
set -gx EDITOR hx
set -gx VISUAL hx
set -gx XDG_CONFIG_HOME $HOME/.config

# Claude
set -gx CLAUDE_CODE_USE_BEDROCK 1
set -gx AWS_REGION eu-central-1
set -gx ANTHROPIC_MODEL eu.anthropic.claude-sonnet-4-5-20250929-v1:0
set -gx AWS_PROFILE agent47
