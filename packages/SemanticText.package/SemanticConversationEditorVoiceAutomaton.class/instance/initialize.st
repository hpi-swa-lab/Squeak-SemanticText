initialize-release
initialize

	super initialize.
	
	self shouldListen: true.
	self shouldSpeak: true.
	
	messages := SharedQueue new.