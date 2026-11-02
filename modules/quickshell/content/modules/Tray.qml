import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

Item {
    visible: repeater.count > 0
    implicitWidth: layout.implicitWidth
    Layout.fillHeight: true

    RowLayout {
	id: layout
	anchors.fill: parent

	Repeater {
	    id: repeater
	    model: SystemTray.items

	    Image {
		required property var modelData

		fillMode: Image.PreserveAspectFit
		visible: source.toString() !== ""
		source: modelData.icon || ""
		Layout.preferredHeight: 18
		Layout.preferredWidth: 18

		MouseArea {
		    anchors.fill: parent
		    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
		    onClicked: mouse => {
			if (mouse.button === Qt.LeftButton) {
			    modelData.activate()
			} else if (mouse.button === Qt.RightButton) {
			    let rect = parent.mapToItem(null, 0, 0)
			    modelData.display(root, rect.x + mouse.x, rect.y + mouse.y)
			} else if (mouse.button === Qt.MiddleButton) {
			    modelData.secondaryActivate()
			}
		    }
		}
	    }
	}
    }
}
