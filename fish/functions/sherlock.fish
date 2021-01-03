function sherlock --description "Hunt down social media accounts by username across social networks"
    if not command -q docker
        echo "This command requires docker to be installed!"
        return
    end
    # rm - Remove after
    # t - pseudo-tty session with colored output
    docker run --rm -t theyahya/sherlock --print-found $argv
end
