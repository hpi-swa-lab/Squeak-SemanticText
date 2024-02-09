comparing
sortKey

	"#majorVersionNumber descending , #name ascending"
	| maxVersion |
	maxVersion := 1000.
	^ (self majorVersionNumber printStringPadded: (maxVersion log: 10) ceiling)
		, self name