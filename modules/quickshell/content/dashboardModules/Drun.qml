import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.components
import qs.config

ColumnLayout {
    anchors.fill: parent
    anchors.topMargin: 5
    anchors.bottomMargin: 5
    anchors.leftMargin: 5
    anchors.rightMargin: 5

    Rectangle {
	Layout.fillWidth: true
	color: Theme.accent2
	opacity: 0.5
	height: 30

	TextInput {
	    id: searchBar

	    anchors.fill: parent
	    color: Theme.background
	    focus: true

	    Keys.onReturnPressed: {
		appList.currentItem.launch()
	    }

	    Keys.onEscapePressed: {
		Dashboard.dashboardVisible = false
	    }

	    Keys.onUpPressed: {
		appList.currentIndex = Math.max(appList.currentIndex - 1, 0)
	    }

	    Keys.onDownPressed: {
		appList.currentIndex = Math.min(appList.currentIndex + 1, appList.count - 1)
	    }
	}
    }

    ListView {
	id: appList

	Layout.fillWidth: true
	Layout.fillHeight: true
	currentIndex: 0
	spacing: 5
	model: {
	    if (searchBar.text.length === 0) return DesktopEntries.applications.values
	    return DesktopEntries.applications.values.filter(app =>
		app.name.toLowerCase().includes(searchBar.text.toLowerCase())
	    )
	}

	clip: true
	delegate: Widget {
	    required property var modelData
	    property bool hovered: false

	    function launch() {
		let cmd = modelData.command

		if (modelData.runInTerminal) cmd = ["kitty", ...cmd]

		Quickshell.execDetached(cmd)
		Dashboard.dashboardVisible = false
	    }

	    effectEnabled: false
	    interiorColor: ListView.isCurrentItem || hovered ? Theme.background2 : Theme.background
	    implicitWidth: parent.width
	    implicitHeight: appLayout.implicitHeight

	    MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: parent.hovered = true
		onExited: parent.hovered = false
		onClicked: launch()
	    }

	    RowLayout {
		id: appLayout

		anchors.fill: parent
		anchors.leftMargin: 5

		IconImage {
		    source: Quickshell.iconPath(modelData.icon)
		    width: 40
		    height: 40
		}

		Text {
		    text: modelData.name
		    color: Theme.accent
		    Layout.fillWidth: true
		    Layout.fillHeight: true
		    verticalAlignment: Text.AlignVCenter

		    font {
			family: Theme.font
			letterSpacing: -1
			pixelSize: 15
			weight: 600
		    }
		}
	    }
	}
    }
}
