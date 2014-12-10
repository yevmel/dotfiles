# rbenv
if [ -a ~/.rbenv/version ]; then
    PATH="~/.rbenv/versions/$(cat ~/.rbenv/version)/bin:$PATH"
fi

#pyenv
if [ -a ~/.pyenv/version ]; then
    PATH="~/.pyenv/versions/$(cat ~/.pyenv/version)/bin:$PATH"
fi
