copying
copy
	"We must not copy the running process as it would still listen on the same server connection. Suspend the process temporarily and cancel the copy in #postCopy."

	(process notNil and: [process isSuspended not]) ifFalse:
		[^ super copy].
	
	process suspend.
	^ [super copy]
		ensure: [process resume]