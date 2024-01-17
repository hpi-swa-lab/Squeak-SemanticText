tools
pushTools: tools force: forcedToolsOrNil

	toolSpecs at: #next put:
		(self newToolSpecWith: tools forcedTools: forcedToolsOrNil).