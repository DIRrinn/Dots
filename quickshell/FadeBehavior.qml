// FadeBehavior.qml
// https://doc.qt.io/qt-6/qml-qtquick-behavior.html
import QtQuick

Behavior {
    id: root
    property Item fadeTarget: targetProperty.object
    property real startFadeTarget: fadeTarget.opacity

    SequentialAnimation {
        NumberAnimation {
            target: root.fadeTarget
            property: "opacity"
            to: 0
            easing.type: Easing.InQuad
        }
        PropertyAction { } // actually change the controlled property between the 2 other animations
        NumberAnimation {
            target: root.fadeTarget
            property: "opacity"
            to: startFadeTarget //fadeTarget.opacity
            easing.type: Easing.OutQuad
        }
    }
}
