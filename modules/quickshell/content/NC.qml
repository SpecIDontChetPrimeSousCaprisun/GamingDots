import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.components

StyledWindow {
    name: "NotificationCenter"

    anchors.right: true
    anchors.top: true
    anchors.bottom: true
    width: layout.implicitWidth

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    RowLayout {
	id: layout
	anchors.fill: parent

	ColumnLayout {
	    Layout.fillHeight: true

	    Repeater {
		model: Notifications.tracked
		delegate: Widget {
		    required property var modelData

		    implicitWidth: 250
		    implicitHeight: notifLayout.implicitHeight

		    Timer {
			running: modelData.urgency !== NotificationUrgency.Critical
			interval: 5000
			onTriggered: {
			    Notifications.tracked.splice(Notifications.tracked.indexOf(modelData), 1)
			    parent.visible = false
			}
		    }

		    ColumnLayout {
			id: notifLayout
			anchors.fill: parent

			Text {
			    text: modelData.summary
			    color: Theme.accent
			    font {
				family: Theme.font
				letterSpacing: -1
				pixelSize: 25
				weight: 600
			    }
			}

			Text {
			    text: modelData.appName + " at " + Qt.formatDateTime(modelData.time, "HH:mm.ss")
			    color: Theme.accent
			    lineHeight: 1
			    font {
				family: Theme.font
				letterSpacing: -1
				pixelSize: 10
				weight: 600
			    }
			}

			Text {
			    text: modelData.body
			    color: Theme.accent
			    font {
				family: Theme.font
				letterSpacing: -1
				pixelSize: 17
				weight: 600
			    }
			}
		    }
		}
	    }
	}

	Widget {
	    Layout.fillHeight: true
	    implicitWidth: Notifications.centerVisible ? 500 : 0
	}
    }
}
