import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

StyledWindow {
    visible: Power.menuVisible

    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    MouseArea {
	anchors.fill: parent
	onClicked: {
	    Power.menuVisible = false
	}
    }

    Rectangle {
	anchors.fill: parent
	color: "black"
	opacity: 0.5
	z: -1
    }

    ColumnLayout {
	anchors.centerIn: parent

	Repeater {
	    model: Power.options
	    delegate: Widget {
		required property var modelData
		required property int index
		property bool hovered

		id: widget
		effectEnabled: false
		Layout.alignment: Qt.AlignHCenter
		implicitWidth: Power.menuVisible ? text.implicitWidth + 10 : 0
		implicitHeight: text.implicitHeight + 10

		Behavior on implicitWidth {
		    NumberAnimation {
			duration: 200 * index
		    }
		}

		Text {
		    id: text

		    anchors.centerIn: parent
		    text: modelData.icon + " " + modelData.name
		    color: Theme.accent

		    font {
			family: Theme.font
			letterSpacing: -1
			pixelSize: widget.hovered ? 50 : 35
			weight: 600
		    }
		    
		    Behavior on font.pixelSize {
			NumberAnimation {
			    duration: 100
			}
		    }

		    MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onClicked: proc.running = true
			onEntered: widget.hovered = true
			onExited: widget.hovered = false 
		    }

		    Process {
			id: proc
			command: modelData.command
		    }
		}
	    }
	}
    }
}
