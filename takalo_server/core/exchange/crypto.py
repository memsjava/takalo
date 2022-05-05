"""
############################
# EXCHANGE FOR CRYPTO
############################ 
"""
from web3 import Web3, HTTPProvider, IPCProvider
from ethereum.transactions import Transaction
from bit import Key
from bit import wif_to_key  


class crypto():
    def __init__(self):
        self.web3 = Web3(HTTPProvider('https://api.myetherapi.com/eth'))
        self.private_key = "none"

    def buy_ETH(self):
        pass
    
    def deposit_ETH(self):
        pass
    
    def withdraw_ETH(self, targetwallet, amount):
        amount = Web3.toWei(amount, 'ether')
        tx = Transaction(0, 60000000000, 21000, targetwallet, amount, "").sign(self.private_key)
        print(tx.to_dict())
        raw_tx = rlp.encode(tx)
        raw_tx_hex = self.web3.toHex(raw_tx)
        self.web3.eth.sendRawTransaction(raw_tx_hex)
        
    def buy_BTC(self):
        pass
    
    def deposit_BTC(self):
        pass
    
    def withdraw_BTC(self, targetwallet, amount):
        key = Key(self.private_key)
        key.get_unspents()
        x = key.send([(targetwallet, amount, 'btc')],fee=100)
    
        
        
