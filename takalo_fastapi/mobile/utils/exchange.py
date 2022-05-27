from mvola import Mvola
from mvola.tools import Transaction
from datetime import datetime


class mobile():
    def __init__(self, type_):
        if type_ == "telma":
            self._api = Mvola("0zL7eTrSEfXf6kkwJ53DSegCbBwa",
                              "pd8PIZYmeZaafifZgwHu1BC5ucMa", "PRODUCTION")
            self._token = self.getToken(type_)
            self._appName = "Takalo"

    def getToken(self, type_):
        err = None
        token = None
        if type_ == "telma":
            res = self._api.generate_token()
            if res.success:
                token = res.token
            else:
                err = res.error
        return token, err

    def transfert(self, type_, source_number, targt_number, amount):
        err = None
        txId = None
        reqTime = datetime.utcnow().isoformat()[:-3] + 'Z'
        if type_ == "telma":
            transaction = Transaction(
                token=self._token,
                UserLanguage="FR",
                UserAccountIdentifier=source_number,
                partnerName=self._appName,
                X_Callback_URL="https://2809-102-16-43-64.ngrok.io",
                amount=amount,
                currency="Ar",
                originalTransactionReference="orgina",
                requestingOrganisationTransactionReference="Takalo",
                descriptionText="Takalo",
                requestDate=reqTime,  # "2022-05-07T12:03:10.567Z",
                debit=source_number,
                credit=targt_number,
            )
            init = self._api.init_transaction(transaction)
            if init.success:
                txId = init.value.serverCorrelationId
            else:
                err = init.error.fault.message

        return txId, err

    def checkTransaction(self, type_, txId, source_number):
        err = None
        response = None
        if type_ == 'telma':
            transaction = Transaction(token=self._token,
                                      UserLanguage="FR",
                                      UserAccountIdentifier=source_number,
                                      partnerName=self._appName,
                                      serverCorrelationId=txId,
                                      )
            res = self._api.status_transaction(transaction)
            if res.success:
                response = res.status
            else:
                err = "code 401"

        return response, err
