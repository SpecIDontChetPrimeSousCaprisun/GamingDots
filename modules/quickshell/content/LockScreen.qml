import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import qs.content.lockScreenModules
import qs.services

Item {
    id: root

    WlSessionLock {
	id: lock

	WlSessionLockSurface {
	    id: surface

	    Bg {
		anchors.fill: parent
		screen: surface.screen
		id: bgImage

	    }

	    MultiEffect {
		anchors.fill: bgImage
		source: bgImage
		blurEnabled: true
		blur: 1.0
		blurMax: 64
	    }

	    Text {
		text: "unlock"
		width: 100
		height: 100
		font.pixelSize: 10
		MouseArea {
		    anchors.fill: parent
		    onClicked: lock.locked = false
		}
	    }
	}
    }

    IpcHandler {
	target: "lock"
	function lock() {
	    Lock.captureAllScreens(root, () => {
		    lock.locked = true
	    })
	}

	function unlock() {
	    lock.locked = false
	}
    }
}
