if not command -q snap
    echo "Requires snap to be installed first!"
    exit 1
end

function snap_install -a tool
    if not command -q $tool
        snap install $tool --classic
    end
end

snap refresh
snap_install terminator
snap_install slack
