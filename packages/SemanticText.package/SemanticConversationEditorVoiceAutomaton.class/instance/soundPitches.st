sounds
soundPitches

	| high interval low pythagoras |
	low := 440.
	interval := 3 / 2.
	pythagoras := (interval raisedTo: 12) / (2 raisedTo: 7) raisedTo: -1 / 12.
	high := low * 1.5 * pythagoras.
	
	^ {low. high}