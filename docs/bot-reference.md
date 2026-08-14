# MiniSurrender - bot reference

Version 1.2.5. Interface versions: 120100, 50504, 40402, 38002, 38000,
30405, 30300, 20506. Not listed for Classic Era (no 11509).
No saved variables, no options.

## What it does

Lets you surrender an arena by typing /gg or /afk, instead of right-clicking
the PvP icon and confirming the popup.

- /gg: surrenders if you are in an arena; otherwise does nothing.
- /afk: in an arena, surrenders. Outside an arena it behaves like normal
  /afk (sends the AFK message), except while in combat, where it does
  nothing.

On a surrender attempt it prints "Successfully surrendered arena." or, when
the game says you cannot surrender (CanSurrenderArena is false), "Failed to
surrender arena."

## Settings

None. No options panel, no saved variables. Install to enable; remove to
restore normal /afk behaviour.

## Troubleshooting

- "It says Failed to surrender arena": the game reported you are not allowed
  to surrender at that moment; that check is Blizzard's, not the addon's.
- "/afk didn't set me AFK": you were in combat; the addon suppresses the
  normal AFK message during combat lockdown.
- "/gg does nothing in a battleground": intended; it only works in arenas.
