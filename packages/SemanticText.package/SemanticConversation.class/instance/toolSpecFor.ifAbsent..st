accessing
toolSpecFor: aMessage ifAbsent: aBlock
	"The tool spec to use when retrieving new assistant messages in response to aMessage (i.e., for the request where aMessage is/was the last message of the receiver). Extends #defaultToolSpec."

	^ toolSpecs at: aMessage ifAbsent: aBlock