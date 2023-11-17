
# cargo 执行目录

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi


# 其他可执行目录
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi


# 其他可执行目录
if [ -d "/snap/bin" ] ; then
    PATH="/snap/bin:$PATH"
fi
