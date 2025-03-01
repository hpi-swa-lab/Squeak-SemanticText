initialize-release
initialize

	super initialize.
	
	self shouldListen: true.
	self shouldSpeak: true.
	self shouldTranscribeOutput: true.
	
	messages := SharedQueue new.