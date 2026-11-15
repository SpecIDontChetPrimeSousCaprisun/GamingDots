import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    property int effectSize: 8
    property int effectSpeed: 300
    property int maxEffectsPerColumn: 5
    property color interiorColor: Theme.background
    property bool effectEnabled: true

    id: root
    clip: true
    gradient: Theme.accentGradient

    Rectangle {
        anchors.fill: parent
        anchors.margins: 2
        color: root.interiorColor

	MatrixEffect {
	    visible: root.effectEnabled
	    effectSize: root.effectSize
	    effectSpeed: root.effectSpeed
	    maxEffectsPerColumn: root.maxEffectsPerColumn
	}
    }
}
