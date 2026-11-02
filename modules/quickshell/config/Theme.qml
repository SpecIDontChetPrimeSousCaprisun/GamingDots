pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property color accent: "#630199"
    property color accent2: "#8005c1"
    property color background: "#06000a"
    property string font: "Jetbrains Mono Nerd"
    property var accentGradient: Gradient {
	orientation: Gradient.Vertical
	GradientStop { position: 1.0; color: Theme.accent }
	GradientStop { position: 0.0; color: Theme.accent2 }
    }
}
