import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0

Rectangle {
    id: progressBar
    width: 50
    height: 50
    color: "#111519"
    radius: 180
    visible: progressCircle.arcEnd <= 360

    property int progress: 0
    property bool rotationEnabled: false
    property bool abortButtonVisible: false

    onProgressChanged: {
        var value = 0
        if(progress > 0) {
            value = parseInt(360 / 100 * progress)
        }
        if(progressCircle.arcEnd !== value) {
            progressCircle.arcEnd = value
        }
    }
    BusyIndicator {
        id: control
        anchors.centerIn: parent
        width: 40
        height: 40
        running: rotationEnabled

        contentItem: Item {
            implicitWidth: 40
            implicitHeight: 40

            ProgressCircleBase {
                id: progressCircle
                anchors.centerIn: parent
                size: 40
                colorCircle: "#FFFFFF"
                colorBackground: "#FF111519"
                showBackground: true
                arcBegin: 0
                arcEnd: 0
            }
            //
            // if need abort icon
            // Image {
            //     visible: abortButtonVisible
            //     width: 15; height: 15
            //     source: "qrc:/assets/abort_icon.svg"
            //     sourceSize.width: 15; sourceSize.height: 15
            //     anchors.centerIn: progressCircle
            // }
            RotationAnimator {
                target: progressCircle
                running: control.visible && control.running
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 2500
            }
        }
    }
}
