output application/json
var unknownErrorMsg="UNKNOWN"
---
{
	"AppName": p('secure::ping.application.name') as String,
	"AppVersion": p('secure::ping.application.version'),
	"Environment": p('mule.env'),
	"TransactionId" : if (isEmpty(vars.trxId."x-transaction-id") == false) vars.trxId."x-transaction-id" else "N/A",
	"ErrorType": error.errorType.asString,
	"ErrorDescription": error.detailedDescription
	}