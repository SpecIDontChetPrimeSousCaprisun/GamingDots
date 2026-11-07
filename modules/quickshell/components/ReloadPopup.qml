import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import qs.services

Scope {
    id: root

    property bool failed
    property string errorString

    Connections {
	target: Quickshell

	function onReloadCompleted() {
	    Quickshell.inhibitReloadPopup();

	    Notifications.sendNotification(
		"Reaload completed !",
		"Shell config reload successfull !",
		"Quickshell",
		NotificationUrgency.Normal,
		"",
		""
	    )
	}

	function onReloadFailed(error: string) {
	    Quickshell.inhibitReloadPopup();
	    Notifications.sendNotification(
		"Reaload failed :(",
		"Shell config reload error: " + error,
		"Quickshell",
		NotificationUrgency.Critical,
		"",
		""
	    )
	}
    }
}
