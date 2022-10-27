#!/bin/bash

# Runs tests
test() {
    echo -e "\033[32mRunning tests...\033[0m"
    yarn test
}

# Runs lit
lint() {
    echo -e "\033[32mRunning lint...\033[0m"
    if [[ $1 == "format" ]]; then
        npx --no-install lint-staged && npx --no-install pretty-quick --staged
    else
        yarn lint --fix
    fi
}

# Runs format
format() {
    echo -e "\033[32mRunning format...\033[0m"
    if [[ $1 == "fix" ]]; then
        yarn format:fix
    else
        yarn format:check
    fi
}

# Runs npm audit fix
npm_audit() {
    echo -e "\033[32mRunning npm audit...\033[0m"
    yarn audit
}

npm_audit
lint
format fix
test

"$@"
