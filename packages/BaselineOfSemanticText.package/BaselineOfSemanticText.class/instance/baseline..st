baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"packages"
		spec package: #SemanticText with:
			[spec postLoadDoIt: #postLoad].
		
		"groups"
		spec group: #default with: #(SemanticText)].