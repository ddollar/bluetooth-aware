-- turn off screen saver password
do shell script "defaults -currentHost write com.apple.screensaver askForPassword -int 0"
do shell script "loginwindow_refresh"

-- turn off screensaver
tell application "ScreenSaverEngine" to quit

-- exit address book
tell application "Address Book"
  if not unsaved then
    try
      quit
      delay 1
    end try
  end if
end tell

-- restart address book
do shell script "defaults write com.apple.AddressBook ABCheckForPhoneNextTime -boolean true"
try
  tell application "Address Book" to launch
  tell application "System Events" 
    set the visible of process "Address Book" to no
  end tell
end try

-- synchronize the phone
tell application "iSync"
  if last sync is less than ((current date) - 900) then
    synchronize
  end if
end tell
tell application "System Events" to set visible of process "iSync" to false