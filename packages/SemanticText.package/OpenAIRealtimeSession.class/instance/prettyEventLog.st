tools
prettyEventLog

	^ eventLog
		collect: [:event | event event_id -> (event type -> event)]
		as: OrderedDictionary