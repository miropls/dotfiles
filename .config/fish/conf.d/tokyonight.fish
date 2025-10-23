# # TokyoNight Color Palette
set -g custom_foreground c0caf5
set -g custom_selection 283457
set -g custom_comment 565f89
set -g custom_red f7768e
set -g custom_orange ff9e64
set -g custom_yellow e0af68
set -g custom_green 9ece6a
set -g custom_purple 9d7cd8
set -g custom_cyan 7dcfff
set -g custom_pink bb9af7
set -g custom_blue 7aa2f7

# Syntax Highlighting Colors
set -g fish_color_normal $custom_foreground
set -g fish_color_command $custom_cyan
set -g fish_color_keyword $custom_pink
set -g fish_color_quote $custom_yellow
set -g fish_color_redirection $custom_foreground
set -g fish_color_end $custom_orange
set -g fish_color_option $custom_pink
set -g fish_color_error $custom_red
set -g fish_color_param $custom_purple
set -g fish_color_comment $custom_comment
set -g fish_color_selection --background=$custom_selection
set -g fish_color_search_match --background=$custom_selection
set -g fish_color_operator $custom_green
set -g fish_color_escape $custom_pink
set -g fish_color_autosuggestion $custom_comment

# Completion Pager Colors
set -g fish_pager_color_progress $custom_comment
set -g fish_pager_color_prefix $custom_cyan
set -g fish_pager_color_completion $custom_foreground
set -g fish_pager_color_description $custom_comment
set -g fish_pager_color_selected_background --background=$custom_selection
