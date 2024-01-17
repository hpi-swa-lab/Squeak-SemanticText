private
newToolSpecWith: tools

	^ self toolSpecClass new
		addTools: tools;
		yourself