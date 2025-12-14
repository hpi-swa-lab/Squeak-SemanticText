copying
veryDeepFixupActionMapWith: deepCopier

	self flag: #(workaround moveUpstream). "deep copier does not handle this! See: https://lists.squeakfoundation.org/archives/list/squeak-dev@lists.squeakfoundation.org/thread/WWTIYL5FG6QRAUZ3D5NAESC7CKCGBLM4"
	EventManager actionMaps associations
		detect: [:assoc |
			assoc key class == self class
				and: [deepCopier references includesKey: assoc key]
				and: [(deepCopier references at: assoc key) == self]]
		ifFound: [:assoc |
			EventManager actionMaps at: self put: (assoc value veryDeepCopyWith: deepCopier)].