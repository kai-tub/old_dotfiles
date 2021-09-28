function u
    sudo apt-get update
    and sudo apt-get upgrade -y

    if command -q flatpak
        flatpak update -y
    end

    if command -q pipx
        pipx upgrade-all
    end

    if command -q fisher
        fisher update
    end

    if command -q mamba
        mamba update --name base mamba -y
    end

    if command -q snap
        sudo snap refresh
    end
end
