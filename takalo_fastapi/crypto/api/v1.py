from fastapi import APIRouter
from crypto.utils.wallet import crypto

router = APIRouter(
    prefix="/crypto",
)


@router.get("/")
def get_crypto():
    return "crypto app created!"


@router.get("/wallets/")
def get_wallets():
    res, err = crypto().create_wallets()
    if res:
        print(res)
        return res
    else:
        return err
