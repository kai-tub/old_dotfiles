function c --description "Searches current directory with preview and calls the command `code`"
    # Code from https://github.com/PatrickF1/fzf.fish/blob/main/functions/__fzf_search_shell_variables.fish
    # Make sure that fzf uses fish to execute __echo_value_or_print_message, which
    # is an autoloaded fish function so doesn't exist in other shells.
    # Using --local so that it does not clobber SHELL outside of this function.
    set --local --export SHELL (command --search fish)

    if not command -q fd or not command -q fzf
        echo "First install `fd` and `fzf`!"
        echo "Cannot do my magic otherwise."
        return
    end

    if test -z "$EDITOR"
        echo "You need to define EDITOR first!"
        return
    end


    set file_paths_selected (
        fd --hidden --follow --color=always --exclude=.git 2>/dev/null |
        fzf --multi --ansi --preview='__fzf_preview_file {}'
    )

    set --local my_cmd "$EDITOR"

    if test $status -eq 0
        for path in $file_paths_selected
            set escaped_path (string escape "$path")
            set --append my_cmd "$escaped_path"
        end
    end

    $my_cmd
end
