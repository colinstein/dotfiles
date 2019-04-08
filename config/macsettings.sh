#!/bin/bash
defaults write -g QLPanelAnimationDuration -float 0
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.finder DisableAllAnimations -bool true

defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false

defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

defaults write com.apple.ActivityMonitor ShowCategory -int 0

defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

defaults write NSGlobalDomain AppleHighlightColor -string "0.75 0.75 0.75"
defaults write com.apple.terminal StringEncodings -array 4

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 80

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.screencapture show-thumbnail -bool FALSE
