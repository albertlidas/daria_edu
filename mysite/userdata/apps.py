from django.apps import AppConfig


class RegisterConfig(AppConfig):
    name = 'userdata'

    def ready(self):
        import userdata.signals
