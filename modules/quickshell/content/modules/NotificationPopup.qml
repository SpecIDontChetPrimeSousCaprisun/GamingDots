import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components
import qs.services

Widget {
    required property var modelData
    property bool decay: true

    id: root
    implicitWidth: 260
    implicitHeight: layout.implicitHeight + 10

    ColumnLayout {
	id: layout
	anchors.fill: parent
	anchors.topMargin: 5
	anchors.bottomMargin: 5
	anchors.leftMargin: 5
	anchors.rightMargin: 5

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
		pixelSize: 15
		weight: 600
	    }
	}

	Rectangle {
	    property int count: 0

	    visible: decaying
	    height: 5
	    width: parent.implicitWidth
	    color: Theme.accent2

	    Timer {
		running: (modelData.urgency !== NotificationUrgency.Critical) && decay
		repeat: true
		interval: 1
		onTriggered: {
		    parent.count += 1
		    parent.width = root.implicitWidth - ((root.implicitWidth / 5000) * parent.count)

		    if (parent.count > 5000) {
			Notifications.tracked.splice(Notifications.tracked.indexOf(modelData), 1)
			root.visible = false
		    }
		}
	    }
	}
    }
}
