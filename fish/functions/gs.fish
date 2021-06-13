function gs --description "Calls `_fzf_search_git_status`"
    if functions -q _fzf_search_git_status
	_fzf_search_git_status $argv
    else
	echo "Need to install fzf first!"
    end
end
