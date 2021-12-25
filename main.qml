import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 500
    height: 500
    title: "appVersionName"
    color: "white"

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 50
        spacing: 15

        ProgressCircleSimple {
            id: progressSimple
            abortButtonVisible: true
            Layout.alignment: Qt.AlignHCenter
        }

        ProgressCircleRotation {
            id: progressRotation
            rotationEnabled: true
            abortButtonVisible: true
            Layout.alignment: Qt.AlignHCenter
        }

        Item { Layout.fillHeight: true }
    }

    Timer {
        id: progressSimpeTimer
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            if(progressSimple.progress >= 100) {
                progressSimple.progress = 5
            } else {
                progressSimple.progress++
            }
        }
    }
    Timer {
        id: progressRotationTimer
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            if(progressRotation.progress >= 100) {
                progressRotation.progress = 5
            } else {
                progressRotation.progress++
            }
        }
    }
}
