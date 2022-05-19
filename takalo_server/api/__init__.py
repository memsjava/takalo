def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_pyfile(config_filename)

    return app
