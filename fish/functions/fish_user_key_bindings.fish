function fish_user_key_bindings
    fish_vi_key_bindings
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
    for mode in insert default visual
        bind -M $mode \co forward-char
    end
end
