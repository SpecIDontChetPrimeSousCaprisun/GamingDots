import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    implicitWidth: layout.implicitWidth
    Layout.fillHeight: true

    RowLayout {
	id: layout
	anchors.fill: parent

	Repeater {
	    model: Hyprland.workspaces
	    delegate: Rectangle {
		required property var modelData

		width: 10
		height: 10
		radius: 100
		color: modelData.focused ? Theme.accent : "transparent"
		border {
		    width: 2
		    color: Theme.accent
		}
	    }
	}
    }
}
