import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.content.modules

Variants {
    model: Quickshell.screens

    StyledWindow {
	required property ShellScreen modelData

	name: "content"
	screen: modelData
	id: root

	WlrLayershell.layer: WlrLayer.Top

	anchors.top: true
	anchors.right: true
	anchors.left: true

	implicitHeight: 40

	Widget {
	    id: background

	    x: (parent.width / 2) - (width / 2)
	    anchors.bottom: parent.bottom
	    implicitHeight: parent.height - 6
	    implicitWidth: layout.implicitWidth + 16
	    effectSpeed: 750
	    effectSize: 5

	    RowLayout {
		id: layout

		anchors.fill: parent
		anchors.rightMargin: 6
		anchors.leftMargin: 6

		Workspaces {}
		Clock {}
		Tray {}
		Notification {}
	    }
	}
    }
}
