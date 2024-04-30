updating
aspectDependencies

	^ OrderedDictionary new
		at: #canCancel put: #(currentStreamingMessage);
		at: #canComplete put: #(currentStreamingMessage);
		at: #editText put: #(text);
		at: #hasPendingToolCalls put: #(conversation editText);
		at: #labelString put: #(model);
		at: #text put: #(conversation);
		at: #windowTitle put: #(labelString);
		yourself