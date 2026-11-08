pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property bool dashboardVisible: false
    property string display: "drun"

    IpcHandler {
	target: "Dashboard"

	function showDrun(): void {
	    dashboardVisible = true
	    display = "drun"
	}

	function close(): void { dashboardVisible = false }
    }
}
