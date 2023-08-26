copying
veryDeepCopyWith: deepCopier
	"Sent when doing a very deep copy of the conversation, e.g., when duplicating a conversation editor. We must not copy the running process as it would still listen on the same server connection. Suspend the process temporarily and cancel the copy in #veryDeepFixupWith:."

	(process notNil and: [process isSuspended not]) ifFalse:
		[^ super veryDeepCopyWith: deepCopier].
	
	process suspend.
	^ [super veryDeepCopyWith: deepCopier]
		ensure: [process resume]