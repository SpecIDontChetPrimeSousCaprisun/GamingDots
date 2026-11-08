import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    property int effectSize: 8
    property int effectSpeed: 300
    property int maxEffectsPerColumn: 5

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
        anchors.margins: 2
        color: Theme.background

        RowLayout {
            Repeater {
                model: Math.floor(root.width / root.effectSize)
                delegate: ColumnLayout {
                    id: column

                    property int trailLength: Math.floor(Math.random() * 3) + 7
                    property var poses: []
                    property int nextId: 0

                    Timer {
                        running: true
                        repeat: true
                        interval: Math.floor(Math.random() * root.effectSpeed * 40) + 500
                        onTriggered: {
			    if (column.poses.length > root.maxEffectsPerColumn) return

                            let newPoses = column.poses.slice()
                            newPoses.push({ id: column.nextId++, pos: 0 })
                            column.poses = newPoses
                        }
                    }

                    Timer {
                        running: true
                        repeat: true
                        interval: Math.floor(Math.random() * root.effectSpeed) + 50
                        onTriggered: {
                            const maxRow = root.height / root.effectSize
                            let newPoses = []

                            for (const pos of column.poses) {
                                const newPos = pos.pos + 1
                                if (newPos < maxRow + column.trailLength) {
                                    newPoses.push({ id: pos.id, pos: newPos })
                                }
                            }

                            column.poses = newPoses
                        }
                    }

                    Repeater {
                        model: Math.floor(root.height / root.effectSize)
                        delegate: Text {
                            required property int index

                            function getOpacity() {
                                let best = 0

                                for (const pos of column.poses) {
                                    const diff = pos.pos - index
                                    if (diff < 0) continue
                                    let o
                                    if (diff === 0) o = 1
                                    else o = Math.max(0, 1 - diff / column.trailLength)
                                    if (o > best) best = o
                                }

                                return best
                            }

                            text: strRandom(1)
                            color: Theme.accent
                            opacity: getOpacity()
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
