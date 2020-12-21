if command -q code
    set -gx EDITOR (which code)
else if command -q vim
    set -gx EDITOR (which vim)
else if command -q vi
    set -gx EDITOR (which vi)
else if command -q nano
    set -gx EDITOR (which nano)
end
