private
withNextActiveToolSpecDo: aBlock

	^ self
		withToolSpec: self nextToolSpec
		do: aBlock