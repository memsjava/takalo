from fastapi import APIRouter

router = APIRouter()


@router.get("/")
def get_mobile():
    return "mobile app created!"
