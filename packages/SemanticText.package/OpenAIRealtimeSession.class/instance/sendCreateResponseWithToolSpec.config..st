client events
sendCreateResponseWithToolSpec: aToolSpecOrNil config: aConfigOrNil

	| constructionId |
	constructionId := self makeNewResponseId.
	^ self
		sendClientEvent: #'response.create'
		result: #'response.created' resultKey: constructionId
		with:
			(JsonObject new
				response: (JsonObject new
					metadata: (JsonObject new
						constructionId: constructionId;
						yourself);
					in: [:json |
						aToolSpecOrNil ifNotNil:
							[self addToolSpec: aToolSpecOrNil toInput: json].
						aConfigOrNil ifNotNil: [:config |
							self addConfig: config toResponse: json]];
					yourself);
				yourself)