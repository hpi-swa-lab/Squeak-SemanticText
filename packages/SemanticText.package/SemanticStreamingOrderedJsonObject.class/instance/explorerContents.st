tools
explorerContents

	^self streamedKeys replace: [ :key |
		ObjectExplorerWrapper
			with: (self at: key)
			name: (key printString contractTo: 50)
			model: self ]