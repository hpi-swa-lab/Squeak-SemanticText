private - fragments
split: contentString title: titleString do: chunkBlock

	^ self
		split: contentString
		title: titleString
		do: chunkBlock
		maxRecursion: 5