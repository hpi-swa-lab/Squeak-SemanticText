accessing
at: key ifAbsent: aBlock 

	| array index |
	[array := self array.
	index := self scanFor: key.
	self array == array] whileFalse.
	^((array at: index) ifNil: [ aBlock ]) value "Blocks and Associations expect #value"