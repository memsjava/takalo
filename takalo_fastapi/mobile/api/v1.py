from fastapi import APIRouter

router = APIRouter(
    prefix="/mobile",
)


@router.get("/")
def get_mobile():
    return "mobile app created!"
