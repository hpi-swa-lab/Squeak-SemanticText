accessing
bookBlurb

	self flag: #moveUpstream.
	^ (self perform: self defaultPage) contents