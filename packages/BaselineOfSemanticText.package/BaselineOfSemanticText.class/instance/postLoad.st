scripts
postLoad

	self isCI ifTrue: [^ self].
	
	'SemanticText was installed. It is recommended that you <a href="code:// PreferenceBrowser open searchPattern: ''OpenAI API''">set an OpenAI API key now and enter your subscription state</a>. You can enable some examples of this package in the <a href="code:// PreferenceBrowser open selectedCategory: #SemanticText">preferences</a>.' asTextFromHtml editWithLabel: 'Welcome to SemanticText'.