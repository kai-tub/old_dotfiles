function sv --description "Search through variables, by calling `__fzf_search_shell_variables`"
	__fzf_search_shell_variables (set --show | psub) (set --names | psub)
end
