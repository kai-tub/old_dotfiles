function connect --description "Connect to SLURM node with `time`/`n_cpu`/`mem` values. Connects to fish terminal."
    argparse 't/time=?' 'c/n_cpu=?' 'm/mem=?' -- $argv
    if test -z "$_flag_time"
        set _flag_time "3:30:00"
    end
    if test -z "$_flag_n_cpu"
        set _flag_n_cpu "8"
    end
    if string match -q -r -- "\d+[Gg]?[Bb]?" "$_flag_mem"
        set trim_mem (string trim --chars GgBb "$_flag_mem")
        set _flag_mem "$trim_mem""G"
        echo "Flag: $_flag_mem"
    else
        set _flag_mem "64G"
    end
    set cmd srun --time=$_flag_time --cpus-per-task=$_flag_n_cpu --mem=$_flag_mem --job-name="kaisJ" --pty /home/users/k/k.clasen/.local/bin/fish
    echo $cmd
    $cmd
end