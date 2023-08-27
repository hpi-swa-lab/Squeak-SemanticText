accessing
text

	^ String streamContents: [:stream |
		stream
			nextPutAll: self titleText;
			cr; cr;
			nextPutAll: self contentText]