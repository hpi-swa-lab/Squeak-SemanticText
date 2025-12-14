private
installToolCallResolver

	self conversation toolCallResolver:
		(MessageSend receiver: self selector: #resolveToolCallDuringCompletion:).