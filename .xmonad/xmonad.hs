-- -*- haskell -*-

-- mod-q to reload

-- http://www.nepherte.be/step-by-step-configuration-of-xmonad/
-- http://joeyh.name/blog/entry/xmonad_layouts_for_netbooks/

module Main (main) where

import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import System.IO

import XMonad.Util.EZConfig
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Gaps

import XMonad.Util.Run(spawnPipe)

import XMonad.Layout.ResizableTile
import XMonad.Layout.StackTile
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.Magnifier

import qualified XMonad.StackSet as W

-- For full screen in Chromium
import XMonad.Hooks.EwmhDesktops

-- http://xmonad.org/xmonad-docs/xmonad/XMonad-Layout.html
defaultLayout = avoidStruts $ smartBorders (
  Tall 1 (3/100) (2/3) |||
  magnifier (Tall 1 (3/100) (1/2)) |||
  Mirror (Tall 1 (3/100) (2/3)) |||
  StackTile 1 (3/100) (2/3) |||
  Full )

bottomGapLayout = gaps [(D,26)] $ -- gap at the bottom (L,R,D,U) for trayer
            defaultLayout

-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Layout-PerWorkspace.html
myLayoutHook = onWorkspaces ["1:www","2:term","3:emacs","4:email","5","6","7:Music","8:Game","9","0"] bottomGapLayout $
               defaultLayout

-- use xprop | grep WM_CLASS to find the className
myManageHook = composeAll
   [ className =? "Firefox" --> doShift "1:www"
   , className =? "trayer" --> doFloat
   , className =? "Emacs" --> doShift "3:emacs"
   , resource =? "desktop_window" --> doIgnore
   , className =? "Xmessage" --> doFloat
   , className =? "Steam" --> doShift "8:Game"
   , className =? "Thunderbird" --> doShift "4:email"
   , className =? "google-chrome" --> doShift "1:www"
   , className =? "spotify" --> doShift "7:Music"
   , manageDocks
   ]

main :: IO ()
main = do
    -- this is here to kill nemo file manager on a reload, as it blocks xmobar because of layering.
    spawn "killall nemo"
    --
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ defaultConfig
     { terminal = "terminator"
     , modMask = mod4Mask
     , borderWidth = 1
     , focusedBorderColor = "#FF7F50"
     , focusFollowsMouse = False
     , workspaces = ["1:www","2:term","3:emacs","4:email","5","6","7:Music","8:Game","9","0","-:selenium","=:tmp"]
     , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
     , layoutHook = myLayoutHook
     , handleEventHook = fullscreenEventHook
     , logHook = dynamicLogWithPP xmobarPP
                { ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "orange" ""
                }
     }
     `additionalKeys`
     [ ((controlMask, xK_Print), spawn "sleep 1; scrot")
     , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
     , ((mod4Mask, xK_e), spawn "nemo")
     , ((mod4Mask .|. shiftMask, xK_space), spawn "keyboard-switcher")
     ]
