
import tart

class App(tart.Application):
    def onUiReady(self):
        pass

    def onGetGlobalStream(self):
        from PyAppDotNet.api import ApiConnection, Post
        posts = ApiConnection.get_global_stream()
        for post in posts:
            print(post)
