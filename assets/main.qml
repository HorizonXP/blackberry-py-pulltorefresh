import bb.cascades 1.0
import "../tart.js" as Tart

NavigationPane {
    id: root

    Menu.definition: AppMenuDefinition {
        parentPane: root
    }

    MainPage {
        id: mainPage
    }

    onCreationCompleted: {
        Tart.init(_tart, Application);

        Tart.register(root);
        Tart.register(mainPage);

        Tart.send('uiReady');
    }

    onPopTransitionEnded: {
        page.destroy()
    }
}
