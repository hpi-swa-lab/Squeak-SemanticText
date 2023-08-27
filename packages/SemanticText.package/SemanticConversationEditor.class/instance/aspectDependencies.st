updating
aspectDependencies

	^ OrderedDictionary new
		at: #canCancel put: #(currentStreamingMessage);
		at: #canComplete put: #(currentStreamingMessage);
		at: #labelString put: #(model);
		at: #text put: #(conversation);
		at: #windowTitle put: #(labelString);
		yourself