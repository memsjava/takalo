"""
############################
# WALLET FOR CRYPTO
############################ 
"""
from bitcoinlib.wallets import HDWallet, wallet_delete
from bitcoinlib.mnemonic import Mnemonic


class crypto():
    def __init__(self):
        self.passphrase = Mnemonic().generate()
        print(self.passphrase)
        pass

    def create_btc(self):
        wallet = HDWallet.create(
            "mWallet1", keys=self.passphrase, network='bitcoin')
        key1 = wallet.new_key()
        print(key1.address)
