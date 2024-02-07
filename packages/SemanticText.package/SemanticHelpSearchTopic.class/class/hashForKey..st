caches - private
hashForKey: aString

	| hash |
	hash := (SecureHashAlgorithm new hashMessage: aString)
		growto: 20.
	hash := hash semChangeToByteArray. "ByteArray is faster to compare, hash, and file out/in than LargePositiveInteger."
	^ hash