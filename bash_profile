[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export EDITOR=vim

source ~/git-completion.bash

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PS1="[\t] \w\n\[\e[36m\]\`parse_git_branch\`\[\e[0m\] > "


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# export PATH=$PATH:$(go env GOPATH)/bin

alias alias_candidates='history | tail -n 20000 | sed "s/.*  //"  | sort | uniq -c | sort -g | tail -n 100'

export AWS_PROFILE=fishbrain
export AWS_REGION=eu-west-1
export AWS_DEFAULT_REGION=eu-west-1
export DEFAULT_AWS_REGION=eu-west-1

export ERL_AFLAGS="-kernel shell_history enabled"

mktouch() { mkdir -p "$(dirname $1)" && touch "$1"; }

source ~/.bin/tmuxinator.bash

alias json=fx


. $(brew --prefix asdf)/asdf.sh

. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

alias ag='ag --path-to-ignore ~/.ignore'
export PATH="/Users/cheerfulstoic/github/bigH/git-fuzzy/bin:$PATH"

eval "$(direnv hook bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cheerfulstoic/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/cheerfulstoic/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cheerfulstoic/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/cheerfulstoic/Downloads/google-cloud-sdk/completion.bash.inc'; fi
