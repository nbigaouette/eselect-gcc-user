# File: /etc/profile.d/gcc-user.sh
if [ -d "${HOME}/.env.d" -a -f "${HOME}/.env.d/gcc-user.sh" ]; then
    source "${HOME}/.env.d/gcc-user.sh"
fi
