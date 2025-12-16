updating
aspectDependencies

	^ OrderedDictionary new
		at: #canComplete put: #(editText);
		at: #canCompleteOrCancel put: #(canComplete isStreamingResponse);
		at: #completeCancelLabel put: #(isStreamingResponse);
		at: #editText put: #(text);
		at: #hasPendingToolCalls put: #(conversation editText);
		at: #labelString put: #(model);
		at: #text put: #(conversation);
		at: #voiceButtonColor put: #(voiceState);
		at: #windowTitle put: #(labelString);
		yourself