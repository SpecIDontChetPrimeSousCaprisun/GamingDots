import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.components
import qs.services
import qs.content.dashboardModules

StyledWindow {
    id: root
    
    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true
    visible: Dashboard.dashboardVisible
    name: "dashboard"

    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    Widget {
	anchors.centerIn: parent
	width: 700
	height: 1000
	effectSize: 15
	maxEffectsPerColumn: 2

	Drun {}
    }
}
