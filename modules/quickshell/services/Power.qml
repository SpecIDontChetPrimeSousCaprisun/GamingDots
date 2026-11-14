pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property bool menuVisible: false
    property var options: [
	{
	    name: "Shutdown",
	    icon: "⏻",
	    command: [ "poweroff" ]
	},
	{
	    name: "Reboot",
	    icon: "",
	    command: [ "reboot" ]
	},
	{
	    name: "Lock",
	    icon: "⏻",
	    command: [ "qs", "ipc", "call", "lock", "lock" ]
	}
    ]
}
