
import tart

class App(tart.Application):
    def onUiReady(self):
        pass

    def onGetGlobalStream(self):
        from adn.adn import Adn
        app = Adn()
        self.stream = app.globalStream()
        validStream = True
        for item in self.stream['data']:
            if 'html' in item:
                item['html'] = item['html'].replace("<br>", "<br/>")
                validStream = True
            else:
                validStream = False
        if validStream:
            tart.send('receivedGlobalStream', stream=self.stream)
            self.getAvatarImages()
        else:
            self.onGetGlobalStream()

    def getAvatarImages(self):
        import requests
        import tempfile
        for (index,item) in enumerate(self.stream['data']):
            if 'user' in item:
                if 'avatar_image' in item['user']:
                    r = requests.get(item['user']['avatar_image']['url'])
                    f = tempfile.NamedTemporaryFile(delete=False)
                    try:
                        f.write(r.content)
                        filename = f.name
                        avatar_image = dict()
                        avatar_image['url'] = filename
                        avatar_image['index'] = index
                        tart.send('updateAvatarImage', avatar_image=avatar_image)
                    finally:
                        f.close()


