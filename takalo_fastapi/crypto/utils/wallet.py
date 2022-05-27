"""
############################
# WALLET FOR CRYPTO
############################ 
"""
from pywallet import wallet


class crypto():
    def __init__(self):
        self.passphrase = wallet.generate_mnemonic()
        # print(self.passphrase)

    def create_wallets(self):
        res = None
        err = None
        try:
            wallet_BTC = wallet.create_wallet(
                network="BTC", seed=self.passphrase, children=0)
            wallet_BCH = wallet.create_wallet(
                network="BCH", seed=self.passphrase, children=0)
            wallet_ETH = wallet.create_wallet(
                network="ETH", seed=self.passphrase, children=0)
            wallet_LTC = wallet.create_wallet(
                network="LTC", seed=self.passphrase, children=0)
            wallet_DASH = wallet.create_wallet(
                network="DASH", seed=self.passphrase, children=0)
            wallet_DOGE = wallet.create_wallet(
                network="DOGE", seed=self.passphrase, children=0)
            res = {
                'BTC': wallet_BTC,
                'BCH': wallet_BCH,
                'ETH': wallet_ETH,
                'LTC': wallet_LTC,
                'DASH': wallet_DASH,
                'DOGE': wallet_DOGE
            }

        except Exception as e:
            err = e
        return res, err

    # https://developers.stellar.org/docs/tutorials/create-account/#create-account
