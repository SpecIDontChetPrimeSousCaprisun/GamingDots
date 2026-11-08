import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.components
import qs.services

StyledWindow {
    id: root
    
    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true
    visible: Dashboard.dashboardVisible

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    Widget {
	anchors.centerIn: parent
	width: 700
	height: 1000
    }
}
