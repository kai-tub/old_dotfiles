function fish_prompt
    # If command not found continue normally
    command -q powerline-go
    and eval powerline-go \
        -newline \
        -error $status \
        -shell bare \
        -modules "user,host,ssh,cwd,perms,git,hg,jobs,exit,root" \
        -cwd-max-depth=2 \
        -hostname-only-if-ssh \
        -cwd-mode "dironly"
end