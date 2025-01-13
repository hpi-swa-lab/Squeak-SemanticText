private - tokens
printFunctionParameterType: schema on: aStream indent: indent

	true
		caseOf:
			{[schema type = #string] ->
				[schema enum ifNotNil: [:enum |
					enum
						do: [:value |
							aStream
								nextPut: $";
								nextPutAll: value;
								nextPut: $"]
						separatedBy:
							[aStream nextPutAll: ' | '].
					^ self].
				aStream nextPutAll: #string].
			[schema type = #array] ->
				[schema items
					ifNotNil: [:items |
						self printFunctionParameterType: items on: aStream indent: indent]
					ifNil:
						[aStream nextPutAll: 'any'].
				aStream nextPutAll: '[]'].
			[schema type = #object] ->
				[aStream
					nextPut: ${;
					cr.
				self printFunctionParameterSchema: schema on: aStream indent: indent + 2.
				aStream
					cr;
					nextPut: $}].
			[#(integer number) includes: schema type] ->
				[schema enum ifNotNil: [:enum |
					enum
						do: [:value |
							aStream
								nextPut: $";
								nextPutAll: value;
								nextPut: $"]
						separatedBy:
							[aStream nextPutAll: ' | '].
					^ self].
				aStream nextPutAll: 'number'].
			[schema type = #boolean] ->
				[aStream nextPutAll: 'boolean'].
			[schema type = #null] ->
				[aStream nextPutAll: 'null']}
		otherwise:
			[].