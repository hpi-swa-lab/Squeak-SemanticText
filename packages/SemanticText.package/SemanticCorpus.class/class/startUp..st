system startup
startUp: resuming

	"At this point we know that any swapped-in corpora are preserved in the image snapshot, so we can safely delete their swap files."
	self allSubInstancesDo: [:corpus |
		corpus clearUnusedSwapFile].