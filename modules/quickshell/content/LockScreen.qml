import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import qs.content.lockScreenModules
import qs.services
import qs.components

Item {
    id: root

    WlSessionLock {
	id: lock

	WlSessionLockSurface {
	    id: surface

	    Item {
		id: blurLayer
		anchors.fill: parent
		visible: true            
		layer.enabled: true       
		layer.live: true
		layer.smooth: true
		layer.textureSize: Qt.size(width, height)
		z: -1

		Bg {
		    anchors.fill: parent
		    screen: surface.screen
		    id: bgImage

		}

		MatrixEffect {
		    effectSize: 100
		    maxEffectsPerColumn: 2
		    cullIfNotVisible: false
		}
	    }

	    MultiEffect {
		anchors.fill: parent
		source: blurLayer
		blurEnabled: true
		blur: 1.0
		blurMax: 64
	    }

	    Auth {}
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
