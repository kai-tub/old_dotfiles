function lab --description "Activate `lab` conda environment and start `jupyter lab` with `mem` value. (default 28GB)"
    argparse 'm/mem=?' -- $argv
    if test -z "$_flag_mem"
        set _flag_mem 28
    end
    set GB 1000000000
    set mem (math -s0 "$_flag_mem" x "$GB")
    echo "Reserved memory: $_flag_mem GB or $mem B"
    conda activate lab
    jupyter lab --no-browser --ip=0.0.0.0 --port=18888 --NotebookApp.token='' --NotebookApp.max_buffer_size=$mem
end
