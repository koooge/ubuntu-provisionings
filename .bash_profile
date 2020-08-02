if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# load bash flagment
if [ -d "${HOME}/.bash.d" ] ; then
  for f in ${HOME}/.bash.d/*.sh ; do
    [ -s "$f" ] && . "$f"
  done
  unset f
fi

# prompt
git_branch() {
  echo $(git branch 2> /dev/null | sed -n 's/^\* \(.*\)$/(\1)/p')
}
PS1='[${USER}]\033[01;34m\]$(git_branch)\[\033[00m\]:\w\n\$ '

# direnv
eval "$(direnv hook bash)"
