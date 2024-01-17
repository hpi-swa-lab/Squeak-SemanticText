tests
testSignatureString

	| function |
	function := self classToBeTested name: #name description: 'function comment' build: [:fun |
		fun
			addParameter: #arg1 description: 'arg1 comment' type: #string required: true;
			addParameter: #arg2 description: 'arg2 is required' type: #boolean required: true;
			addParameter: #arg3 description: 'arg3 is optional' type: #number required: false;
			addParameter: #arg4 type: JsonObject new required: true;
			addParameter: #arg5 description: 'arg5 has highly complicated JSON schema' type: '{"type":"object", "properties": {"enum_item": {"enum": ["plonk", "griffle"]}, "pattern_string": {"type": "string", "pattern": "\\w+_[0-9]+"}}, "required": ["enum_item"]}' parseAsOrderedJson required: true].
	
	self
		assert:
			'name "function comment" (arg1: string "arg1 comment", arg2: boolean "arg2 is required", arg3?: number "arg3 is optional", arg4: {}, arg5: {"type":"object","properties":{"enum_item":{"enum":["plonk","griffle"]},"pattern_string":{"type":"string","pattern":"\\w+_[0-9]+"}},"required":["enum_item"]} "arg5 has highly complicated JSON schema")'
		equals: function signatureString.