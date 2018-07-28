check_status() {
    local status=$(curl -ILs $1 | head -n 1 | cut -d ' ' -f 2)
    if [[ $status -lt 200 ]] || [[ $status -gt 299 ]]; then
        echo "$1 failed with a $status"
        return 1
    else 
        echo "$1 succeeded with a $status"
    fi
}

check_status https://www.google.com
check_status https://example.org/404