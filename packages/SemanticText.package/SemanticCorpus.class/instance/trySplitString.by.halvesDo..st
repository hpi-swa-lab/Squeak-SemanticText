private - fragments
trySplitString: aString by: delimiter halvesDo: chunkBlock

	| chunks tokens bestDiff middle index |
	chunks := (aString splitBy: delimiter) copyWithout: ''.
	
	chunks size = 1 ifTrue: [
		^ false].
	chunks size = 2 ifTrue: [
		chunks do: chunkBlock.
		^ true].
	
	tokens := self embeddingModel countTokensIn: aString.
	bestDiff := middle := tokens // 2.
	index := 0.
	[index := index + 1] doWhileTrue: [
		| left  leftTokens diff |
		left := (chunks first: index) joinSeparatedBy: delimiter.
		leftTokens := embeddingModel countTokensIn: left.
		diff := (middle - leftTokens) abs.
		diff >= bestDiff
			ifFalse: [bestDiff := diff];
			yourself].
	chunkBlock value: ((chunks first: index - 1) joinSeparatedBy: delimiter).
	chunkBlock value: ((chunks allButFirst: index - 1) joinSeparatedBy: delimiter).
	^ true