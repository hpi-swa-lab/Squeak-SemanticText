tools
explorerContents

	^ super explorerContents do: [:wrapper |
		wrapper item key = 'eventLog' ifTrue:
			[wrapper setItem: '#prettyEventLog' -> self prettyEventLog]]