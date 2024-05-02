private
makeRandomToolCallKey

	| k chars |
	k := 29. "OpenAI API says max 40 characters but its own IDs are currently 29 characters short"
	chars := [($0 to: $9) , ($a to: $z) , ($A to: $Z)] once.
	^ (chars semanticRandomSample: k) join "NB: this is more than twice as fast as generating a single large random number and displaying it in the right base"