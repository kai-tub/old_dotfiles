for i in $HOME/bin
    if not contains $i $PATH
        # use fish_user_paths for global activation
        set -gx fish_user_paths $i $fish_user_paths
    end
end
