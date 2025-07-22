import Quickshell
import QtQuick
import Quickshell.Wayland
import QtQuick.Controls
import Quickshell.Io

ShellRoot{
    Variants {
      model: Quickshell.screens;

      
      PanelWindow {
        id: terminal
        property var modelData
        screen: modelData

        WlrLayershell.layer: WlrLayer.Overlay

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
                    clear();
                }
                if(text == "clear"){
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
            property var modelData

            anchor.window: terminal
            anchor.rect.y: -height

            visible: false


            color: "transparent"

            implicitHeight: 500
            implicitWidth: screen.width
            Rectangle {
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
                color: "black"
            }
        }
      }
    }
}
