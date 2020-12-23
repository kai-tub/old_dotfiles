function fish_prompt
    # If command not found continue normally
    command -q powerline-go
    and eval powerline-go \
        -error $status \
        -newline \
        -shell bare \
        -modules "user,host,ssh,cwd,perms,git,hg,jobs,exit,root" \
        -cwd-max-depth 4 \
        -hostname-only-if-ssh \
        -cwd-mode "fancy" \
        -mode "patched"
    # modules right needs to be configured via fish
end
