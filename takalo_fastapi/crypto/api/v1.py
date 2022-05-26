from fastapi import APIRouter

router = APIRouter()


@router.get("/")
def get_crypto():
    return "crypto app created!"
