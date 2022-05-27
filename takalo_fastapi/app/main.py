
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings
from crypto.api import v1 as crypto_api
from mobile.api import v1 as mobile_api


def get_application():
    _app = FastAPI(title=settings.PROJECT_NAME)

    _app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    return _app


app = get_application()
app.include_router(crypto_api.router)
app.include_router(mobile_api.router)


@app.get("/")
async def root():
    return {"message": "Hello Bigger Applications!"}
