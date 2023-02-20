#!/bin/bash
chromePath="/Users/anilabhadatta/Downloads/Google Chrome.app"
enable_update=false


Version=$("$chromePath/Contents/MacOS/Google Chrome" --version | awk '{print $3}')
echo $Version
src="$chromePath/Contents/Frameworks/Google Chrome Framework.framework/Versions/$Version/Frameworks/KeystoneRegistration.framework"
dst="$chromePath/Contents/Frameworks/Google Chrome Framework.framework/Versions/$Version/Frameworks/KeystoneRegistration.framework.bak"
if [ "$enable_update" = true ] ; then
	mv "$dst" "$src"
else
	mv "$src" "$dst"
fi 