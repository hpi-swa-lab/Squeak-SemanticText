accessing
forcedTools: aCollectionOrAnyOrNil
	"A collection of tools each of which must be called at least once, or #any to enforce the choice of any single function, or nil to not enforce any tool (i.e., leave the choice to the model)."

	forcedTools := aCollectionOrAnyOrNil.