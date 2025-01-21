accessing
basicContent
	"Both OpenAI and Anthropic messages' content can either take the form of a plain string, or in more special cases, an array of objects, for example:"
	"
	""content"": [
                {""type"": ""text"", ""text"": ""What's in this image?""},
                {
                    ""type"": ""image_url"",
                    ""image_url"": {
                        ""url"": ""https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"",
                    },
                },
            ]
	"
	"If in array of objects format like above, we'll collect the text contents of the objects"
	self flag: #todo. "Maybe show something nicer for images and cache_control points"
	content isArray ifTrue: [
		| textParts textContent |
		textParts := content select: [:message | message type = 'text']
			thenCollect: [:message | message text].
		textContent := ''.
		textParts do: [:part |
			textContent ifEmpty: [
				textContent := textContent , part
			] ifNotEmpty: [
				textContent := textContent , Character cr , part
			]
		].
		^ textContent.
	].
	^ content