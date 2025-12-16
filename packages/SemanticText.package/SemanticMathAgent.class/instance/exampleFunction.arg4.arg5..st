functions
exampleFunction: aString arg4: anArray arg5: anotherObject
	"Example to demonstrate the declaration of functions."
	<function: example2 "function comment with ""quotes"" and back\slash"
		(arg1: string "arg1 comment with ""quotes"" and back\slash",
		arg4: {
			"type": "array",
			"items": {
				"type": "number"
			}
		},
		arg5: {
			"type": "object",
			"properties": {
				"enum_item": {
					"enum": ["plonk_griffle"]
				},
				"pattern_string": {
					"pattern": "\\w+_[0-9]+"
				}
			},
			"required": ["enum_item", "pattern_string"]
		} "arg5 has highly complicated JSON schema") streamingArguments: true> 
	
	^ {aString. anArray. anotherObject} printString