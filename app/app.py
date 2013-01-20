
import tart

class App(tart.Application):
    def onUiReady(self):
        pass

    def onGetGlobalStream(self):
        from adn.adn import Adn
        app = Adn()
        stream = app.globalStream()
        for item in stream['data']:
            item['html'] = item['html'].replace("<br>", "<br/>")
        tart.send('receivedGlobalStream', stream=stream)
