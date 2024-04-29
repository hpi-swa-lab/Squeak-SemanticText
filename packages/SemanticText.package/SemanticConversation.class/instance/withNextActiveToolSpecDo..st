private
withNextActiveToolSpecDo: aBlock

	^ self
		withToolSpec: self nextActiveToolSpec
		do: aBlock