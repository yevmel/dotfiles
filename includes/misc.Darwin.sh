# rbenv
if [ -a ~/.rbenv/version ]; then
    PATH="~/.rbenv/shims:~/.rbenv/versions/$(cat ~/.rbenv/version)/bin:$PATH"
fi

#pyenv
if [ -a ~/.pyenv/version ]; then
    PATH="~/.pyenv/shims:~/.pyenv/versions/$(cat ~/.pyenv/version)/bin:$PATH"
fi
