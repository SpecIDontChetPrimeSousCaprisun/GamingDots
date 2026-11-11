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

    function close() {
	Notifications.tracked.splice(Notifications.tracked.indexOf(modelData), 1)
	root.visible = false
    }

    id: root
    implicitWidth: 260
    implicitHeight: layout.implicitHeight + 10
    effectEnabled: false

    MouseArea {
	anchors.fill: parent

	onClicked: {
	    if (decay) close();
	}
    }

    ColumnLayout {
	id: layout
	anchors.fill: parent
	anchors.topMargin: 5
	anchors.bottomMargin: 5
	anchors.leftMargin: 5
	anchors.rightMargin: 5

	RowLayout {
	    Layout.fillWidth: true
	    
	    Image {
		Layout.preferredHeight: 36
		Layout.preferredWidth: 36
		fillMode: Image.PreserveAspectFit
		visible: source.toString() !== ""
		source: modelData.image || modelData.appIcon || ""
            }

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
	    Layout.fillWidth: true

	    text: modelData.body
	    color: Theme.accent
	    elide: Text.ElideRight
	    maximumLineCount: 100
	    wrapMode: Text.WordWrap
	    height: 1000000000000000
	    font {
		family: Theme.font
		letterSpacing: -1
		pixelSize: 15
		weight: 600
	    }
	}

    Rectangle {
	    id: bar
	    height: 5
	    width: parent ? parent.implicitWidth * progress : 0
	    color: Theme.accent2
	    visible: decay && root.visible

	    property real progress: 1.0
	    property int durationMs: 5000

	    NumberAnimation on progress {
		id: decayAnim
		running: decay && root.visible &&
			 modelData.urgency !== NotificationUrgency.Critical
		from: 1.0
		to: 0.0
		duration: bar.durationMs
		easing.type: Easing.Linear
		onFinished: root.close()
	    }
	}
    }
}
