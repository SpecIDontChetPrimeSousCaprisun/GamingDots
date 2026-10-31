import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    implicitWidth: text.implicitWidth
    Layout.fillHeight: true

    Text {
	id: text
	anchors.centerIn: parent
	text: Qt.formatDateTime(clock.date, "hh : mm");
	color: Theme.accent
	font {
	    family: Theme.font
	    letterSpacing: -1
	    pixelSize: 17
	    weight: 600
	}
    }

    SystemClock {
	id: clock
	precision: SystemClock.minutes
    }
}
