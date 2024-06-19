sounds
affirmationSound

	| pitches |
	pitches := self soundPitches.
	^ MixedSound new
		add: ((FMSound marimba soundForPitch: pitches second dur: 5 loudness: 0.35)
			addEnvelope: (VolumeEnvelope exponentialDecay: 0.92);
			yourself);
		add: (RestSound dur: 0.11)
			, ((FMSound marimba soundForPitch: pitches first dur: 5 loudness: 0.5)
				addEnvelope: (VolumeEnvelope exponentialDecay: 0.94);
				yourself);
		yourself