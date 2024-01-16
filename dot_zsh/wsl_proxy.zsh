hostip=$(host $(hostname) | grep "has address 192" | awk '{print $4}')
port=7890

PROXY_HTTP="http://${hostip}:${port}"

wslp(){
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"

    export https_proxy="${PROXY_HTTP}"
    export HTTPS_proxy="${PROXY_HTTP}"

    echo "Current proxy:" $https_proxy
}


