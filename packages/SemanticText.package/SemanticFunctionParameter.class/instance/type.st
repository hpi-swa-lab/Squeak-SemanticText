accessing
type
	"A type specification that matches the JSON Schema Reference (https://json-schema.org/understanding-json-schema/reference/type). Can be a symbol like #string, #number, #array or a JsonObject like {""type"": ""array"", ""minItems"": 2} or {""type"": ""object"", ""properties"": {""count"": {""type"": ""integer""}}} or nil."

	^ type