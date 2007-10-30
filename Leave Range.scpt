-- turn on screensaver password
do shell script "defaults -currentHost write com.apple.screensaver askForPassword -int 1"
do shell script "loginwindow_refresh"

-- activate the screen saver
tell application "ScreenSaverEngine" to activate


