*SemanticText-Model-copying-override
shallowCopy
	"Making copies of Promises is inappropriate; see Promise #similarInstance."
	"self shouldNotImplement"
	self flag: #moveUpstream.
	^ super shallowCopy "ct: needed for veryDeepCopy with nested promises"