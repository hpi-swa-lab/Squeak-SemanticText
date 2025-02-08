running
tearDown

	[tearDownActions ifNotNil:
		[[tearDownActions isEmpty] whileFalse:
			[tearDownActions removeLast value]]]
		
		ensure: [super tearDown].