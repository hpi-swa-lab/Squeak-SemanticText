as yet unclassified
todo

	self flag: #todo.
	"the following observations were reproduced using audio models only:
	- improve UX for end of speech detection
		- remove clap detection (because meter of microphones will often be too low after that for subsequent messages) but detect silence instead
		- add ui to stop + submit recorded sound?
		- currently shift + mouse move are supported, search for better options (just key?) and alternative shortcut for canceling
	- too long waiting time after saying message
	- ocasionally interrogative sound seems to be late and interrupt subsequent listening
	- click on voice button should not hang, synchrnoous wait is just needed before changing state - fork it all?
	(- test possible race conditions when entering text manually while recording/replying)"