function fish_user_key_bindings
    fish_vi_key_bindings
    if functions -q fzf_configure_bindings
        fzf_configure_bindings --directory=\cf --history=\cr --git_status=\cs --git_log=\cg --variables=\cv
    end
    for mode in insert default visual
        bind -M $mode \co forward-char
    end
end

fzf_key_bindings
