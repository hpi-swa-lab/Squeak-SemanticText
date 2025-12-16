accessing - streaming
streamedKeys
	
	^Array new: self size streamContents: [:s| self streamedKeysDo: [:key| s nextPut: key]]