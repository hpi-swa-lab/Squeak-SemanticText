private
cacheSourcesDuring: aBlock
	"Some help topics, e.g., ClassAPIHelpTopic, frequently access the source files."

	^ CurrentReadOnlySourceFiles cacheDuring: aBlock