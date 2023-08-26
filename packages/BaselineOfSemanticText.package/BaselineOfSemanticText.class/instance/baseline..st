baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"packages"
		spec package: 'SemanticText'.
		
		"groups"
		spec group: #default with: #('SemanticText')].