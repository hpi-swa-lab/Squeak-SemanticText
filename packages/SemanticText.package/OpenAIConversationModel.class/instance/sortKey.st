comparing
sortKey

	"#releaseDate descending , #name ascending"
	| age maxAge |
	age := (Date today - (self releaseDate ifNil: [Date today])) days.
	maxAge := 100 "years" * 365 "days".
	^ (age printStringPadded: (maxAge log: 10) ceiling)
		, self name