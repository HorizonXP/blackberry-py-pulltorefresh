import bb.cascades 1.0
import "../tart.js" as Tart

MenuDefinition {
    property variant parentPane

    settingsAction: SettingsActionItem {
        attachedObjects: [
            ComponentDefinition {
                id: settingsPage
                SettingsPage {}
            }
        ]

        onTriggered: {
            var page = settingsPage.createObject();
            parentPane.push(page);
        }
    }
    helpAction: HelpActionItem {
        attachedObjects: [
            ComponentDefinition {
                id: helpPage
                HelpPage {}
            }
        ]

        onTriggered: {
            var page = helpPage.createObject();
            parentPane.push(page);
        }
    }
}
