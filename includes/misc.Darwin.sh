# rbenv
if [ -a ~/.rbenv/version ]; then
    PATH="~/.rbenv/shims:~/.rbenv/versions/$(cat ~/.rbenv/version)/bin:$PATH"
fi
