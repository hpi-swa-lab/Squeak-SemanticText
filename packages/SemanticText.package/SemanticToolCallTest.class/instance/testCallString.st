tests
testCallString

	| function |
	function := self classToBeTested
		key: #plonkCall
		tool: #plonk
		arguments:
			(OrderedJsonObject new
				arg1: 'griffle';
				arg2: true;
				arg4: 42;
				arg5:
					(JsonObject new
						enum_item: #plonk;
						yourself);
				yourself).
	
	self
		assert:
			'plonk(arg1="griffle", arg2=true, arg4=42, arg5={"enum_item":"plonk"})'
		equals: function callString.