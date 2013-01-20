import bb.cascades 1.0
import "../tart.js" as Tart

Page {
    signal updateLabelText(string text)

    Container {
        layout: DockLayout {}

        Label {
            id: label
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
    }

    onUpdateLabelText: {
        label.text = text;
    }
}
