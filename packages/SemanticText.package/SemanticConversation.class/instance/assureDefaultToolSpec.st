accessing - tool specs
assureDefaultToolSpec

	^ toolSpecs at: #default ifAbsentPut: [self newToolSpec]