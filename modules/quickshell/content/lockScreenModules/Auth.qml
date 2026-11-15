import Quickshell
import Quickshell.Services.Pam
import QtQuick
import qs.config
import qs.components

Widget {
    width: 200
    height: 40
    anchors.centerIn: parent
    effectEnabled: false

    PamContext {
	id: context

	config: "quickshell"

	onPamMessage: {
	    if (responseRequired) {
		context.respond(passwdInput.text)
	    }
	}

	onCompleted: (result) => {
	    console.log(result)
	    console.log(result.toString())
	    if (result === PamResult.Success) {
		lock.locked = false 
	    } else {
		passwdInput.text = ""
	    }
	}
    }

    TextInput {
	id: passwdInput

	anchors.fill: parent
	color: Theme.accent
	echoMode: TextInput.Password
	focus: true
	horizontalAlignment: TextInput.AlignHCenter
	verticalAlignment: TextInput.AlignVCenter

	font {
	    family: Theme.font
	    letterSpacing: 2
	    pixelSize: 27
	    weight: 600
	}

	Component.onCompleted: {
	    forceActiveFocus()
	}

	onAccepted: {
	    context.start()
	}
    }
}
