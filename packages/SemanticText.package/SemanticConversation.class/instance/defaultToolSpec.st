accessing
defaultToolSpec
	"The tool spec to use for retrieving any new assistant messages, or nil. May be extended by message-specific tool specs (see #toolSpecFor:)."

	^ self toolSpecFor: #default ifAbsent: [nil]