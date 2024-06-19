*SemanticText-Providers-OpenAI-methods
openAIHttpPost: url multipartFields: fieldMap do: aBlock

	| boundary |
	boundary := "WebUtils multipartBoundary"UUID new asString. "seriously, they cannot handle extra surrounding dashes in the boundary!"

	^self httpPost: url 
		content: (WebUtils encodeMultipartForm: fieldMap boundary: boundary) 
		type: 'multipart/form-data; boundary=', boundary
		do: aBlock