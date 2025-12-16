printing
printElementsOn: aStream 
	self jsonIsComplete ifFalse: [aStream nextPut: $*].
	aStream nextPut: $(.
	self size > 100
		ifTrue: [aStream nextPutAll: 'size '.
			self size printOn: aStream]
		ifFalse: [self streamedKeys sortedSafely
				do: [:key | aStream print: key;
						 nextPutAll: '->';				
						 print: (self streamedAt: key)]
				separatedBy: [aStream space]].
	aStream nextPut: $)