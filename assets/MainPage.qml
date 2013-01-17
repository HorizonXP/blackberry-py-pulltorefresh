import bb.cascades 1.0
import "../tart.js" as Tart


Page {
    Container {
        layout: DockLayout {}

        Label {
            id: label
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
    }

    function onMsgFromPython(data) {
        label.text = data.text
    }
}
