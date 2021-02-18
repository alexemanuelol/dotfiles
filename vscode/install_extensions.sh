EXTENSIONS=(
    "vscodevim.vim" \
    "ms-vscode.cpptools" \
    "ms-python.python" \
    "vscode-icons-team.vscode-icons" \
    "formulahendry.code-runner" \
    "jdinhlife.gruvbox" \
    "aaron-bond.better-comments" \
    "shardulm94.trailing-spaces" \
    "eamodio.gitlens" \
    "donjayamanne.githistory" \
    "johnpapa.vscode-peacock"
)

for VARIANT in "code" \
               "code-insiders"
do
    if hash $VARIANT 2>/dev/null; then
        echo "Installing extensions for $VARIANT"
        for EXTENSION in ${EXTENSIONS[@]}
        do
            $VARIANT --install-extension $EXTENSION
        done
    fi
done
