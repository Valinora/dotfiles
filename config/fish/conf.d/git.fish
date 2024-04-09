#
# Settings
#

# Log colour scheme has bold yellow commit hash, bold blue author, cyan date, auto ref names
# See https://git-scm.com/docs/pretty-formats
set -g _git_log_fuller_format '%C(bold yellow)commit %H%C(auto)%d%n%C(bold)Author: %C(blue)%an <%ae> %C(reset)%C(cyan)%ai (%ar)%n%C(bold)Commit: %C(blue)%cn <%ce> %C(reset)%C(cyan)%ci (%cr)%C(reset)%n%+B'
set -g _git_log_oneline_format '%C(bold yellow)%h%C(reset) %s%C(auto)%d%C(reset)'
set -g _git_log_oneline_medium_format '%C(bold yellow)%h%C(reset) %<(50,trunc)%s %C(bold blue)%an %C(reset)%C(cyan)%as (%ar)%C(auto)%d%C(reset)'
# set -l gmodule_home $(0:A:h)

#
# abbr -aes
#
set gprefix "g"

# Git

# Branch (b)
abbr -a "$gprefix"b git branch
abbr -a "$gprefix"bc 'git checkout -b'
abbr -a "$gprefix"bd 'git checkout --detach'
abbr -a "$gprefix"bl 'git branch -vv'
abbr -a "$gprefix"bL 'git branch --all -vv'
abbr -a "$gprefix"bm 'git branch --move'
abbr -a "$gprefix"bM 'git branch --move --force'
abbr -a "$gprefix"bR 'git branch --force'
abbr -a "$gprefix"bs 'git show-branch'
abbr -a "$gprefix"bS 'git show-branch --all'
abbr -a "$gprefix"bu 'git branch --unset-upstream'
abbr -a "$gprefix"bG 'git-branch-remote-tracking gone | xargs -r git branch --delete --force'
abbr -a "$gprefix"bx 'git-branch-delete-interactive'
abbr -a "$gprefix"bX 'git-branch-delete-interactive --force'

# Commit (c)
abbr -a "$gprefix"c 'git commit --verbose'
abbr -a "$gprefix"ca 'git commit --verbose --all'
abbr -a "$gprefix"cA 'git commit --verbose --patch'
abbr -a "$gprefix"cm 'git commit --message'
abbr -a "$gprefix"co 'git checkout'
abbr -a "$gprefix"cO 'git checkout --patch'
abbr -a "$gprefix"cf 'git commit --amend --reuse-message HEAD'
abbr -a "$gprefix"cF 'git commit --verbose --amend'
abbr -a "$gprefix"cp 'git cherry-pick'
abbr -a "$gprefix"cP 'git cherry-pick --no-commit'
abbr -a "$gprefix"cr 'git revert'
abbr -a "$gprefix"cR 'git reset "HEAD^"'
abbr -a "$gprefix"cs 'git show --pretty=format:"$_git_log_fuller_format"'
abbr -a "$gprefix"cS 'git commit --verbose -S'
abbr -a "$gprefix"cu 'git commit --fixup'
abbr -a "$gprefix"cU 'git commit --squash'
abbr -a "$gprefix"cv 'git verify-commit'

# Conflict (C)
abbr -a "$gprefix"Cl 'git --no-pager diff --diff-filter U --name-only'
abbr -a "$gprefix"Ca 'git add "$gprefix"Cl'
abbr -a "$gprefix"Ce 'git mergetool "$gprefix"Cl'
abbr -a "$gprefix"Co 'git checkout --ours --'
abbr -a "$gprefix"CO "'$gprefix'Co '$gprefix'Cl"
abbr -a "$gprefix"Ct 'git checkout --theirs --'
abbr -a "$gprefix"CT "'$gprefix'Ct '$gprefix'Cl"

# Data (d)
abbr -a "$gprefix"d 'git ls-files'
abbr -a "$gprefix"dc 'git ls-files --cached'
abbr -a "$gprefix"dx 'git ls-files --deleted'
abbr -a "$gprefix"dm 'git ls-files --modified'
abbr -a "$gprefix"du 'git ls-files --other --exclude-standard'
abbr -a "$gprefix"dk 'git ls-files --killed'
abbr -a "$gprefix"di 'git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
abbr -a "$gprefix"f 'git fetch'
abbr -a "$gprefix"fa 'git fetch --all'
abbr -a "$gprefix"fp 'git fetch --all --prune'
abbr -a "$gprefix"fc 'git clone'
abbr -a "$gprefix"fm 'git pull --no-rebase'
abbr -a "$gprefix"fr 'git pull --rebase'
abbr -a "$gprefix"fu 'git pull --ff-only --all --prune'

# Grep (g)
abbr -a "$gprefix"g 'git grep'
abbr -a "$gprefix"gi 'git grep --ignore-case'
abbr -a "$gprefix"gl 'git grep --files-with-matches'
abbr -a "$gprefix"gL 'git grep --files-without-match'
abbr -a "$gprefix"gv 'git grep --invert-match'
abbr -a "$gprefix"gw 'git grep --word-regexp'

# Help (h)
abbr -a "$gprefix"h 'git help'

# Index (i)
abbr -a "$gprefix"ia 'git add'
abbr -a "$gprefix"iA 'git add --patch'
abbr -a "$gprefix"iu 'git add --update'
abbr -a "$gprefix"id 'git diff --no-ext-diff --cached'
abbr -a "$gprefix"iD 'git diff --no-ext-diff --cached --word-diff'
abbr -a "$gprefix"ir 'git reset'
abbr -a "$gprefix"iR 'git reset --patch'
abbr -a "$gprefix"ix 'git rm --cached -r'
abbr -a "$gprefix"iX 'git rm --cached -rf'

# Log (l)
abbr -a "$gprefix"l 'git log --topo-order --pretty=format:"$_git_log_fuller_format"'
abbr -a "$gprefix"ls 'git log --topo-order --stat --pretty=format:"$_git_log_fuller_format"'
abbr -a "$gprefix"ld 'git log --topo-order --stat --patch --pretty=format:"$_git_log_fuller_format"'
abbr -a "$gprefix"lf 'git log --topo-order --stat --patch --follow --pretty=format:"$_git_log_fuller_format"'
abbr -a "$gprefix"lo 'git log --topo-order --pretty=format:"$_git_log_oneline_format"'
abbr -a "$gprefix"lO 'git log --topo-order --pretty=format:"$_git_log_oneline_medium_format"'
abbr -a "$gprefix"lg 'git log --graph --pretty=format:"$_git_log_oneline_format"'
abbr -a "$gprefix"lG 'git log --graph --pretty=format:"$_git_log_oneline_medium_format"'
abbr -a "$gprefix"lv 'git log --topo-order --show-signature --pretty=format:"$_git_log_fuller_format"'
abbr -a "$gprefix"lc 'git shortlog --summary --numbered'
abbr -a "$gprefix"lr 'git reflog'

# Merge (m)
abbr -a "$gprefix"m 'git merge'
abbr -a "$gprefix"ma 'git merge --abort'
abbr -a "$gprefix"mc 'git merge --continue'
abbr -a "$gprefix"mC 'git merge --no-commit'
abbr -a "$gprefix"mF 'git merge --no-ff'
abbr -a "$gprefix"ms 'git merge --squash'
abbr -a "$gprefix"mS 'git merge -S'
abbr -a "$gprefix"mv 'git merge --verify-signatures'
abbr -a "$gprefix"mt 'git mergetool'

# Push (p)
abbr -a "$gprefix"p 'git push'
abbr -a "$gprefix"pf 'git push --force-with-lease'
abbr -a "$gprefix"pF 'git push --force'
abbr -a "$gprefix"pa 'git push --all'
abbr -a "$gprefix"pA 'git push --all && git push --tags --no-verify'
abbr -a "$gprefix"pt 'git push --tags'
abbr -a "$gprefix"pc 'git push --set-upstream origin "$(git-branch-current 2>/dev/null)"'
abbr -a "$gprefix"pp 'git pull origin "$(git-branch-current 2>/dev/null)" && git push origin "$(git-branch-current 2>/dev/null)"'

# Rebase (r)
abbr -a "$gprefix"r 'git rebase'
abbr -a "$gprefix"ra 'git rebase --abort'
abbr -a "$gprefix"rc 'git rebase --continue'
abbr -a "$gprefix"ri 'git rebase --interactive --autosquash'
abbr -a "$gprefix"rs 'git rebase --skip'
abbr -a "$gprefix"rS 'git rebase --exec "git commit --amend --no-edit --no-verify -S"'

# Remote (R)
abbr -a "$gprefix"R 'git remote'
abbr -a "$gprefix"Rl 'git remote --verbose'
abbr -a "$gprefix"Ra 'git remote add'
abbr -a "$gprefix"Rx 'git remote rm'
abbr -a "$gprefix"Rm 'git remote rename'
abbr -a "$gprefix"Ru 'git remote update'
abbr -a "$gprefix"Rp 'git remote prune'
abbr -a "$gprefix"Rs 'git remote show'
abbr -a "$gprefix"RS 'git remote set-url'

# Stash (s)
abbr -a "$gprefix"s 'git stash'
abbr -a "$gprefix"sa 'git stash apply'
abbr -a "$gprefix"sx 'git stash drop'
abbr -a "$gprefix"sX 'git-stash-clear-interactive'
abbr -a "$gprefix"sl 'git stash list'
abbr -a "$gprefix"sd 'git stash show --patch --stat'
abbr -a "$gprefix"sp 'git stash pop'
abbr -a "$gprefix"sr 'git-stash-recover'
abbr -a "$gprefix"ss 'git stash save --include-untracked'
abbr -a "$gprefix"sS 'git stash save --patch --no-keep-index'
abbr -a "$gprefix"sw 'git stash save --include-untracked --keep-index'
abbr -a "$gprefix"si 'git stash push --staged' # requires Git 2.35
abbr -a "$gprefix"su 'git stash show --patch | git apply --reverse'

# Submodule (S)
abbr -a "$gprefix"S 'git submodule'
abbr -a "$gprefix"Sa 'git submodule add'
abbr -a "$gprefix"Sf 'git submodule foreach'
abbr -a "$gprefix"Si 'git submodule init'
abbr -a "$gprefix"SI 'git submodule update --init --recursive'
abbr -a "$gprefix"Sl 'git submodule status'
abbr -a "$gprefix"Sm 'git-submodule-move'
abbr -a "$gprefix"Ss 'git submodule sync'
abbr -a "$gprefix"Su 'git submodule update --remote'
abbr -a "$gprefix"Sx 'git-submodule-remove'

# Tag (t)
abbr -a "$gprefix"t 'git tag'
abbr -a "$gprefix"tl 'git tag --list --sort=-committerdate'
abbr -a "$gprefix"ts 'git tag --sign'
abbr -a "$gprefix"tv 'git verify-tag'
abbr -a "$gprefix"tx 'git tag --delete'

# Main working tree (w)
abbr -a "$gprefix"ws 'git status --short'
abbr -a "$gprefix"wS 'git status'
abbr -a "$gprefix"wd 'git diff --no-ext-diff'
abbr -a "$gprefix"wD 'git diff --no-ext-diff --word-diff'
abbr -a "$gprefix"wr 'git reset --soft'
abbr -a "$gprefix"wR 'git reset --hard'
abbr -a "$gprefix"wc 'git clean --dry-run'
abbr -a "$gprefix"wC 'git clean -d --force'
abbr -a "$gprefix"wm 'git mv'
abbr -a "$gprefix"wM 'git mv -f'
abbr -a "$gprefix"wx 'git rm -r'
abbr -a "$gprefix"wX 'git rm -rf'

# Working trees (W)
abbr -a "$gprefix"W 'git worktree'
abbr -a "$gprefix"Wa 'git worktree add'
abbr -a "$gprefix"Wl 'git worktree list'
abbr -a "$gprefix"Wm 'git worktree move'
abbr -a "$gprefix"Wp 'git worktree prune'
abbr -a "$gprefix"Wx 'git worktree remove'
abbr -a "$gprefix"WX 'git worktree remove --force'

# Switch (y)
abbr -a "$gprefix"y 'git switch' # requires Git 2.23
abbr -a "$gprefix"yd 'git switch --detach'

# Misc
abbr -a "$gprefix".. 'cd "$(git-root || print .)"'
