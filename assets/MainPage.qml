import bb.cascades 1.0
import "../tart.js" as Tart

Page {
    id: page
    signal addItem(variant entry)
    property bool showItems: true

    onAddItem: {
        modelGlobalStream.append(entry);
        showItems = false;
    }

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
            dataModel: ArrayDataModel {
                id: modelGlobalStream
            }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            leadingVisual: PullToRefresh {
                onRefreshTriggered: {
                    console.log("Refresh triggered!", modelGlobalStream.size());
                    modelGlobalStream.clear();
                    Tart.send('getGlobalStream');
                }
            }

            listItemComponents: [
                ADNPostItemComponent {}
            ]
        }

        ActivityIndicator {
            running: true
            visible: page.showItems
            preferredWidth: 350
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
    }
}
