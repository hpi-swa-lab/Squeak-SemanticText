fileIn/Out
fromStream: aStream

	| class speciesName |
	speciesName := aStream nextLine.
	class := self environment classNamed: speciesName.
	^ class new readFrom: aStream