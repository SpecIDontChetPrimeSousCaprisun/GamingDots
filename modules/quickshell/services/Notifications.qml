pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    property var history: []
    property var tracked: []
    property bool centerVisible: false

    function sendNotification(summary, body, appName, urgency, image, appIcon) {
	const notif = {
	    summary: summary,
	    body: body,
	    appName: appName,
	    urgency: urgency,
	    image: image,
	    appIcon: appIcon,
	    time: new Date()
	}

	history = [...history, notif]
	tracked = [...tracked, notif]
    }

    IpcHandler {
	target: "notifications"

	function toggle(): void { centerVisible = ! centerVisible }
	function sendNotification(summary, body, appName, urgency, image, appIcon): void {
	    sendNotification(summary, body, appName, urgency, image, appIcon) 
	}
    }

    NotificationServer {
	id: server
	actionsSupported: true
	bodySupported: true
	imageSupported: true
	onNotification: n => { 
	    sendNotification(n.summary, n.body, n.appName, n.urgency, n.image, n.appIcon)
	    n.tracked = true 
	}
    }
}
