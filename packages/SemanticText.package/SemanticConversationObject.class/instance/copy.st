copying
copy

	^ self shallowCopy
		releaseActionMap;
		postCopyFrom: self;
		releaseForAllEvents "sigh."