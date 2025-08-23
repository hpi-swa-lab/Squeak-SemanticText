comparing
sortKey

	"recommendations , #isLegacy ascending , #releaseDate descending , #name ascending"
	| recommendationIndex age maxAge |
	recommendationIndex := 2 - ({self class bestName. self class cheapestName} indexOf: self name).
	age := (Date today - (self releaseDate ifNil: [Date today])) days.
	maxAge := 100 "years" * 365 "days".
	^ recommendationIndex asString
		, self isLegacy asBit asString
		, (age printStringPadded: (maxAge log: 10) ceiling)
		, self name