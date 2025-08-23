comparing
sortKey

	"#isLegacy ascending , #majorVersionNumber descending , #name ascending"
	| maxVersion |
	maxVersion := 1000.
	^ self isLegacy asBit asString
		, (self majorVersionNumber printStringPadded: (maxVersion log: 10) ceiling)
		, self name