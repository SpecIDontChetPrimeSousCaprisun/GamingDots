import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    property int effectSize: 7
    property int effectSpeed: 300

    id: root
    clip: true
    gradient: Theme.accentGradient

    function strRandom(length) {
	let result = '';
	const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
	
	for (let i = 0; i < length; i++) {
	    const randomInd = Math.floor(Math.random() * characters.length);
	    result += characters.charAt(randomInd);
	}

	return result;
    }

    Rectangle {
	anchors.fill: parent
	anchors.leftMargin: 2
	anchors.rightMargin: 2
	anchors.topMargin: 2
	anchors.bottomMargin: 2
	color: Theme.background

	RowLayout {
	    Repeater {
		model: root.width / root.effectSize
		delegate: ColumnLayout {
		    property int trailLength: Math.floor(Math.random() * 3) + 7
		    property int pos: -1

		    id: column

		    Timer {
			running: true
			repeat: true
			interval: Math.floor(Math.random() * root.effectSpeed) + 1
			onTriggered: { 
			    parent.pos += 1
			    interval = Math.floor(Math.random() * root.effectSpeed) + 1

			    if (parent.pos > root.height / root.effectSize) parent.pos = -1
			}
		    }

		    Repeater {
			model: root.height / root.effectSize
			delegate: Text {
			    required property var modelData

			    text: strRandom(1)
			    color: Theme.accent
			    opacity: column.pos == modelData ? 1 : column.pos > modelData ? 1 - ((column.pos - modelData) / column.trailLength) : 0

			    font {
				family: Theme.font
				letterSpacing: -1
				pixelSize: root.effectSize
				weight: 600
			    }
			}
		    }
		}
	    }
	}
    }
}
