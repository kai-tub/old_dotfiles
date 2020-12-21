function tunnel # -a "node" "hostport" "port"
    argparse 'n/node=?' 'h/hostport=?' 'l/localport=?' -- $argv
    if test -z "$_flag_node"
        set _flag_node "131"
    end
    if test -z "$_flag_hostport"
        set _flag_hostport "18888"
    end
    if test -z "$_flag_localport"
        set _flag_localport "8888"
    end
    # cluster is defined in ssh host file
    set cmd "ssh -NL $_flag_localport:node$_flag_node:$_flag_hostport cluster"
    echo "$cmd"
    eval $cmd
end
