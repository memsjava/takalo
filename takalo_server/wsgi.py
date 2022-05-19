from api import create_app
config = "config.Production"
application = create_app(config)  # call from wsgi server
