if status is-interactive
end

set -g fish_greeting 
~/.local/bin/mise activate fish | source
starship init fish | source
zoxide init fish | source
alias cd="z"
source /Users/paintmi/.safe-chain/scripts/init-fish.fish # Safe-chain Fish initialization script

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/paintmi/google-cloud-sdk/path.fish.inc' ]; . '/Users/paintmi/google-cloud-sdk/path.fish.inc'; end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/paintmi/.lmstudio/bin
# End of LM Studio CLI section

