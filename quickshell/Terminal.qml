import Quickshell
import QtQuick
import Quickshell.Wayland
import QtQuick.Controls
import Quickshell.Io
import Quickshell.I3

ShellRoot{

    Variants {
        model: Quickshell.screens;
      
      PanelWindow {
        id: terminal
        property var modelData
        screen: modelData

        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.namespace: "quickshell"
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

        focusable: true

        anchors {
            bottom: true
            left: true
            right: true
        }
        implicitHeight: 27
        implicitWidth: screen.width
        color: "transparent"

        TextField {
            property string command
            signal commandTyped()

            id: input
            anchors.fill: parent
            inputMethodHints: Qt.ImhSensitiveData
            focus: true
        	implicitWidth: screen.width
            padding: 2
            font.family: "Impact"
            placeholderText: "Command:"

            Process {
                id: exec
                command: ["sh", "-c", input.command]
                running: false
                stdout: StdioCollector {
                    onStreamFinished: {
                        running: false
                        output.text = this.text
                    }
                }
            }

            onAccepted: {
                if(text == "tog"){
                    output.visible = !output.visible;
                    rect.visible = !rect.visible;
                    clear();
                }
                else if(text == "clear"){
                    output.text = "";
                    clear();
                }
                else {
                    (this.command = text);
                    commandTyped();
                    clear()
                }
            }
            onCommandTyped: {
                exec.running = true
            }
        }

        PopupWindow {
            id: output
            property string text

            anchor.window: terminal
            anchor.rect.y: -height

            visible: false
            FadeBehavior on visible {}

            text: I3.socketPath

            color: "transparent"

            implicitHeight: 500
            implicitWidth: screen.width
            Rectangle {
                id: rect

                ScrollView {
                    anchors.fill: parent
                Text {
                    padding: 10
                    text: output.text
                    color: "white"
                    font.family: "Impact"
                    font.pointSize: 12
                }
            }
                anchors.fill: parent
                opacity: 0.5
                border.width: 4
                border.color: "blue"
                visible: true
                color: "black"
                FadeBehavior on visible {}
            }
        }
      }
    }
}
