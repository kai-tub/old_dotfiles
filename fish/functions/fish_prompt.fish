function fish_prompt
    # If command not found continue normally
    if command -q powerline-go
        eval powerline-go \
            -error $status \
            -newline \
            -shell bare \
            -modules "user,host,ssh,cwd,perms,git,hg,jobs,exit,root" \
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
