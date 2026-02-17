fish_add_path DOTNET_ROOT "$(dirname $(which dotnet))"
# Exports
fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path /opt/homebrew/bin

# Go
fish_add_path /usr/local/go/bin
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.local/bin"

# Android
fish_add_path $HOME/Library/Android/sdk
fish_add_path $HOME/Library/Android/emulator:$ANDROID_HOME/platform-tools

# Odin
fish_add_path $HOME/odin

# Bun
fish_add_path $HOME/.bun/bin

# Cargo
fish_add_path $HOME/.cargo/bin
