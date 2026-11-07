import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.components
import qs.content.modules

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
		delegate: NotificationPopup {}
	    }
	}

	Widget {
	    Layout.fillHeight: true
	    implicitWidth: Notifications.centerVisible ? 500 : 0
	    effectSize: 12

	    ColumnLayout {
		anchors.fill: parent
		anchors.topMargin: 5
		anchors.bottomMargin: 5
		anchors.leftMargin: 5
		anchors.rightMargin: 5

		Repeater {
		    model: Notifications.history
		    delegate: NotificationPopup {
			decay: false
			Layout.fillWidth: true
		    }
		}
	    }
	}
    }
}
