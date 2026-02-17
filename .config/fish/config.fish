if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    mise activate fish | source
else
    mise activate fish --shims | source
end

# opencode
fish_add_path /Users/paintmi/.opencode/bin
