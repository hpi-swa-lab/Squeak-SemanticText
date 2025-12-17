*SemanticText-Tools-Conversation-player process-override
stopPlayerProcess: hardStop 
	"Stop the sound player process."
	"SoundPlayer stopPlayerProcess"

	PlayerProcess ifNotNil:
		[PlayerProcess ~~ Processor activeProcess ifTrue:
			[PlayerProcess terminate].
		 self flag: #moveUpstream.
		 PlayerProcess environmentAt: #stopping put: true]. "fixes race condition when starting a new sound with a higher priority while the current player process is stopping"
	(hardStop or: [self soundPluginActive]) ifTrue: [self primSoundStop].
	ActiveSounds isEmpty ifFalse:
		[ActiveSounds := OrderedCollection new].
	Buffer := nil.
	PlayerSemaphore isEmpty ifFalse:
		[PlayerSemaphore := Semaphore forMutualExclusion].
	ReadyForBuffer ifNotNil:
		[Smalltalk unregisterExternalObject: ReadyForBuffer.
		 ReadyForBuffer := nil].
	PlayerProcess := nil