*SemanticText-Search-converting
semChangeToByteArray

	| result size |
	size := self digitLength.
	result := ByteArray new: size.
	1 to: size do: [:index |
		result at: index put: (self digitAt: size - index + 1)].
	^ result