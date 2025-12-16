accessing
expirationDate

	^ DateAndTime fromUnixTime:
		(self currentSessionProperties at: #'expires_at')