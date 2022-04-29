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

    def create_BTC(self):
        wallet = wallet.create_wallet(network="BTC", seed=self.passphrase, children=0)
        
    # def create_BTG(self):
    #     wallet_BTG = wallet.create_wallet(network="BTG", seed=self.passphrase, children=0)
        
    def create_BCH(self):
        wallet_BTG = wallet.create_wallet(network="BCH", seed=self.passphrase, children=0)
    
    def create_ETH(self):
        wallet_BTG = wallet.create_wallet(network="ETH", seed=self.passphrase, children=0)
        
    def create_LTC(self):
        wallet_BTG = wallet.create_wallet(network="LTC", seed=self.passphrase, children=0)
    
    def create_DASH(self):
        wallet_BTG = wallet.create_wallet(network="DASH", seed=self.passphrase, children=0)
        
    def create_DOGE(self):
        wallet_BTG = wallet.create_wallet(network="DOGE", seed=self.passphrase, children=0)
        
    # https://developers.stellar.org/docs/tutorials/create-account/#create-account