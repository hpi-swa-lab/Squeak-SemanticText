attributes
attributesForRole: role

	^ self roleAttributes at: role ifAbsent:
		[self roleAttributes at: nil ifAbsent: [#()]]