
import tart

class App(tart.Application):
    def onUiReady(self):
        pass

    def onGetGlobalStream(self):
        from adn.adn import Adn
        app = Adn()
        print(app.globalStream())
