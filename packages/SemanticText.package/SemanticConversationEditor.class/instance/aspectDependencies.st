updating
aspectDependencies

	^ OrderedDictionary new
		at: #canComplete put: #(editText);
		at: #canCompleteOrCancel put: #(canComplete);
		at: #completeCancelLabel put: #(currentStreamingMessage);
		at: #editText put: #(text);
		at: #hasPendingToolCalls put: #(conversation editText);
		at: #isStreamingResponse put: #(currentStreamingMessage);
		at: #labelString put: #(model);
		at: #text put: #(conversation);
		at: #voiceButtonColor put: #(voiceState);
		at: #windowTitle put: #(labelString);
		yourself