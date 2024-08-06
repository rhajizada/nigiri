NIGIRI=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")
cat $NIGIRI/requirements/yay/packages.txt | xargs yay -S --needed --noconfirm
