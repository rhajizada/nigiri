entries=("assistant" "avahi-discover" "bssh" "bvnc" "designer" "java-java-openjdk" "jconsole-java-openjdk" "jshell-java-openjdk" "linguist" "qdbusviewer" "qv4l2" "qvidcap")
echo "Removing desktop entries"
for entry in "${entries[@]}"; do
  entry_file="/usr/share/applications/$entry.desktop"
  if [ -e "$entry_file" ]; then
    echo "Removing $entry_file"
    sudo rm $entry_file
  fi
done
