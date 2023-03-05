#!/bin/bash
chromePath=${2#path=}
enable_update=${1#enable=}
USERNAME=$(whoami)

Version=$("$chromePath/Contents/MacOS/Google Chrome" --version | awk '{print $3}')
echo $Version
src="$chromePath/Contents/Frameworks/Google Chrome Framework.framework/Versions/$Version/Frameworks/KeystoneRegistration.framework"
dst="$chromePath/Contents/Frameworks/Google Chrome Framework.framework/Versions/$Version/Frameworks/KeystoneRegistration.framework.bak"
if [ "$enable_update" = true ] ; then
	mv "/Users/${USERNAME}/Library/Google.backup" "/Users/${USERNAME}/Library/Google"
	sudo mv "/Library/Google.backup" "/Library/Google"
	mv "$dst" "$src"
else
	mv "/Users/${USERNAME}/Library/Google" "/Users/${USERNAME}/Library/Google.backup"
	sudo mv "/Library/Google" "/Library/Google.backup"
	mv "$src" "$dst"
fi 

xattr -cr "${chromePath}"
