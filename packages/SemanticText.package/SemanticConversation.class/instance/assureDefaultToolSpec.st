accessing
assureDefaultToolSpec

	^ toolSpecs at: #default ifAbsentPut: [self newToolSpec]