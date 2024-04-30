accessing
estimateExpense

	self flag: #forLater. "Store real expense from models here! After that, maybe reconsider the extent to which SemanticConversation>>copy should recurse?"
	
	self role = #assistant ifFalse: [^ nil].
	^ self conversation shallowCopy
		messages: (self conversation messages copyUpTo: self);
		estimatePriceToGetAssistantMessage: self