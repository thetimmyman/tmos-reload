# TMOS Reload

One bar button that reloads the Omarchy shell — the one action that reliably closes a wedged popup
or panel.

## Why this exists

Third-party panels do not always dismiss when you click outside them, and a panel that has wedged
cannot be closed from its own UI. Reloading the shell tears every popup down. That normally means
opening a terminal and typing a command, which is exactly what you cannot do when the thing covering
your screen is the problem. This is that command, one click away.

`omarchy-restart-shell` refuses to run while the session is locked, so this button cannot strand you
behind a lock screen: the shell's own script checks first, and re-secures the lock if it has to.

## Install

```sh
omarchy plugin add https://github.com/thetimmyman/tmos-reload --enable
```

## Usage

Click the button in the bar. The shell reloads in about a second: the bar and every panel disappear
and come back. Nothing else on the machine restarts — no applications, no login session.

## Configure

```sh
omarchy bar move tmos.reload --section right
```

## Remove

```sh
omarchy plugin remove tmos.reload
```

## Dependencies

None beyond Omarchy Quattro itself. The plugin is a single QML file that calls Omarchy's own
`omarchy-restart-shell`; it opens no network connection, reads no credentials, and writes no files.

## License

MIT — see `LICENSE`.
