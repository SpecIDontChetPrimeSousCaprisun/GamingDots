import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    implicitWidth: text.implicitWidth
    Layout.fillHeight: true

    Text {
	id: text

	anchors.centerIn: parent
	text: "⏻"
	color: Theme.accent
	font {
	    family: Theme.font
	    pixelSize: 17
	    weight: 600
	}

	MouseArea {
	    anchors.fill: parent
	    onClicked: {
		Power.menuVisible = !Power.menuVisible 
	    }
	}
    }
}
