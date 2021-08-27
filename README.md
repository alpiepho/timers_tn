## Get Application
Version: 0.2

GH-Pages site: https://alpiepho.github.io/timers_tn/

or QR Code:

![QR Code](./qr-code.png)
## timers_tn

This application allows setting mutliple timers running independently. It is a PWA (prgressive web app), written in Flutter.

This was inspired by an AdaBox hardware project [timers](https://github.com/alpiepho/macropad/tree/master/timers_cp).

## Operation
To start, use the "?" to change the default settings for the multiple timers.  The first section allows for enable/disable of
the various timers.  Just below that are controls to enable-all, set all as count-down timers, set finish-sound on for all,
and set a starting time (currently in milliseconds rather than MM:SS) for all timers.

Following those are sections for each timer. Use the back arrow in the top left to save any changes.

On the main page, you may need to use ResetAll" to propogate the settings.  You can start all enabled timers with "PlayAll" and the
pause all of them with "PauseAll".  Optionally, you can press the timer itself to play/pause.  Use "ResetN" then a press of any
one timer to reset just that timer to the previous settings.

Count down timers will change colors as they count down:
- green: 100-70%
- yellow: 40-70%
- orange: 10=40%
- red: 1-10%
- red italics when done

If avaiable and enabled, a boing sound will pay when timer is done.

See below for any known bugs or limits.

## Learnings

Below are some things I learned with this project.

- Started this as a curiousity if a fast Flutter app was possible
- Took approx 10 days at 1-2 hours per day
- Improved at refactoring long repeated functional sections inot components
- Understand setState variables better
- Understand timers, duration, and stopwatch now
- Good refresher on favicons and QR codes
- Need to understand on device (or simulation?) debug for things like sound not playing

## Ongoing Progress

- BASIC IMPLEMENTATION
- [done] start project from flutter create
- [done] modify engine to show "buttons" for each timer
- [done] pass thru button clicks to engine
- [done] clean up engine and stub out
- [done] settings for number of timers
- [done] stip down settings page
- [done] settings for number of timers
- [done] show timers based on number (engine and page)
- [done] cleanup unused constants
- [done] rename calc classes and files
- [done] fix navaigation to settings page
- [done] engine prefs for number timers
- [done] save pref for numberof timers
- [done] move style out of engine?
- [done] test number colors
- [done] test fast number update
- [done] test 12 timers
- [done] scrollable settings
- [done] settings to set timer up/down start sound
- [done] refactor timer logic with state in engine
- [done] down colors as percent
- [done] up color green
- [done] favicon etc
- [done] add sound
- [done] refactor timer duration based on computed time instead of assuming loop is accurate
- [done] multiple timers not in sync
- [done] timers are not accurate
- [done] all buttons for down, sound
- [done] set all startMs
- [done] TimerEnableCard
- [done] TimerSettingCard
- [done] rename calc_page
- [done] fix individual timer pause/play (seems to be running behind the scene)
- [skip] declarative layout timers for performance?
- [skip] TimerButtonCard
- [skip] Balance logic between timer page an engine
- [done] QR code
- [done] finish README

- finish 24 timers as stress test

## Known Issues to Fix and TODO
- timer setting is in ms
- reset on init
- sound does not work as PWA
- record tone as sound instead of boing?
- chose sounds?
- change all startMs doesn't live change all settings
- toggles slow, change to checkbox
- settings for color percent

