## Get Application
Version: 0.1

GH-Pages site: https://alpiepho.github.io/timers_tn/

## timers_tn

This application allows setting mutliple timers running independently. It is a PWA (prgressive web app), written in Flutter.

This was inspired by an AdaBox hardware project [timers](https://github.com/alpiepho/macropad/tree/master/timers_cp).

## Operation
TBD

## Learnings
TBD

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

- rename calc_page
- declarative layout timers for performance?
- change toggle to checkbox
- TimerButtonCard
- Balance logic between timer page an engine
- finish README
- QR code
- wrapup soon
- 24 timers? eliminate rows if not used?

## Known Issues to Fix
- timer setting is in ms
- reset on init
- sound does not work as PWA
- record tone as sound instead of boing?
- chose sounds?
- change all startMs doesn't live change all settings
