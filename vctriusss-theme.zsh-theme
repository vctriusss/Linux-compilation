# ref: https://github.com/tarneaux/.f/blob/master/zsh/.config/zsh/git_info.zsh
function __git_symbols() {
	# Symbols
	local ahead='↑'
	local behind='↓'
	local diverged='↕'
	local staged='+'
	local untracked='?'
	local moved='>'
	local deleted='x'
	local stashed='$'

	local output_symbols=''

	local git_status_v
	git_status_v="$(git status --porcelain=v2 --branch --show-stash 2>/dev/null)"

	# AHEAD, BEHIND, DIVERGED
	local ahead_count behind_count
	if echo $git_status_v | grep -q "^# branch.ab " ; then
		read -d "\n" -r ahead_count behind_count <<< $(echo "$git_status_v" | grep "^# branch.ab" | grep -o -E '[+-][0-9]+' | sed 's/[-+]//')
		# Show the ahead and behind symbols when relevant
		[[ $ahead_count != 0 ]] && output_symbols+="%{$fg[green]%}$ahead$ahead_count %{$reset_color%}"
		[[ $behind_count != 0 ]] && output_symbols+="%{$fg[red]%}$behind$behind_count %{$reset_color%}"
		# Replace the ahead symbol with the diverged symbol when both ahead and behind
		# output_symbols="${output_symbols//$ahead$behind/$diverged}"
	fi

	# STASHED, STAGED
	local stash_count staged_count
	echo $git_status_v | grep -q "^# stash " && output_symbols+="%{$fg[green]%}$stashed %{$reset_color%}"

	staged_count=$(git diff --name-only --cached --shortstat | wc -l)
	[[ $staged_count != 0 ]] && output_symbols+="$staged$staged_count "

	# For the rest of the symbols, we use the v1 format of git status because it's easier to parse
	local symbols
	symbols="$(git status --porcelain=v1 | cut -c1-2 | sed 's/ //g' | sort -n | uniq -c)"

	while IFS= read -r line; do
		count=$(echo "$line" | awk '{print $1}')
		symbol=$(echo "$line" | awk '{print $2}')
		case $symbol in
			??) output_symbols+="%{$fg[cyan]%}$untracked$count %{$reset_color%}";;
			D) output_symbols+="%{$fg[red]%}$deleted$count %{$reset_color%}";;
			M) output_symbols+="%{$fg[yellow]%}$modified$count %{$reset_color%}";;
			R) output_symbols+="%{$fg[cyan]%}$moved$count %{$reset_color%}";;
		esac
	done <<< "$symbols"
	# output_symbols="${output_symbols#" %{$reset_color%}"}%{$reset_color%}"
	# ${string#"$prefix"}

	[[ -n $output_symbols ]] && echo -n " $output_symbols"
}


# Function to display Git status with symbols
function __git_info() {
	local git_info=''

	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		local git_branch_name
		git_branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)"
		if [[ -n "$git_branch_name" ]]; then
			git_info+="%{$fg[magenta]%}󰘬 $git_branch_name%{$reset_color%}"
		fi

		echo "[$git_info$(__git_symbols)] "
	fi
}

PROMPT="%{$fg[cyan]%}%~%{$reset_color%}"
PROMPT+=' $(__git_info)'
PROMPT+='%(?:%{$fg_bold[green]%}%1{»%} :%{$fg_bold[red]%}%1{»%} )%{$reset_color%}'
# » ➜ 
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
