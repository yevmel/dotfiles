if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

SSH_KEYS=$(grep -L ENCRYPTED ~/.ssh/*rsa)
for key in $SSH_KEYS; do
    ssh-add $key &> /dev/null
done