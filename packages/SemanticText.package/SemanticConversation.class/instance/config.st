accessing
config

	^ config ifNil: [config := self defaultConfig]