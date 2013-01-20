
import tart

class App(tart.Application):
    def onUiReady(self):
        pass

    def onGetGlobalStream(self):
        from adn.adn import Adn
        app = Adn()
        stream = app.globalStream()
        validStream = True
        for item in stream['data']:
            if 'html' in item:
                item['html'] = item['html'].replace("<br>", "<br/>")
                validStream = True
            else:
                validStream = False
        if validStream:
            tart.send('receivedGlobalStream', stream=stream)
        else:
            self.onGetGlobalStream()
