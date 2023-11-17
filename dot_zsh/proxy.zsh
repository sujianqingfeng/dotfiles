# hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
# hostip="desktop-gat3icv.mshome.net"
# wslip=$(hostname -I | awk '{print $1}')
hostip=127.0.0.1
port=7890

PROXY_HTTP="http://${hostip}:${port}"

proxy(){
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"

    export https_proxy="${PROXY_HTTP}"
    export HTTPS_proxy="${PROXY_HTTP}"

    # git config --global http.proxy "${PROXY_HTTP}"
    # git config --global https.proxy "${PROXY_HTTP}"
    # echo "Host ip:" ${hostip}
    # echo "WSL ip:" ${wslip}
    echo "Current proxy:" $https_proxy
}

unproxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY
    # git config --global --unset http.proxy
    # git config --global --unset https.proxy
}



