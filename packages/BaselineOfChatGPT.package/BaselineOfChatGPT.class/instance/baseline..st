baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"packages"
		spec package: 'ChatGPT'.
		
		"groups"
		spec group: #default with: #('ChatGPT')].