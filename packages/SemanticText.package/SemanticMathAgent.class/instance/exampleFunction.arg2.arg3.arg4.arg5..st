functions
exampleFunction: aString arg2: aBoolean arg3: aNumber arg4: anObject arg5: anotherObject
	"Example to demonstrate the declaration of functions."
	<function: example "function comment with ""quotes"" and back\slash"
		(arg1: string "arg1 comment with ""quotes"" and back\slash",
		arg2!: boolean "arg2 is required",
		arg3?: number "arg3 is optional",
		arg4,
		arg5: {
			"type": "string",
			"properties": {
				"enum_item": {
					"enum": ["plonk_griffle"]
				},
				"pattern_string": {
					"type": "string",
					"pattern": "\\w+_[0-9]+"
				}
			}
		} "arg5 has highly complicated JSON schema")> 
	
	^ {aString. aBoolean. aNumber. anObject. anotherObject}