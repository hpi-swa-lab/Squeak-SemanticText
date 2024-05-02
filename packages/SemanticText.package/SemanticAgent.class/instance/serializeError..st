function calling
serializeError: anError

	^ JsonObject new
		at: #error put: anError description;
		yourself