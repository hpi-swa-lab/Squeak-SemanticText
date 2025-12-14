accessing
shouldTranscribeOutput

	^ (self conversation effectiveConfig outputModalities ifNil: [#(text)])
		includes: #text