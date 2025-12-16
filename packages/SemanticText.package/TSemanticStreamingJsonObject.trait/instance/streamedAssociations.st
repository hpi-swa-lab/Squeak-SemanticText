accessing - streaming
streamedAssociations

	^Array new: self size streamContents: [ :stream |
		self streamedAssociationsDo: [ :each | stream nextPut: each ] ]