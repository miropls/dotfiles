function fish_prompt
    # set -g __fish_git_prompt_use_informative_chars 1
    # set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_color $custom_green
    set -g __fish_git_prompt_color_prefix $custom_cyan
    set -g __fish_git_prompt_color_suffix $custom_cyan
    # set -g __fish_git_prompt_color_branch_dirty $custom_orange
    # set -g __fish_git_prompt_char_dirtystate "*"
    set -l last_status $status
    set -l stat
    set -l chevron_color $custom_purple

    if test $last_status -ne 0
        set stat (set_color $custom_red)"[$last_status]"(set_color normal)
        set chevron_color $custom_red
    end

    echo (set_color $custom_blue)(prompt_pwd)(set_color $custom_orange)(fish_git_prompt) $stat (set_color $chevron_color) ""
end
