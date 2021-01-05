function ls
    if command -q exa
        exa --icons $argv
    else
        set -l opt --color=auto
        isatty stdout
        and set -a opt -F
        command ls $opt $argv
    end
end
