app - accessing
latestTimeStamp

	^ (self packageInfo methods collect:
		[:method | [TimeStamp fromMethodTimeStamp: method timeStamp] ifError: [TimeStamp new]])
			max