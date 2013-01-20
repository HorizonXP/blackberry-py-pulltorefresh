import bb.cascades 1.0
import "../tart.js" as Tart

Page {
    signal updateLabelText(string text)

    Container {
        layout: DockLayout {}

        background: bg.imagePaint
        attachedObjects: [
            ImagePaintDefinition {
                id: bg
                repeatPattern: RepeatPattern.XY
                imageSource: "asset:///images/bg.amd"
            }
        ]

        ListView {
            id: listGlobalStream
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            leadingVisual: LeadingVisualItem {}
        }

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
