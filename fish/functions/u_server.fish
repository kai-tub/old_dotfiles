function u_server
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

    # snap packages need to be updated by server
end
