caches
loadCacheFromFileNamed: fileName

	^ StandardFileStream readOnlyFileNamed: fileName do: [:stream |
		self loadCacheFromStream: stream]