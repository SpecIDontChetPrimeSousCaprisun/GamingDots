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
		visible: true            // don't draw the raw version
		layer.enabled: true       // force it into a texture
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
