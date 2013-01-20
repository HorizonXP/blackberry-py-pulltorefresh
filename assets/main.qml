import bb.cascades 1.0
import "../tart.js" as Tart

NavigationPane {
    id: root
    signal addItem(variant entry)

    Menu.definition: AppMenuDefinition {
        id: appMenu
    }

    MainPage { id: mainPage }

    attachedObjects: [
        SettingsPage { id: settingsPage },
        HelpPage { id: helpPage }
    ]

    onCreationCompleted: {
        Tart.init(_tart, Application);

        Tart.register(root);

        Tart.send('uiReady');

        appMenu.triggerSettingsPage.connect(handleTriggerSettingsPage);
        appMenu.triggerHelpPage.connect(handleTriggerHelpPage);
        root.addItem.connect(mainPage.addItem);
        Tart.send('getGlobalStream');
    }

    function handleTriggerSettingsPage() {
        push(settingsPage);
    }

    function handleTriggerHelpPage() {
        push(helpPage);
    }

    function onReceivedGlobalStream(stream) {
        stream.stream.data.forEach(function(entry) {
            root.addItem(entry);
        });
    }
}
