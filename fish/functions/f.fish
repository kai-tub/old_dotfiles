function f -d "Correct your previous console command"
    set -l fucked_up_command $history[1]
    if ! command -q thefuck
        echo "You first need to install thefuck!"
    end
    env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
    if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge ^/dev/null
    end
end
