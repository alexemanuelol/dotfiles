# Load dotfiles like ~/.aliases, etc…
#   ~/.extra can be used for settings you don't want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file
