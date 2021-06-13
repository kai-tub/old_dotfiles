function gl --description "Calls `_fzf_search_git_log`"
    if functions -q _fzf_search_git_log
	_fzf_search_git_log $argv
    else
	echo "Need to install fzf first!"
    end
end
