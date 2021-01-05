function fish_prompt
    # If command not found continue normally
    if command -q starship
        # Add newlines
        echo

        switch "$fish_key_bindings"
            case fish_hybrid_key_bindings fish_vi_key_bindings
                set keymap "$fish_bind_mode"
            case '*'
                set keymap insert
        end
        set -l exit_code $status
        # Account for changes in variable name between v2.7 and v3.0
        set -l starship_duration "$CMD_DURATION$cmd_duration"
        set -l _cmd (which starship)

        command "$_cmd" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
        # disable virtualenv prompt, it breaks starship
        set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
        export STARSHIP_SHELL="fish"

        # Set up the session key that will be used to store logs
        export STARSHIP_SESSION_KEY=("$_cmd" session)

    else if command -q powerline-go
        # if command -q powerline-go
        eval powerline-go \
            -error $status \
            -newline \
            -shell bare \
            -modules "venv,user,host,ssh,perms,git,hg,jobs,exit,root" \
            -cwd-max-depth 4 \
            -hostname-only-if-ssh \
            -cwd-mode "fancy" \
            -mode "patched"
    else
        set_color $fish_color_cwd
        echo -n (prompt_pwd)
        set_color normal
        echo -n ' > '
    end
    # modules right needs to be configured via fish
end
