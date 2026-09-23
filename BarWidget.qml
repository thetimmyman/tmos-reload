import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

// TMOS Panic Close — one button, one job: close everything that will not close itself.
//
// Third-party panels do not always dismiss when you click outside them, and a wedged one cannot be
// closed from its own UI. Restarting the shell is the one action that reliably tears every popup
// down, and that is what this button does — no terminal, one click.
//
// `omarchy-restart-shell` refuses while the session is locked, so this cannot strand you behind a
// lock screen: the shell's own script checks before it touches anything. The button is a registered
// qs.Ui click target (BarIconButton), and it launches through the bar's own `run` when it has one,
// which is how the rest of the kit starts commands.
BarWidget {
  id: root
  moduleName: "tmos.panic-close"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: ""
    slotSize: Style.bar.statusSlot
    fontSize: Style.font.caption
    tooltipText: "Close stuck popups (restarts shell)"
    onPressed: {
      if (root.bar) root.bar.run("omarchy-restart-shell")
      else Quickshell.execDetached(["omarchy-restart-shell"])
    }
  }
}
